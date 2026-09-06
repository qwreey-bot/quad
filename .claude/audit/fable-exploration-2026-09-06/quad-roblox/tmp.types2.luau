--!strict
local Quad = require("../luau_packages/quad_base")
local QuadRoblox = require("../src").QuadRoblox
local q = Quad.New():UseProvider(QuadRoblox)
local D = q.D
local QuadTypes = require("../luau_packages/quad_types")
type State<T> = QuadTypes.State<T>
type Tween<T> = QuadTypes.Tween<T>
local numS = q.Source(1)
local udimS = q.Source(UDim2.new())
-- L10 State<number> into UDim2 slot (expect ERR)
local a1 = D.Frame({ Size = numS })
-- L12 State<UDim2> into number slot (expect ERR)
local a2 = D.Frame({ ZIndex = udimS })
-- L14 annotated State<Tween<number>> into UDim2 slot (expect ERR)
local tw1: State<Tween<number>> = numS:Compute(function(x) return q.Tween({ Value = x:Get() }) end)
local a3 = D.Frame({ Size = tw1 })
-- L17 Source<Tween<number>> into UDim2 slot (expect ERR)
local a4 = D.Frame({ Size = q.Source(q.Tween({ Value = 1 })) })
-- L19 Source<Tween<UDim2>> into UDim2 slot (expect OK)
local a5 = D.Frame({ Size = q.Source(q.Tween({ Value = UDim2.new() })) })
-- L21 State<Tween<string>> into number slot (expect ERR)
local tw2: State<Tween<string>> = numS:Compute(function(x) return q.Tween({ Value = tostring(x:Get()) }) end)
local a6 = D.Frame({ ZIndex = tw2 })
-- L24 State<Tween<UDim2>> into number slot (expect ERR)
local tw3: State<Tween<UDim2>> = udimS:Compute(function(x) return q.Tween({ Value = x:Get() }) end)
local a7 = D.Frame({ ZIndex = tw3 })
-- L27 modifier field State<Tween<number>> into Size (expect ERR)
local m1 = D.Modifier.Frame():Size(tw1)
-- L29 modifier field State<number> into Size (expect ERR)
local m2 = D.Modifier.Frame():Size(numS)
return { a1, a2, a3, a4, a5, a6, a7, m1, m2 }
