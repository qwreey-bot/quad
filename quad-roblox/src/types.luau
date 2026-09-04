--!strict
--[[
	quad-roblox public types — the single shared file the ROADMAP M5 banner
	requires ("공개 타입은 단일 파일에 몰아둘 것"; a later `quad-roblox-types`
	package split lifts this file wholesale). Roblox globals (TweenInfo, Enum,
	Instance) appear here, so this package is analyzed with the pinned
	`scripts/roblox-defs/globalTypes.d.luau` — quad-base stays defs-free.

	`Tween<T>` — the value-level wrapper `tween-plan.md`'s "확정: `Tween{...}`
	최종 모양" section pins down. M11 implements the runtime (constructor,
	PropertyHandler consumption, `Tween.Cancel`/`Tween.Finish` sentinels);
	M5 needs the TYPE first because the generated `D` prop unions include it
	(round14 `H-298` (a)). `Override` stays `any` until M11 gives the sentinel
	values a type.

	`NewChild` — the backend-agnostic core of the children-array element
	union. Since 2026-09-03 the generated `D.<Class>Param<E>` is instantiated
	with a per-class alias `<Class>Elem = NewChild | <Class>OnChange |
	State<<Class>OnChange>` (src/D, `base/onchange-plan.md` "타이핑" 절) —
	array-part descriptor kinds join THAT alias, not this union
	(claim-plan §7-12). M5-era union: what actually works through
	`drive` by the end of this milestone — a static child Instance
	(InstanceChildHandler, unit ③) or a reactive one (StoreBind → unwrap).
	Later milestones WIDEN this union as their handlers land (M10 did on
	2026-09-03 — Tag/Attribute, see the declaration comment; M6 Slot, M8
	Ref/PreRef/PostRef — the round14 `H-298` (a) "Ref류" mention is that
	planned widening, kept out now so the type never promises a runtime path
	that does not exist yet; same false-surface logic as `H-297`).
	`None` joined every union once `H-300` (a) landed (2026-09-02 — the
	sentinel now carries a marker field, `QuadTypes.None`).
	Canonical prose: `bind-system-plan.md` 인스턴스 생성 절의 값 유니언 문단.
]]

local QuadTypes = require("../luau_packages/quad_types")

export type Tween<T> = {
	Value: T,
	Info: TweenInfo?,
	-- convenience fields, used only when Info is absent (defaults are
	-- TweenInfo.new()'s own)
	Time: number?,
	Style: Enum.EasingStyle?,
	Direction: Enum.EasingDirection?,
	RepeatCount: number?,
	Reverses: boolean?,
	DelayTime: number?,
	Override: any?, -- Tween.Cancel (default) | Tween.Finish — sentinels arrive in M11
}

-- [2026-09-03 M10 widening] the quad-base array-part VALUES join here: `Tag(...)`
-- and `Attribute(...)` (the typed scalar sugar `StringAttribute(name, v)` etc.
-- returns an `Attribute`, so it rides the same member) + their State forms
-- (StoreBind unwraps array elements). OnChange descriptors are NOT here — they
-- are per-class (`<Class>Elem` in the generated D, `base/onchange-plan.md`).
export type NewChild =
	Instance
	| QuadTypes.State<Instance>
	| QuadTypes.None
	| QuadTypes.Tag
	| QuadTypes.State<QuadTypes.Tag>
	| QuadTypes.Attribute
	| QuadTypes.State<QuadTypes.Attribute>
	-- M7 단위 ③: Modifier는 MARKER로만(`{ read __quadModifier: true }`) — 클래스별
	-- `<Class>Modifier`를 유니언에 직접 넣으면 큰 클래스의 캐스트 자리에서
	-- "too complex"(2026-09-04 실측). 클래스 소속은 setter 호출 자리가 검사한다.
	-- `State<Modifier>`는 modifier-plan 7절이 error라 타입에서도 없다.
	| QuadTypes.ModifierMarker

-- `OnChange(name, fn)` descriptor (M10, `base/onchange-plan.md` — array-part
-- value since the 2026-09-03 reversal): frozen `{ Name, Callback }`,
-- Handlers/OnChange.luau. This is the RUNTIME shape; the checked factory
-- type (`OnChangeFn`, name → callback parameter via `index<PropTypes, K>`)
-- and the per-class descriptor unions are generated (src/D).
export type OnChangeDescriptor = { read Name: string, read Callback: (any) -> () }

return {}
