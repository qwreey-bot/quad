--[[
	Modifier — the immutable, clone-chained property bag (M7 단위 ①). Canon:
	`.claude/base/modifier-plan.md` 3·4·4-1·8·9·2-1절, as-is; Luau mechanics
	measured by `luau-test/done/17` (generic `__index` + `table.clone`,
	private `FieldsKey` store, sibling branches never cross-contaminate).

	  Modifier() -> mod                       -- empty bottom constructor
	  mod:AnyField(value) -> mod'             -- literal: clone + overwrite
	  mod:AnyField(function(old) … end)       -- transform: plain → old raw;
	                                          --   State → old:Compute(fn) (4-1)
	  mod:AnyField(nil)                       -- field ABSENT in mod' (2-1 M-5)
	  mod:AnyField(None)                      -- field = None (the only unsetter)
	  mod:Peek(key) -> T | State<T> | None | nil   -- raw, never :Get()
	  mod:Apply(factory) -> factory(mod)      -- pure call sugar, no contract
	  Modifier.Overridden(a, b, …) / a:Overridden(b, …)
	                                          -- field-wise, later wins, no
	                                          --   State/function branching
	                                          --   (values are already baked)

	Runtime is ONE generic `__index` (no per-class code): any unknown key
	yields a setter closure; the three reserved methods (`Apply`/`Peek`/
	`Overridden`) are looked up first. Field values live in a private table
	under the `FieldsKey` identity — NEVER as literal keys of self (a stored
	raw value would shadow `__index` on the next `mod:X(fn)` call and blow up
	with "attempt to call a number value" — the canon ⚠️ block). Every setter
	clones BOTH the outer table and the fields table (shallow `table.clone`).

	Handler-layer values (Ref/PreRef/PostRef/Observer/Effect/Slot/Modifier)
	reaching a field — literal or returned by a transform — raise immediately
	(4절 정정, 2026-08-09). State/Source pass (4-1). `State<Ref>`-style inner
	contents are documented UB, not inspected. The mirror guard (a Modifier as
	a State/Source VALUE) lives in Source.luau/State.luau since M2 (7절).

	flatten (단위 ②, "flatten의 정확한 형태" 절 as-is): in-place, reverse
	`for` over the array part (later modifier wins because "already set →
	skip" is first-writer-wins), inline hash keys — including inline `None` —
	always win, each consumed slot becomes the `ProcessedModifier` sentinel
	(no holes → array order kept). `Dispatch.drive` owns the call as its
	first pre-pass (round17 §0 Q4 (a)) — `New` ③ and `Claim` both get it
	through drive. `ProcessedModifierHandler` (Dispatch/Modifier.luau)
	catches the sentinel and registers None/0 bookkeeping.
]]

local Brand = require("./Brand")
local QuadTypes = require("../luau_packages/quad_types")
local Err = require("./ErrorNamespace")
local SURFACE = QuadTypes.ERROR_LEVEL_SURFACE

local ModifierBrand = Brand.ModifierBrand
local isModifier = Brand.isModifier
local isState = Brand.isState
local isRef = Brand.isRef -- covers PreRef/PostRef (Brand.luau predicate)
local isObserver = Brand.isObserver
local isEffect = Brand.isEffect
local SlotBrand = Brand.SlotBrand

-- private field store key — a unique table identity, can never collide with a
-- user field name (spike 17 / spike 11 idiom)
local FieldsKey = table.freeze({})

local function isHandlerLayerValue(v: any): boolean
	return isRef(v) or isObserver(v) or isEffect(v) or SlotBrand:is(v) or isModifier(v)
end

local ModifierMT = {}

local function newModifier(fields: { [any]: any }): any
	local mod = setmetatable({ [FieldsKey] = table.freeze(fields) }, ModifierMT)
	ModifierBrand:register(mod)
	return table.freeze(mod)
end

-- reserved methods (checked before the generic setter — 8절 "구현 시 주의")
local methods = {}

function methods.Peek(self: any, key: any): any
	return self[FieldsKey][key] -- raw: State handle stays a handle, None stays None
end

function methods.Apply(self: any, factory: (any) -> any): any
	return factory(self) -- nothing more, nothing less (8절)
end

-- Modifier.Overridden(a, b, ...) — later argument wins field by field. Colon
-- form `a:Overridden(b)` is the same function (self becomes the first arg).
local function Overridden(...: any): any
	local n = select("#", ...)
	if n == 0 then
		Err.errorBeforeNearest("Modifier.Overridden: expects at least one Modifier", SURFACE)
	end
	local merged: { [any]: any } = {}
	for i = 1, n do
		local arg = select(i, ...)
		if not isModifier(arg) then
			Err.errorBeforeNearest(`Modifier.Overridden: argument #{i} is not a Modifier (got {typeof(arg)})`, SURFACE)
		end
		for k, v in arg[FieldsKey] do
			merged[k] = v -- baked values only — no State/function branching (9절)
		end
	end
	return newModifier(merged)
end
methods.Overridden = Overridden

-- generic setter synthesis — the whole per-field runtime (4절)
function ModifierMT.__index(_self: any, key: any): any
	local method = methods[key]
	if method ~= nil then
		return method
	end
	return function(selfArg: any, arg: any): any
		local oldFields = selfArg[FieldsKey]
		local old = oldFields[key]
		local value: any
		if type(arg) == "function" then
			local transform = arg :: (any) -> any
			if isState(old) then
				value = old:Compute(transform) -- 4-1: derived State, reactivity kept
			else
				value = transform(old) -- plain: current raw value, called now
			end
		else
			value = arg -- literal (a State literal replaces the whole field; nil = absent)
		end
		if isHandlerLayerValue(value) then
			-- level 2 = the user's `mod:Field(...)` line (the closure is not
			-- table-reached, so no tag — `H-250`)
			error(`Modifier: field "{tostring(key)}" cannot hold a handler-layer value (Ref/Observer/Effect/Slot/Modifier)`, 2)
		end
		local newFields = table.clone(oldFields)
		newFields[key] = value
		return newModifier(newFields)
	end
end

local Modifier = setmetatable({ Overridden = Overridden }, {
	-- TODO(H-310): arguments are silently ignored — canon 3절 hints at an
	-- optional `args` (initial fields?); shape awaits the round17 §4 reply
	__call = function(_self: any): any
		return newModifier({})
	end,
})
table.freeze(Modifier)

-- `H-238`: public surface tagged (Overridden is reached both as
-- Modifier.Overridden and as the colon method — same function object)
Err.setFuncLevel(getmetatable(Modifier).__call, SURFACE)
Err.setFuncLevel(Overridden, SURFACE)

-- internal sentinel that fills a consumed array slot (never user-facing —
-- `Processed*` idiom, same frozen+named shape as `None`)
local ProcessedModifier = table.freeze(setmetatable({ __quadProcessedModifier = true :: true }, {
	__tostring = function()
		return "ProcessedModifier"
	end,
}))

-- flatten(input) -> input — canon pseudocode 1:1 (modifier-plan "flatten의
-- 정확한 형태"). Mutates and returns the same table.
local function flatten(input: { [any]: any }): { [any]: any }
	-- TODO(H-312): a Modifier at a HASH key is not consumed (only the array
	-- part is scanned) and reaches the key's handler raw — whether flatten
	-- should reject it awaits the round17 §4 reply
	for i = #input, 1, -1 do -- ⚠️ reverse: the LAST modifier must write first
		local value = input[i]
		if not isModifier(value) then
			continue
		end
		input[i] = ProcessedModifier -- consume the slot, keep the array hole-free
		for key, modValue in value[FieldsKey] do
			if input[key] ~= nil then
				-- already taken — an inline key (present before this loop, `None`
				-- included) or a later modifier (visited earlier) wins
				continue
			end
			input[key] = modValue
		end
	end
	return input
end

return {
	Modifier = Modifier,
	flatten = flatten,
	ProcessedModifier = ProcessedModifier,
	_FieldsKey = FieldsKey, -- specs only (private)
}
