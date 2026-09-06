--!strict
--[[
	31 — 새 솔버 유니언 서브타이핑 결함 + 클래스 태그 마커/`As<Class>`/`Into` 최소형
	(2026-09-04, M7 단위 ④ 착수 전 실측 — `typing-limits.md` 8.9절, `modifier-plan.md`
	11절). 실물 규모는 `quad-roblox/test/spec.modifiertypes.luau`(양성)가 상시
	회귀로 본다; 여기는 소형 재현으로 **규칙**을 고정한다.

	(Q1) 유니언 검사 결함: 서브타입 테이블에 **자기 타입을 참조하는 함수 필드**가
	     있고, 유니언의 어느 멤버가 **같은 이름의 함수 필드**를 가지면, 그 유니언
	     검사가 조용히 통과한다(마커 필드 불일치를 무시). 재귀 없는 충돌·충돌
	     없는 재귀·문자열 필드끼리 충돌은 전부 정상 거부.
	     → Modifier의 `Apply`가 `(self: X, factory: (X) -> U)`로 재귀이면 children
	     유니언의 `Tag.Apply`/`State.Apply`와 만나 클래스 마커 검사가 무력화된다.
	     처방: `Apply: <U>(self: any, factory: (any) -> U) -> U` + 생성기 게이트
	     (setter 이름이 유니언 멤버 메소드와 겹치면 생성 실패).
	(Q2) 처방 뒤 클래스 태그 마커 `{ read __quadModifier: "A" | "Parent" }`가
	     다른 클래스를 거부하고 상위·자기·무타입(true)을 받는가.
	(Q3) `As<Class>()`(하위만 메소드) / `As<<T>>()` / `Into<Class>`(self: any)가
	     성립하는가 — 상위·자기·커스텀 구현체 수용, 불만족 거부.
	(Q4) 교집합 Param `{ [number]: E } & Props`는 리터럴에서 성립하지 않는다
	     (공유 props 호이스팅 불가 — 인덱서를 가진 conjunct가 자기에게 없는 문자열
	     키를 인덱서 위반으로 거부; `{}`조차 `{number}`로 추론돼 실패).

	실행: `luau-analyze <이 파일>` — 기대 진단은 **NEG 주석 줄**뿐. 그 외 줄에
	진단이 나오면 메커니즘이 깨진 것; NEG 줄에 진단이 없으면 결함이 되살아난 것.
	[2026-09-04 실측] luau-lsp 1.69.0 새 솔버: 아래 그대로 NEG 줄에만 진단.
]]

-- ── Q1: 결함 재현 ──────────────────────────────────────────────────────────
type MarkA = { read __quadModifier: "A" }
type Xn = { Zed: (self: Xn) -> number, Other: (self: Xn) -> string }
type R3 = { read __quadModifier: "B", Zed: (self: R3) -> number } -- 재귀 + 충돌
type R4 = { read __quadModifier: "B", Zed: () -> number, Bar: (self: R4) -> R4 } -- 재귀는 다른 필드, 충돌 필드는 비재귀
type R6 = { read __quadModifier: "B", Bar: (self: R6) -> R6 } -- 재귀, 충돌 없음
type NR2 = { read __quadModifier: "B", Zed: () -> number } -- 충돌, 재귀 없음

local function q1(r3: R3, r4: R4, r6: R6, nr2: NR2)
	-- ⚠️ 결함: 이 줄은 진단이 나야 맞지만 새 솔버가 통과시킨다 — 그래서 NEG가 아니다.
	-- (이 줄에 진단이 생기면 결함이 고쳐진 것 — 8.9절의 처방을 되돌릴 수 있다)
	local leak: Xn | MarkA = r3
	local a: Xn | MarkA = r4 -- NEG
	local b: Xn | MarkA = r6 -- NEG
	local c: Xn | MarkA = nr2 -- NEG
	return leak, a, b, c
end

-- ── Q2·Q3: 처방된 모양 ─────────────────────────────────────────────────────
type Field<V> = V | nil
type ParentModifier = {
	read __quadModifier: "Parent",
	Apply: <U>(self: any, factory: (any) -> U) -> U, -- any: 재귀 없음
	As: <T>(self: ParentModifier, name: string?) -> T,
	AsParent: (self: ParentModifier) -> ParentModifier,
	AsChild: (self: ParentModifier) -> ChildModifier, -- 하위만
	AsOther: (self: ParentModifier) -> OtherModifier,
	Visible: (self: ParentModifier, v: Field<boolean>) -> ParentModifier,
}
type ChildModifier = {
	read __quadModifier: "Child",
	Apply: <U>(self: any, factory: (any) -> U) -> U,
	As: <T>(self: ChildModifier, name: string?) -> T,
	AsChild: (self: ChildModifier) -> ChildModifier, -- 항등(Into 구현)
	Visible: (self: ChildModifier, v: Field<boolean>) -> ChildModifier,
	Text: (self: ChildModifier, v: Field<string>) -> ChildModifier,
}
type OtherModifier = {
	read __quadModifier: "Other",
	Apply: <U>(self: any, factory: (any) -> U) -> U,
	As: <T>(self: OtherModifier, name: string?) -> T,
	AsOther: (self: OtherModifier) -> OtherModifier,
	Radius: (self: OtherModifier, v: Field<number>) -> OtherModifier,
}
type IntoChild = { AsChild: (self: any) -> ChildModifier } -- self는 any여야 실제 Modifier가 들어온다
type Tag = { Apply: <U>(self: Tag, factory: (Tag) -> U) -> U, Names: (self: Tag) -> () -> string? } -- 유니언 멤버(Apply 충돌원)
type ChildElem = number | Tag | { read __quadModifier: true } | { read __quadModifier: "Child" | "Parent" }
type OtherElem = number | Tag | { read __quadModifier: true } | { read __quadModifier: "Other" | "Parent" }
type Custom = { read __quadModifier: "Custom", AsChild: (self: Custom) -> ChildModifier, Foo: (self: Custom) -> Custom }

local function bold(m: IntoChild): ChildModifier
	return m:AsChild():Text("bold")
end

local function q2q3(p: ParentModifier, c: ChildModifier, o: OtherModifier, custom: Custom, untyped: { read __quadModifier: true })
	local ok1: { [number]: ChildElem } = { p, c, untyped } -- 상위·자기·무타입
	local ok2: { [number]: OtherElem } = { p, o }
	local bad1: { [number]: ChildElem } = { o } -- NEG 다른 클래스(Apply 충돌원 Tag가 있어도 잡힌다 — 처방 확인)
	local bad2: { [number]: OtherElem } = { c } -- NEG
	local down = p:AsChild():Text("x"):Visible(true) -- 검사형 하강 뒤 하위 setter
	local same = c:AsChild()
	local free = p:As<<OtherModifier>>():Radius(1) -- 무검사
	local i1 = bold(p) -- 상위
	local i2 = bold(c) -- 자기(항등)
	local i3 = bold(custom) -- 커스텀 구현체
	local i4 = bold(o) -- NEG Into 불만족
	local bad3 = c:AsOther() -- NEG 하위가 아니면 메소드가 없다
	local bad4 = p:AsChild():Radius(1) -- NEG 하강 뒤 다른 클래스 setter
	return ok1, ok2, bad1, bad2, down, same, free, i1, i2, i3, i4, bad3, bad4
end

-- ── Q4: 교집합 Param은 리터럴에서 성립하지 않는다 ─────────────────────────
-- 인덱서를 가진 conjunct가 별도 별칭(`Leaf<E>`)이면 문자열 키를 가진 리터럴이
-- 거부되고(실물 규모 `{ [number]: E } & InstanceProps & …`도 같은 결과 —
-- audit/m7-unit4-as-modifier-2026-09-04.md), 인라인 교집합에서도 `{}`는
-- `{number}`로 추론돼 거부된다. 평면 테이블은 둘 다 통과.
type Shared = { Archivable: boolean?, Name: string? }
type Leaf<E> = { [number]: E, Text: string? }
type Isect<E> = Leaf<E> & Shared
type Inline<E> = { [number]: E, Text: string? } & Shared
type Flat<E> = { [number]: E, Text: string?, Archivable: boolean?, Name: string? }
local function q4()
	local flat: Flat<number> = { 1, Text = "x", Archivable = true }
	local flatEmpty: Flat<number> = {}
	local isect: Isect<number> = { 1, Text = "x", Archivable = true } -- NEG 양성인데 거부된다(성립 불가의 증거)
	local isectEmpty: Isect<number> = {} -- NEG
	local inlineEmpty: Inline<number> = {} -- NEG `{}`가 `{number}`로 추론돼 거부
	return flat, flatEmpty, isect, isectEmpty, inlineEmpty
end

return { q1, q2q3, q4 }
