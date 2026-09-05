--[[
	Tween — the value-level wrapper (M11 unit ①, round19). Canonical:
	`.claude/base/tween-plan.md` — "확정: `Tween{...}` 최종 모양" (option shape:
	`Info` first, convenience fields as fallback; `Override` two-valued),
	"`Tween<T>:Mapped(fn)`" (clone + swap `Value`), "패키지 경계" (quad-base
	holds the VALUE only — engine-free; the animation itself is the
	`isTween(realv)` branch of quad-roblox `Handlers/Property.luau`, unit ②).

	Value API (immutable — frozen, every operation returns a new value):
	  Tween{ Value = v, Info = ?, Time = ?, Style = ?, Direction = ?,
	         RepeatCount = ?, Reverses = ?, DelayTime = ?, Override = ? } -> Tween<T>
	  tween:Mapped(fn) -> Tween<U>     -- opts cloned, Value replaced by fn(Value)
	  Tween.Cancel / Tween.Finish      -- override-policy sentinels (default Cancel)

	Not a dispatch participant: no handler, no Length/Offset bookkeeping —
	`StoreBind` unwraps State layers and the branded table arrives at
	PropertyHandler as `realv` ("타입 대수" 절). Hence no `Init(module)`
	registration here; `init.luau` exports `Tween`/`isTween` directly.

	Validation (round19 §0 Q5 (a)): only what an engine-free module can see —
	`opts` is a table, `Value` present (`nil` is not a Tween target), the
	engine-free scalars typed (`Time`/`RepeatCount`/`DelayTime` number,
	`Reverses` boolean), `Override` one of the two sentinels. `Info`/`Style`/
	`Direction` are engine types (TweenInfo/Enum) and pass through unchecked —
	a wrong value raises the engine's own error inside PropertyHandler's
	`process` (same class as `inst[k] = wrongValue`; `dispatch-core-plan.md`
	"`None` 센티널" 절의 NOOP-marker caveat).

	Sentinels reuse `Dispatch/None.luau`'s `sentinel(name)` (one constructor
	for every frozen marker — `None`/`Processed*`), so the marker field is
	`__quadTweenCancel = true` / `__quadTweenFinish = true` (types
	`TweenCancel`/`TweenFinish`, union `TweenOverride`) — round19 `H-323`.
]]

local Brand = require("./Brand")
local QuadTypes = require("../luau_packages/quad_types")
local Err = require("./ErrorNamespace")
local sentinel = require("./Dispatch/None").sentinel
local SURFACE = QuadTypes.ERROR_LEVEL_SURFACE

local TweenBrand = Brand.TweenBrand

local Cancel = sentinel("TweenCancel")
local Finish = sentinel("TweenFinish")

local TweenImpl = {}
TweenImpl.__index = TweenImpl
-- `H-300`: the type promises the marker, so the value carries it — read
-- through `__index` (zero per-instance slots, like `RefImpl.__quadRefAccepts`)
TweenImpl.__quadTween = true

local NUMBER_FIELDS = { "Time", "RepeatCount", "DelayTime" }

local function validate(opts: any)
	if type(opts) ~= "table" then
		Err.errorBeforeNearest("Tween: expected an options table (Tween{ Value = ... })", SURFACE)
	end
	if opts.Value == nil then
		Err.errorBeforeNearest("Tween: Value is required", SURFACE)
	end
	for _, name in NUMBER_FIELDS do
		local v = opts[name]
		if v ~= nil and type(v) ~= "number" then
			Err.errorBeforeNearest(`Tween: {name} must be a number`, SURFACE)
		end
	end
	if opts.Reverses ~= nil and type(opts.Reverses) ~= "boolean" then
		Err.errorBeforeNearest("Tween: Reverses must be a boolean", SURFACE)
	end
	local override = opts.Override
	if override ~= nil and override ~= Cancel and override ~= Finish then
		Err.errorBeforeNearest("Tween: Override must be Tween.Cancel or Tween.Finish", SURFACE)
	end
end

-- clone → brand → freeze. `table.clone` keeps the caller's table untouched
-- (immutability is ours to guarantee, not the caller's).
local function newTween(opts: any): any
	validate(opts)
	local self: any = setmetatable(table.clone(opts), TweenImpl)
	TweenBrand:register(self)
	return table.freeze(self)
end

function TweenImpl.Mapped(self: any, fn: any): any
	if type(fn) ~= "function" then
		Err.errorBeforeNearest("Tween:Mapped expects a function", SURFACE)
	end
	-- `table.clone` copies the metatable too; the clone is not frozen, so
	-- swapping Value is fine before newTween re-brands and re-freezes it
	local opts = table.clone(self)
	opts.Value = fn(self.Value)
	return newTween(opts) -- re-validates: fn returning nil is "Value is required"
end

-- Callable namespace: Tween{...} constructs; the two sentinels are fields.
-- Typed through `any` to the function∩table `TweenConstructor` (round19
-- `H-324`, typing-limits 8.6 exception): a generic `__call` declared as
-- `setmetatable<A, B>` infers `T` as `*error-type* | …` and loses every
-- negative, while the intersection checks T, options and fields precisely —
-- but the literal `:: Quad` cast in init.luau rejects the raw callable
-- value ("unrelated"), so the module hands out the typed value itself
-- (the generated D does the same for `TypedFactory`).
local rawTween = setmetatable({ Cancel = Cancel, Finish = Finish }, {
	__call = function(_self, opts: any): any
		return newTween(opts)
	end,
})
table.freeze(rawTween)
local Tween = (rawTween :: any) :: QuadTypes.TweenConstructor

-- `H-238`: public constructor/method are surface-tagged so validation raises
-- blame the user's line (`H-231` shared namespace).
for _, fn in { getmetatable(rawTween).__call, TweenImpl.Mapped } :: { any } do
	Err.setFuncLevel(fn, SURFACE)
end

return { Tween = Tween }
