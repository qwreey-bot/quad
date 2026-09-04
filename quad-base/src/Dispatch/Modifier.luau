--[[
	ProcessedModifierHandler — the nop terminal that catches the slot
	`flatten` consumed (`.claude/base/modifier-plan.md` "flatten의 정확한
	형태" 절의 `H-35` 의사코드, as-is; same shape as the `Processed*` handlers
	PreRef/PostRef get in M8). Matches `v == ProcessedModifier` anywhere
	(the sentinel only ever sits at array positions), registers the position
	out of the order math — offsetSource FIRST, then length 0 (release-order
	contract, NilHandler idiom) — and retracts with `Void`: flatten has
	already happened, there is nothing to undo.

	Registered per module instance by InitDispatch next to the None pair
	(quad-base fills its own registry — "base가 소유하는 핸들러").
]]

local Void = require("../Void")
local QuadTypes = require("../../luau_packages/quad_types")
local ModifierModule = require("../Modifier")
local NoneModule = require("./None")

local ProcessedModifier = ModifierModule.ProcessedModifier

local module = {}

function module.register(dispatch: QuadTypes.Dispatch)
	dispatch.addHandler({
		name = "ProcessedModifierHandler",
		isHandlable = function(_inst: any, _k: any, v: any): boolean
			return v == ProcessedModifier
		end,
		priority = dispatch.HANDLER_PRIORITY_HIGH, -- "매우 높음, ProcessedPreRefHandler와 동급"
		process = function(inst: any, k: any, _v: any, _index: number): (any?, boolean) -> ()
			NoneModule.registerEmptySlot(dispatch, inst, k, inst) -- offsetSource → length 0 (`H-35`)
			return Void
		end,
	})
end

return module
