--!nocheck
--[[
	M10 엔진 축 둘째 단위(2026-09-03) — `Handlers/Event.luau`(문자열 키 +
	`GetEventsOfClass` 리플렉션, self 미전달, `None`/`nil`이면 Connect 안 함)와
	`Handlers/OnChange.luau`(`OnChange(name)` 키 팩토리 + 이름별 weak 캐시 +
	`GetPropertyChangedSignal` 바인딩, `H-27` `v == nil` 얼리리턴).
	정본: `base/event-plan.md` 두 절, `base/onchange-plan.md` "확정" 절,
	`bind-system-plan.md` "인스턴스 생성 / 이벤트 네이밍 인체공학" 절.

	CLI 실주행 심(spec.handlers 관용구): `getfenv(install).game`에 mock의
	`gameShim` — Property 심(디스크립터 배열)과 이벤트 심(`mock.declareEvents`
	한 레지스트리에서 `inst[name]` 시그널과 `GetEventsOfClass` 둘 다). 실물
	RBXScriptSignal/Reflection 회귀는 Studio 실측(`audit/m10-events-studio-*`).
]]

local Quad = require("../luau_packages/quad_base")
local QuadRoblox = require("../src").QuadRoblox
local installProperty = require("../src/Handlers/Property")
local installEvent = require("../src/Handlers/Event")
local mock = require("../../quad-base/test/mock")

local SPEC_FILE = "spec.events.luau"

local W = { Write = "" }
local REFLECTED = {
	TextButton = {
		{ Name = "Name", Permits = W },
		{ Name = "Text", Permits = W },
		{ Name = "Visible", Permits = W },
	},
	Frame = {
		{ Name = "Name", Permits = W },
		{ Name = "Visible", Permits = W },
	},
}
mock.declareEvents("TextButton", { "MouseButton1Click", "Activated" })
mock.declareEvents("Frame", { "MouseEnter" })
local gameShim = mock.gameShim(REFLECTED)

local q = Quad.New():UseProvider(QuadRoblox)
;(getfenv(installProperty)).game = gameShim
;(getfenv(installEvent)).game = gameShim
;(getfenv(q.D.New)).Instance = { new = mock.Instance.new }
q.isInst = mock.isMockInstance
q.errorNamespace.setFuncLevel(q.isInst, require("../luau_packages/quad_types").ERROR_LEVEL_SURFACE)

-- 살아있는 연결 수(mock Signal 내부 — 관측 전용). mock의 Disconnect/
-- DisconnectAll이 끊긴 항목을 배열에서 바로 빼므로 길이가 곧 생존 수다.
local function liveConnections(sig)
	return #sig.connections
end

print("=== 1. Event — 리플렉션 매치로 Connect, 엔진 인자만 그대로(self 없음) ===")
do
	local got = nil
	local b = q.D.TextButton({
		Name = "Btn",
		Activated = function(...)
			got = { n = select("#", ...), ... }
		end,
	})
	assert(b.Name == "Btn", "sibling property still assigned (Property/Event sets disjoint)")
	b.Activated:Fire("inputObject", 2)
	assert(got and got.n == 2 and got[1] == "inputObject" and got[2] == 2, "callback received exactly the engine args — no self prepended")
	print("PASS")
end

print()
print("=== 2. 클래스별 판별 — 다른 클래스의 이벤트 이름은 매치 안 됨(no-match error, 사용자 blame) ===")
do
	local ok, err = pcall(function()
		q.D.Frame({ MouseButton1Click = function() end })
	end)
	assert(not ok, "MouseButton1Click is not a Frame event")
	mock.assertBlamesUser(err, SPEC_FILE, "foreign event key")
	print("PASS")
end

print()
print("=== 3. Event store-bind — None으로 끄면 Connect 안 함(nil 매치), 다시 켜면 재연결 ===")
do
	local calls = 0
	local src = q.Source(function()
		calls += 1
	end)
	local b = q.D.TextButton({ MouseButton1Click = src })
	local sig = b.MouseButton1Click
	assert(liveConnections(sig) == 1, "reactive callback connected once")
	sig:Fire()
	assert(calls == 1, "reactive callback fired")

	src:Set(q.None) -- NoneHandler → nil 재귀 → EventHandler(v == nil)
	assert(liveConnections(sig) == 0, "None disconnected and did NOT plant a new connection")
	sig:Fire()
	assert(calls == 1, "nothing runs while off (and no nil-call crash)")

	src:Set(function()
		calls += 10
	end)
	assert(liveConnections(sig) == 1, "re-enabled: exactly one live connection")
	sig:Fire()
	assert(calls == 11, "the NEW callback runs, the old one is gone")

	-- 평문 교체(디스패치 직접) — 옛 연결은 끊기고 하나만 남는다
	q.Dispatch.process(b, "MouseButton1Click", function()
		calls += 100
	end, 1)
	assert(liveConnections(sig) == 1, "plain replacement keeps a single connection")
	sig:Fire()
	assert(calls == 111, "replacement callback runs alone")
	-- 철거
	q.Dispatch.retractFrom(b, "MouseButton1Click", 1)
	assert(liveConnections(sig) == 0, "retraction disconnects")
	print("PASS")
end

print()
print("=== 4. OnChange — 프로퍼티 변경 시그널에 새 값으로 콜백, 캐시 동등성 ===")
do
	local OnChange = q.OnChange
	assert(OnChange("Text") == OnChange("Text"), "same name → same key object (weak cache)")
	assert(OnChange("Text") ~= OnChange("Name"), "different names → different keys")
	assert(OnChange("Text").Name == "Text", "key carries the property name")

	-- ⚠️ 초기 props에 `Text = "a"`를 같이 두지 않는다 — 해시 파트 안의 순서는
	-- 계약 밖(dispatch-core "배열→해시 순서"만 약속)이라 그 초기 대입이 이
	-- 콜백을 깨울지가 비결정(`H10-11`). spec은 바인드 뒤의 변경만 본다.
	local seen = {}
	local b = q.D.TextButton({
		[OnChange("Text")] = function(v)
			table.insert(seen, v)
		end,
	})
	assert(#seen == 0, "no call at bind time (no property write in the same props)")
	b.Text = "b"
	b.Text = "c"
	assert(#seen == 2 and seen[1] == "b" and seen[2] == "c", "callback gets the CURRENT value per change")
	b.Name = "x"
	assert(#seen == 2, "other properties do not trigger it")

	local ok, err = pcall(function()
		return OnChange(42)
	end)
	assert(not ok, "non-string name rejected")
	mock.assertBlamesUser(err, SPEC_FILE, "OnChange(42)")
	print("PASS")
end

print()
print("=== 5. OnChange H-27 — None으로 끄면 nil을 부르는 Connection이 심기지 않는다 ===")
do
	local calls = 0
	local src = q.Source(function()
		calls += 1
	end)
	local b = q.D.TextButton({ [q.OnChange("Text")] = src })
	local sig = b:GetPropertyChangedSignal("Text")
	assert(liveConnections(sig) == 1, "connected once")
	b.Text = "b"
	assert(calls == 1, "reactive callback fired")

	src:Set(q.None)
	assert(liveConnections(sig) == 0, "H-27: no connection left after None")
	b.Text = "c" -- 얼리리턴이 빠져 있었다면 여기서 attempt to call a nil value
	assert(calls == 1, "off: nothing runs, nothing crashes")

	src:Set(function(v)
		calls += 10
	end)
	b.Text = "d"
	assert(calls == 11 and liveConnections(sig) == 1, "re-enabled with a single connection")

	q.Dispatch.retractFrom(b, q.OnChange("Text"), 1)
	assert(liveConnections(sig) == 0, "retraction disconnects")
	print("PASS")
end

print()
print("=== 6. 교대 — 같은 이벤트 자리의 평문/State 교체가 연결을 하나로 유지, 다른 quad와 키 공유 ===")
do
	local b = q.D.TextButton({ MouseButton1Click = function() end })
	local sig = b.MouseButton1Click
	local src = q.Source(function() end)
	q.Dispatch.process(b, "MouseButton1Click", src, 1) -- 평문 → State
	assert(liveConnections(sig) == 1, "plain → reactive keeps one connection")
	src:Set(function() end) -- 같은 자리 재발행: Disconnect+Connect 1회(churn 허용, dedup 없음)
	assert(liveConnections(sig) == 1, "re-emission keeps one connection")

	-- OnChange 키 팩토리는 모듈 레벨 — 두 quad 인스턴스가 같은 키를 본다
	local q2 = Quad.New():UseProvider(QuadRoblox)
	assert(q2.OnChange("Text") == q.OnChange("Text"), "module-level cache: keys are shared across quad instances")
	print("PASS")
end

print()
print("=== ALL PASS ===")
