--[[
	OnChange — the `GetPropertyChangedSignal` special key: `OnChange(name)` key
	factory + its handler, one file (`base/onchange-plan.md` "확정" 절, as-is;
	quad-roblox-owned because the signal lookup itself is the logic —
	`architecture.md` "패키지 경계" 분할 기준).

	  OnChange(propertyName) -> key       -- per-name weak cache: same name =
	                                      -- same object while anything holds it
	                                      -- (AttributeKey's exact technique;
	                                      -- `OnChange "a" == OnChange "a"` is
	                                      -- an intentionally observable fact)
	  Frame { [OnChange "Position"] = function(v: UDim2) ... end }

	No generic parameter — the callback's parameter type is written inline by
	the caller (onchange-plan: a name-taking factory has no field for the
	generator to pre-type; per-property codegen was rejected).

	Handler ("OnChange", NORMAL priority): matches on the KEY being an
	OnChange key object (hash part; v not inspected — `nil` must match, see
	below). process:
	  v == nil  → `Void` (⭐ `H-27`: without this early return, turning a
	              callback off with `None` would plant a Connection that calls
	              `nil` the next time the property changes)
	  otherwise → `inst:GetPropertyChangedSignal(name):Connect(function()
	                v(inst[name]) end)`; the retractor closes over the
	              Connection and disconnects it.
	`State<function>` needs nothing here — StoreBind unwraps and re-dispatches
	(`onchange-plan.md`, "새 메커니즘 없음"). No same-value dedup, same
	reasoning as Handlers/Event.luau.

	Key identity is a module-local weak-key set (Brand.luau's shape) rather
	than a quad-base Brand: quad-roblox never requires quad-base (round14 Q3
	(a)), and the key type is backend-local anyway.
]]

local QuadTypes = require("../../luau_packages/quad_types")
local Types = require("../types")
local SURFACE = QuadTypes.ERROR_LEVEL_SURFACE

export type OnChangeKey = Types.OnChangeKey

-- error namespace of the (first) installing quad — the factory is
-- module-level, so it borrows the namespace at install time (one quad-base
-- copy per process is the supported layout; a second copy shares the same
-- ErrorNamespace contract anyway)
local errNS: any = nil

local keys = setmetatable({} :: { [any]: true }, { __mode = "k" })
local cache = setmetatable({} :: { [string]: any }, { __mode = "v" })

local function isOnChangeKey(x: any): boolean
	return keys[x] == true
end

local function OnChange(name: string): OnChangeKey
	if type(name) ~= "string" then
		-- errNS is set at install; the factory is only reachable through an
		-- installed quad (`q.OnChange`)
		errNS.errorBeforeNearest("OnChange: property name must be a string", SURFACE)
	end
	local cached = cache[name]
	if cached ~= nil then
		return cached
	end
	local key = table.freeze({ Name = name })
	keys[key] = true
	cache[name] = key
	return (key :: any) :: OnChangeKey
end

local function install(quad: any)
	local dispatch = quad.Dispatch
	local Void = quad.Void
	if errNS == nil then
		errNS = quad.errorNamespace
		errNS.setFuncLevel(OnChange, SURFACE) -- `H-238`: public factory tagged
	end

	dispatch.addHandler({
		name = "OnChange",
		isHandlable = function(_inst: any, k: any, _v: any): boolean
			return isOnChangeKey(k)
		end,
		priority = dispatch.HANDLER_PRIORITY_NORMAL,
		process = function(inst: any, k: any, v: any, _index: number): (any?, boolean) -> ()
			if v == nil then
				return Void -- `H-27`
			end
			local name = k.Name
			local callback = v :: (any) -> ()
			local connection = inst:GetPropertyChangedSignal(name):Connect(function()
				callback(inst[name])
			end)
			return function(_nextValue: any?, _retracting: boolean)
				connection:Disconnect()
			end
		end,
	} :: QuadTypes.Handler)
end

return {
	OnChange = OnChange,
	isOnChangeKey = isOnChangeKey,
	install = install,
}
