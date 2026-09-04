--[[
	Modifier — the immutable, clone-chained property bag (M7 단위 ①). Canon:
	`.claude/base/modifier-plan.md` 3·4·4-1·8·9·2-1절, as-is; Luau mechanics
	measured by `luau-test/done/17` (generic `__index` + `table.clone`,
	private `FieldsKey` store, sibling branches never cross-contaminate).

	  Modifier(...) -> mod                    -- [H-310, 사용자 확정 2026-09-04]
	                                          --   each arg: a Modifier or a plain
	                                          --   { field = value } table; later
	                                          --   args override field-wise
	                                          --   (Overridden semantics); no args
	                                          --   = empty (Modifier() == Modifier({}))
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

	flatten (단위 ②, "flatten의 정확한 형태" 절 as-is; `H-312`: a Modifier at a
	hash key is rejected first): in-place, reverse
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
	-- `__quadModifier`: type MARKER (H-300 idiom) so the backend children
	-- union can admit every generated `<Class>Modifier` by width subtyping
	-- (unit ③ — putting the recursive per-class table types into the union
	-- blows the solver). A literal key, so it never reaches `__index`.
	local mod = setmetatable({ [FieldsKey] = table.freeze(fields), __quadModifier = true }, ModifierMT)
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

-- Modifier(a, b, ...) — `H-310` (사용자 확정: the SHAPE — each argument is a
-- Modifier or a plain `{ field = value }` table, fields merge in order, later
-- wins like Overridden, `Modifier()` == `Modifier({})`). The validation
-- rules below are AGENT additions (round17 `H-310` row, vetoable):
--   - a "field table" is a metatable-less plain table — any other quad
--     object (Source/State/Ref/None …) is rejected instead of having its
--     internals merged as fields (review finding);
--   - keys must be field names (strings);
--   - values take the setter's handler-layer check, and a FUNCTION value is
--     rejected: the setter reads a function as a transform (4절), and
--     storing it raw here would make the two construction paths diverge
--     silently — use `mod:Field(fn)` for transforms.
local function isPlainFieldTable(arg: any): boolean
	return type(arg) == "table" and getmetatable(arg) == nil and not isState(arg) and not isHandlerLayerValue(arg)
end

local Modifier = setmetatable({ Overridden = Overridden }, {
	__call = function(_self: any, ...: any): any
		local merged: { [any]: any } = {}
		for i = 1, select("#", ...) do
			local arg = select(i, ...)
			if isModifier(arg) then
				for k, v in arg[FieldsKey] do
					merged[k] = v
				end
			elseif isPlainFieldTable(arg) then
				for k, v in arg :: { [any]: any } do
					if type(k) ~= "string" then
						Err.errorBeforeNearest(`Modifier: initial-field table keys must be field names (got {typeof(k)} at argument #{i})`, SURFACE)
					end
					if type(v) == "function" then
						Err.errorBeforeNearest(`Modifier: field "{k}" in an initial-field table cannot be a function — use mod:{k}(fn) for a transform`, SURFACE)
					end
					if isHandlerLayerValue(v) then
						Err.errorBeforeNearest(`Modifier: field "{k}" cannot hold a handler-layer value (Ref/Observer/Effect/Slot/Modifier)`, SURFACE)
					end
					merged[k] = v
				end
			else
				Err.errorBeforeNearest(`Modifier: argument #{i} must be a Modifier or a plain field table (got {typeof(arg)})`, SURFACE)
			end
		end
		return newModifier(merged)
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
	-- `H-312` (사용자 확정 2026-09-04): a Modifier at a HASH key is a misuse —
	-- there is nothing to merge it into, and letting it through hands the
	-- key's handler a raw table (engine error blamed inside quad). Reject
	-- here, before any slot is consumed. errorBefore: flatten runs inside
	-- the tagged `drive`, so the OUTERMOST tagged frame's caller (the
	-- user's `D.Frame{}` / `drive` line) is charged (`H-272` reasoning).
	-- Walk the HASH part only (review: a full pass would visit the array part
	-- twice on every drive): `next` continued from the last array key skips
	-- the hole-free array part; sparse numeric keys live in the hash part and
	-- are caught too (a Modifier at `[5]` beyond `#input` is not consumed).
	local n = #input
	local k: any = if n > 0 then n else nil
	while true do
		local v: any
		k, v = next(input, k)
		if k == nil then
			break
		end
		if isModifier(v) then
			Err.errorBefore(`Modifier: a Modifier cannot be a value of key "{tostring(k)}" — place it in the array part`, SURFACE)
		end
	end
	for i = n, 1, -1 do -- ⚠️ reverse: the LAST modifier must write first
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
