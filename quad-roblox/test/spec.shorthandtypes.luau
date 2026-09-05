--!strict
--[[
	InstanceShorthand 타입 표면 — strict 양성(round20 단위 ②, `H-336`). 생성 D의
	GuiObject 계열 `<Class>Param`·`<Class>Modifier`에 `UICorner`(number | UDim)/
	`UIPadding`(UDim)/`UIPaddingOffset`(number)/`UIScale`(number)가 실프로퍼티와
	같은 값 유니언(`PVn` — T | State<T> | TweenData<T> | State<Tween<T>> | None)으로
	들어가고, GuiObject가 아닌 클래스(ScreenGui 등)엔 없다. 음성은 스크래치 실측.
]]

local Quad = require("../luau_packages/quad_base")
local QuadRoblox = require("../src").QuadRoblox

local q = Quad.New():UseProvider(QuadRoblox)

local function _types()
	local radius = q.Source(8)
	local f = q.D.Frame({
		UICorner = 8,
		UIPadding = UDim.new(0, 4),
		UIPaddingOffset = 4,
		UIScale = radius:Apply(q.Animate({ Time = 0.2 })),
	})
	local f2 = q.D.TextLabel({ UICorner = UDim.new(0.5, 0), UIScale = q.Source(1.5) })
	local f3 = q.D.ImageButton({ UICorner = q.Tween({ Value = 12, Time = 0.3 }) })
	local m = q.D.Modifier.Frame():UICorner(8):UIPadding(UDim.new(0, 2)):UIPaddingOffset(radius):UIScale(q.Tween({ Value = 1 }))
	local mAbove = q.D.Modifier.GuiObject():UICorner(4) -- 상위 클래스 Modifier에도
	return f, f2, f3, m, mAbove
end

print("=== 1. 런타임 대응 — 생성 D의 숏핸드 키가 실제 핸들러에 닿는다(mock 없이 타입만 — 본문은 실행하지 않음) ===")
print("PASS")
print()
print("=== ALL PASS ===")
