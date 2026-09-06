--!strict
-- explorer type probe (delete after): each "EXPECT-ERR" line should be flagged by luau-lsp; "EXPECT-OK" must be clean.
local Quad = require("../luau_packages/quad_base")
local QuadRoblox = require("../src").QuadRoblox
local q = Quad.New():UseProvider(QuadRoblox)
local D = q.D

local numS = q.Source(1)
local boolS = q.Source(true)
local udimS = q.Source(UDim2.new())

-- EXPECT-OK
local ok1 = D.Frame({ Visible = boolS, Size = udimS })
-- EXPECT-ERR 15: State<number> into boolean slot
local e1 = D.Frame({ Visible = numS })
-- EXPECT-ERR 17: Tween<string> into UDim2 slot
local e2 = D.Frame({ Size = q.Tween({ Value = "str" }) })
-- EXPECT-OK
local ok2 = D.Frame({ Size = q.Tween({ Value = UDim2.new(), Time = 1 }) })
-- EXPECT-ERR 21: Time must be number
local e3 = q.Tween({ Value = 1, Time = "1" })
-- EXPECT-ERR 23: sibling-class Ref in Frame children
local tl = q.Ref(nil :: TextLabel?)
local e4 = D.Frame({ tl })
-- EXPECT-OK ancestor box
local go = q.Ref(nil :: GuiObject?)
local ok3 = D.Frame({ go })
-- EXPECT-ERR 28: modifier transform returning wrong type
local m1 = D.Modifier.Frame():Size(function(old) return "str" end)
-- EXPECT-OK modifier transform returning Tween<UDim2>
local m2 = D.Modifier.Frame():Size(function(old) return q.Tween({ Value = UDim2.new() }) end)
-- EXPECT-ERR 32: sibling-class modifier in Frame children
local e5 = D.Frame({ D.Modifier.TextLabel() })
-- EXPECT-OK ancestor modifier
local ok4 = D.Frame({ D.Modifier.GuiObject() })
-- EXPECT-ERR 36: State<Tween<number>> into UDim2 slot
local tw = numS:Compute(function(x) return q.Tween({ Value = x:Get() }) end)
local e6 = D.Frame({ Size = tw })
-- EXPECT-ERR 39: Text = function (not a property type, not event)
local e7 = D.Frame({ Text = function() end })
-- EXPECT-OK OnChange typed
local ok5 = D.Frame({ q.OnChange("Visible", function(v: boolean) end) })
-- EXPECT-ERR 43: OnChange callback wrong param type
local e8 = D.Frame({ q.OnChange("Visible", function(v: number) end) })
-- EXPECT-ERR 45: Tween:Mapped result type mismatch into number slot
local mapped = q.Tween({ Value = 1 }):Mapped(function(n) return tostring(n) end)
local e9 = D.Frame({ ZIndex = mapped })
return { ok1, e1, e2, ok2, e3, e4, ok3, m1, m2, e5, ok4, e6, e7, ok5, e8, e9 }
