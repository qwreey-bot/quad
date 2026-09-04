--!strict
--[[
	Modifier 타이핑(M7 단위 ③) — 생성 `<Class>Modifier`/`D.Modifier.<Class>()`/
	`Field<V>`가 실물 규모(D 스코프 전체)에서 strict를 통과하는가. 양성만 담고
	본문은 실행하지 않는다(spec.onchangetypes 관례). 음성(타입 불일치·다른
	클래스 setter·다른 클래스 팩토리)은 착수 전 스크래치에서 실측(round17 `H-313`).
]]

local Quad = require("../luau_packages/quad_base")
local QuadRoblox = require("../src").QuadRoblox
local QuadTypes = require("../luau_packages/quad_types")
local DModule = require("../src/D")
local Types = require("../src/types")
type State<T> = QuadTypes.State<T>
type None = QuadTypes.None
type Tween<T> = Types.Tween<T>

local q = Quad.New():UseProvider(QuadRoblox)

local function _neverCalled()
	local D = q.D
	-- 클래스별 setter: 리터럴 / State / None / 변환 함수(old는 저장된 그대로)
	-- State 필드: `State<T>`는 `Set` 때문에 불변이라 필드 값 유니언(`UDim2 | Tween<UDim2>`)
	-- 으로 캐스트해 만든다(typing-limits 8.7 캐비엇 5 — 반응형 자식·OnChange와 같은 규칙)
	local size = q.Source(UDim2.new() :: UDim2 | Tween<UDim2>)
	local m = D.Modifier.Frame():Size(UDim2.new()):Visible(true):BackgroundColor3(q.None):ZIndex(function(old)
		local _: number | Tween<number> | State<number | Tween<number>> | None | nil = old
		return 3
	end)
	local m2 = m:Size(size) -- State 필드(4-1: 리터럴 State는 통째 교체)
	-- Peek<<T>>: 호출부가 T를 명시(정본 9절), 반환은 raw 유니언 그대로
	local peeked: UDim2 | State<UDim2> | None | nil = m2:Peek<<UDim2>>("Size")
	-- Apply: 팩토리가 클래스 타입을 받는다
	local Boldify = function(mod: DModule.TextButtonModifier): DModule.TextButtonModifier
		return mod:TextSize(20)
	end
	local b = D.Modifier.TextButton():Text("x"):Apply(Boldify)
	-- Overridden은 any(스파이크 09) — 닷·콜론 둘 다
	local merged = q.Modifier.Overridden(m, m2)
	local merged2 = m:Overridden(m2)
	-- children: 마커 폭 서브타이핑으로 어느 클래스 Modifier든 들어간다(클래스 소속은 setter가 검사)
	local f = D.Frame({ m2, Name = "typed", D.Modifier.Frame():Visible(false) })
	local baseMod = q.Modifier() -- base 무타입 Modifier도 마커로 통과
	local f2 = D.Frame({ baseMod })
	local mapped = D.Mapper.Frame("Body")({ m })
	return peeked, b, merged, merged2, f, f2, mapped
end

print("=== ALL PASS ===")
