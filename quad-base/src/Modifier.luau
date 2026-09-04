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

	Class tags + casts (M7 단위 ④, 2026-09-04 — modifier-plan 11절, user design):
	  Modifier.Define(name, parent?) -> ctor  -- register a modifier CLASS (any
	                                          --   engine class, component, or
	                                          --   virtual object — base owns the
	                                          --   registry, the provider is just
	                                          --   its first client); returns the
	                                          --   tagged constructor (same shape
	                                          --   as Modifier(...), tag = name)
	  mod:As<Name>() -> mod'                  -- CHECKED downcast: Name must be
	                                          --   Defined and mod's tag must be
	                                          --   untyped (true), Name itself, or
	                                          --   an ancestor of Name; else error
	  mod:As() / mod:As(name) -> mod'         -- UNCHECKED: no arg = self as-is
	                                          --   (type-only cast); name = retag
	                                          --   with existence check only
	Every `As%u` key is reserved for casts — it can never become a field setter
	(a typo `AsTextLabl` errors instead of silently minting a field). Tags live
	in the `__quadModifier` literal (H-300 marker): `true` for untyped, the
	class name for tagged values — the generated per-class types declare the
	same literal, so the tag the type promises IS the tag the value carries.

	Runtime is ONE generic `__index` (no per-class code): reserved methods
	(`Apply`/`Peek`/`Overridden`/`As`) → cast prefix → any other key yields a
	setter closure. Field values live in a private table under the `FieldsKey`
	identity — NEVER as literal keys of self (a stored raw value would shadow
	`__index` on the next `mod:X(fn)` call and blow up with "attempt to call a
	number value" — the canon ⚠️ block). Every setter clones BOTH the outer
	table and the fields table (shallow `table.clone`).

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
	catches the sentinel and registers None/0 bookkeeping. flatten never
	looks at tags — a tag only ever gates `As<Name>()`.
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

-- `tag`: `true` (untyped) or a Defined class name. Fields may arrive already
-- frozen (retag path) — `table.freeze` raises on a frozen table.
local function newModifier(fields: { [any]: any }, tag: any): any
	if not table.isfrozen(fields) then
		table.freeze(fields)
	end
	-- `__quadModifier`: type MARKER (H-300 idiom) — the backend children union
	-- admits a class-tagged marker `{ read __quadModifier: "<Class>" | … }` per
	-- class (unit ④; the recursive per-class table types themselves blow the
	-- solver — unit ③). A literal key, so it never reaches `__index`.
	local mod = setmetatable({ [FieldsKey] = fields, __quadModifier = tag }, ModifierMT)
	ModifierBrand:register(mod)
	return table.freeze(mod)
end

-- ── class registry (Define / As) ────────────────────────────────────────────
-- name -> parent name | false (root). Module-level like Brand/None: two
-- coexisting quad-base copies get separate registries (documented copy-split).
local defined: { [string]: string | false } = {}
local constructors: { [string]: any } = {}

local function isAncestorOrSelf(ancestor: string, name: string): boolean
	local node: any = name
	while node do
		if node == ancestor then
			return true
		end
		node = defined[node] or nil
	end
	return false
end

local function retag(mod: any, tag: any): any
	return newModifier(mod[FieldsKey], tag)
end

-- reserved methods (checked before the cast prefix and the generic setter —
-- 8절 "구현 시 주의")
local methods = {}

function methods.Peek(self: any, key: any): any
	return self[FieldsKey][key] -- raw: State handle stays a handle, None stays None
end

function methods.Apply(self: any, factory: (any) -> any): any
	return factory(self) -- nothing more, nothing less (8절)
end

-- mod:As() — unchecked cast (11절): the "go somewhere D does not know" path.
-- No name: the value itself (a type-level cast only, tag untouched — nothing
-- to retag to). A name: retag after an EXISTENCE check (typo guard), no
-- ancestry check — that is what the checked `As<Name>()` is for.
function methods.As(self: any, name: any): any
	if name == nil then
		return self
	end
	if type(name) ~= "string" then
		Err.errorBeforeNearest(`Modifier: As(name) expects a class name string (got {typeof(name)})`, SURFACE)
	end
	if defined[name] == nil then
		Err.errorBeforeNearest(`Modifier: unknown modifier class "{name}" — Modifier.Define it first`, SURFACE)
	end
	return retag(self, name)
end

-- Modifier.Overridden(a, b, ...) — later argument wins field by field. Colon
-- form `a:Overridden(b)` is the same function (self becomes the first arg).
-- The result is untyped (tag `true`): the inputs may carry different tags and
-- the merge does not pick one — retag with `As<Name>()` if a class is wanted.
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
	return newModifier(merged, true)
end
methods.Overridden = Overridden

-- checked downcast — `mod:As<Name>()`. Unlike the setters (fresh closure per
-- `__index`, `H-250`), cast closures are CACHED per target name and tagged
-- SURFACE, so the error contract is the stack worker (`errorBeforeNearest` —
-- the destination, not a hand-counted level, `H-231`; review finding). The
-- cache is bounded by the distinct `As<Name>` keys the code base spells.
local castClosures: { [string]: (any) -> any } = {}

local function castClosure(target: string): (any) -> any
	local cached = castClosures[target]
	if cached ~= nil then
		return cached
	end
	local closure = function(selfArg: any): any
		if defined[target] == nil then
			Err.errorBeforeNearest(`Modifier: unknown modifier class "{target}" — Modifier.Define it first (or use :As(name) for an unchecked cast)`, SURFACE)
		end
		local tag = selfArg.__quadModifier
		if tag ~= true and tag ~= target and not isAncestorOrSelf(tag, target) then
			Err.errorBeforeNearest(`Modifier: cannot cast a "{tag}" modifier to "{target}" — not an ancestor (use :As(name) to force)`, SURFACE)
		end
		return retag(selfArg, target)
	end
	Err.setFuncLevel(closure, SURFACE)
	castClosures[target] = closure
	return closure
end

-- generic setter synthesis — the whole per-field runtime (4절)
function ModifierMT.__index(_self: any, key: any): any
	local method = methods[key]
	if method ~= nil then
		return method
	end
	if type(key) == "string" and string.match(key, "^As%u") ~= nil then
		-- reserved cast prefix (11절): `As` + UpperCamel is never a field.
		-- `AspectRatio`-style names (lowercase after `As`) stay setters; the
		-- generator refuses to emit a property that matches the prefix.
		return castClosure(string.sub(key, 3))
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
		return newModifier(newFields, selfArg.__quadModifier) -- setters keep the tag
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

-- shared by `Modifier(...)` (tag true) and every Define'd constructor (tag =
-- class name) — one merge body, the tag is the only difference
local function construct(tag: any, ...: any): any
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
	return newModifier(merged, tag)
end

-- Modifier.Define(name, parent?) -> ctor (11절, user design 2026-09-04): a
-- PUBLIC base API — the provider registers its engine classes through it at
-- UseProvider and component authors register theirs the same way (a
-- `MaterialButtonModifier` with custom fields is as first-class as
-- `FrameModifier`). `parent` must already be Defined (ancestors first).
-- Re-Define with the same parent returns the same constructor (idempotent —
-- two modules may both declare a class); a different parent is an error.
local function Define(name: any, parent: any): any
	if type(name) ~= "string" or name == "" then
		Err.errorBeforeNearest(`Modifier.Define: name must be a non-empty string (got {typeof(name)})`, SURFACE)
	end
	if parent ~= nil then
		if type(parent) ~= "string" then
			Err.errorBeforeNearest(`Modifier.Define: parent must be a class name string (got {typeof(parent)})`, SURFACE)
		end
		if defined[parent] == nil then
			Err.errorBeforeNearest(`Modifier.Define: parent "{parent}" of "{name}" is not Defined yet — Define ancestors first`, SURFACE)
		end
	end
	local existing = defined[name]
	if existing ~= nil then
		if existing ~= (parent or false) then
			Err.errorBeforeNearest(`Modifier.Define: "{name}" is already Defined with parent "{tostring(existing or nil)}" (asked for "{tostring(parent)}")`, SURFACE)
		end
		return constructors[name]
	end
	defined[name] = parent or false
	local ctor = function(...: any): any
		return construct(name, ...)
	end
	Err.setFuncLevel(ctor, SURFACE) -- `H-238`: the user's `D.Modifier.Frame(...)` line is blamed
	constructors[name] = ctor
	return ctor
end

local Modifier = setmetatable({ Overridden = Overridden, Define = Define }, {
	__call = function(_self: any, ...: any): any
		return construct(true, ...)
	end,
})
table.freeze(Modifier)

-- `H-238`: public surface tagged (Overridden is reached both as
-- Modifier.Overridden and as the colon method — same function object)
Err.setFuncLevel(getmetatable(Modifier).__call, SURFACE)
Err.setFuncLevel(Overridden, SURFACE)
Err.setFuncLevel(Define, SURFACE)
Err.setFuncLevel(methods.As, SURFACE)

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
