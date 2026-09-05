--!strict
--[[
	quad-roblox public types — the single shared file the ROADMAP M5 banner
	requires ("공개 타입은 단일 파일에 몰아둘 것"; a later `quad-roblox-types`
	package split lifts this file wholesale). Roblox globals (TweenInfo, Enum,
	Instance) appear here, so this package is analyzed with the pinned
	`scripts/roblox-defs/globalTypes.d.luau` — quad-base stays defs-free.

	`Tween<T>` — the value-level wrapper `tween-plan.md`'s "확정: `Tween{...}`
	최종 모양" section pins down. M5 needed the TYPE first because the
	generated `D` prop unions include it (round14 `H-298` (a)); M11 unit ①
	(2026-09-06) moved the value type into quad-types (engine-free — Roblox
	types as `any`) and this file now only REFINES the engine-typed fields.
	The runtime (quad-base `Tween.luau`, sentinels) is M11 unit ①; the
	PropertyHandler consumption is unit ②.

	`NewChild` — the backend-agnostic core of the children-array element
	union. Since 2026-09-03 the generated `D.<Class>Param<E>` is instantiated
	with a per-class alias `<Class>Elem = NewChild | <Class>OnChange |
	State<<Class>OnChange> | { read __quadModifier: "<Class>" | … }` (src/D,
	`base/onchange-plan.md` "타이핑" 절; the last member is the class-tag
	marker of M7 unit ④ — `base/modifier-plan.md` 11절) —
	array-part descriptor kinds join THAT alias, not this union
	(claim-plan §7-12). M5-era union: what actually works through
	`drive` by the end of this milestone — a static child Instance
	(InstanceChildHandler, unit ③) or a reactive one (StoreBind → unwrap).
	Later milestones WIDEN this union as their handlers land (M10 did on
	2026-09-03 — Tag/Attribute, see the declaration comment; M6 Slot). M8
	Ref/PreRef/PostRef landed on 2026-09-04 NOT here but on the per-class
	alias — `<Class>RefMarker = { read __quadRefAccepts: (<Class>) -> () }`
	(+ `State<…>`) joins `<Class>Elem`, so a Frame slot admits `Ref<Frame?>`
	and ancestor boxes but rejects a sibling's Ref (`base/ref-plan.md`
	"children 자리의 타입" 절, round18 `H-321`; the round14 `H-298` (a) "Ref류"
	mention was that planned widening — kept out of NewChild for the same
	false-surface logic as `H-297` until the runtime existed).
	`None` joined every union once `H-300` (a) landed (2026-09-02 — the
	sentinel now carries a marker field, `QuadTypes.None`).
	Canonical prose: `bind-system-plan.md` 인스턴스 생성 절의 값 유니언 문단.
]]

local QuadTypes = require("../luau_packages/quad_types")

-- M11 단위 ①(2026-09-06, round19 Q3 (a)): 값 타입의 정본은 quad-types(엔진 무관
-- — Roblox 타입 자리는 `any`)이고, 여기서는 그 위에 `read` 정밀화만 얹는다.
-- `Override`는 quad-types의 센티널 타입(`TweenOverride`). 생성 `D`의 스칼라
-- 유니언 멤버는 이 별칭이다 — `read` 필드라 quad-types `Tween<T>` 값이 그대로 들어간다.
-- M11 단위 ①(2026-09-06, round19 Q3): 값 타입의 정본은 quad-types(엔진 무관 —
-- Roblox 타입 자리는 `any`)이고 여기서는 **그대로 별칭**한다. Q3 (a)가 예정한
-- `read Info: TweenInfo?` 정밀화는 실측에서 포기했다(`H-326`): `State<X>`는 불변이라
-- 생성 D 슬롯의 `State<Tween<T>>` 멤버는 `Animate`/`:Compute`가 돌려주는
-- `State<QuadTypes.Tween<T>>`와 X가 글자 그대로 같아야 한다 — 정밀판 별칭이든
-- 데이터부든 다른 타입이면 거부된다. 엔진 타입 오용(`Style = 3`)은 `Enum` 자체가
-- 대부분 잡고, 나머지는 엔진 원시 에러(Q5 (a)).
export type Tween<T> = QuadTypes.Tween<T>
-- 유니언 멤버용 데이터부(`Mapped` 없음) — 재귀 메소드 테이블을 수백 유니언에 직접
-- 넣지 않는다(typing-limits 8.8). 실 Tween 값은 구조적으로 만족한다.
export type TweenData<T> = QuadTypes.TweenData<T>

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
	-- M7 단위 ③·④: Modifier는 MARKER로만 — 클래스별 `<Class>Modifier`를 유니언에
	-- 직접 넣으면 큰 클래스의 캐스트 자리에서 "too complex"(2026-09-04 실측,
	-- typing-limits 8.8절). 여기(`true`)는 무타입 base `Modifier()`의 명시 허용이고,
	-- 클래스 태그 마커 `{ read __quadModifier: "Frame" | "GuiObject" | … }`(자기 +
	-- 조상 체인)는 생성 `<Class>Elem`이 담는다 — 그래서 형제 클래스 Modifier는
	-- 거부된다(단위 ④, modifier-plan 11절). `State<Modifier>`는 7절이 error라 없다.
	| QuadTypes.ModifierMarker

-- `OnChange(name, fn)` descriptor (M10, `base/onchange-plan.md` — array-part
-- value since the 2026-09-03 reversal): frozen `{ Name, Callback }`,
-- Handlers/OnChange.luau. This is the RUNTIME shape; the checked factory
-- type (`OnChangeFn`, name → callback parameter via `index<PropTypes, K>`)
-- and the per-class descriptor unions are generated (src/D).
export type OnChangeDescriptor = { read Name: string, read Callback: (any) -> () }

return {}
