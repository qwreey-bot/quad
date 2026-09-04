--!strict
--[[
	32 — children 자리의 `Ref<T>` 타입 표현 (2026-09-04, M8 단위 ③ 착수 전 —
	brief §0 Q3 (a) "스파이크로 결정"). 실물 규모 대조는 세션 스크래치(실물
	`<Class>Elem` + quad-types `Ref`)에서 했고 결과는 round18 `H-321`; 여기는
	규칙의 소형 고정. 클래스는 가짜 테이블(`Frame ⊂ GuiObject`).

	(Q1) `Ref<Frame?>`를 children 유니언에 **직접** 넣기 — 이 소형(가짜 클래스)
	     에선 다른 클래스의 `Ref<TextLabel?>`가 거부되지만, **실물 규모**(extern
	     클래스 + 실물 `<Class>Elem` — `State<Instance>`·OnChange 디스크립터 동거)
	     에선 조용히 통과했다(round18 `H-321` — 8.9절 결함: `Set`/`Callback` 이름
	     충돌). 소형이 실물을 대표하지 못하는 첫 사례라 이 줄은 NEG로 두되 실물이
	     정본이다.
	(Q2) **반공변 팬텀 필드 마커**: `Ref<T>`에 `read __quadRefAccepts: (T) -> ()`를
	     두고 유니언엔 `{ read __quadRefAccepts: (Frame) -> () }`만 넣으면 —
	     `Ref<Frame?>`·`Ref<GuiObject?>`(상위 박스는 Frame을 담을 수 있다) 통과,
	     `Ref<TextLabel?>`·`Ref<nil>`(`Ref()` — 호출자가 `Ref<<T?>>`로 넓혀야 한다는
	     기존 관용구) 거부. **`<Self>` 제네릭 메소드 형(실물 quad-types)에서만 계약**
	     — self 타입 메소드 변형은 실물에선 잡혔지만 이 소형에선 새서(아래 d) 규칙이
	     안정적이지 않다.

	실행: `luau-analyze <이 파일>` — 기대 진단은 NEG 줄뿐.
]]

type GuiObject = { gui: true }
type Frame = GuiObject & { frame: true }
type TextLabel = GuiObject & { text: true }
type Callback<T> = (value: T) -> ()
type OnChange = { Name: "Visible", Callback: (boolean) -> () }
type StateLike<T> = { Get: (self: StateLike<T>) -> T, Set: (self: StateLike<T>, v: T) -> StateLike<T> }

-- Q1: 직접 멤버
type RefPlain<T> = { Value: T, Set: <Self>(self: Self, v: T) -> Self, Callback: <Self>(self: Self, fn: Callback<T>) -> Self }
type ElemDirect = StateLike<Frame> | OnChange | RefPlain<Frame?>
local function q1(rT: RefPlain<TextLabel?>, rF: RefPlain<Frame?>)
	local ok: { [number]: ElemDirect } = { rF }
	local leak: { [number]: ElemDirect } = { rT } -- NEG 소형에선 잡힌다(실물에선 샘 — 헤더)
	return ok, leak
end

-- Q2: 반공변 팬텀 마커
type Ref<T> = { read __quadRefAccepts: (T) -> (), Value: T, Set: <Self>(self: Self, v: T) -> Self, Callback: <Self>(self: Self, fn: Callback<T>) -> Self }
type RefSelf<T> = { read __quadRefAccepts: (T) -> (), Value: T, Set: (self: RefSelf<T>, v: T) -> RefSelf<T> }
type FrameRefMarker = { read __quadRefAccepts: (Frame) -> () }
type ElemMarker = StateLike<Frame> | OnChange | FrameRefMarker
local function q2(rF: Ref<Frame?>, rG: Ref<GuiObject?>, rT: Ref<TextLabel?>, rN: Ref<nil>, sF: RefSelf<Frame?>, sT: RefSelf<TextLabel?>)
	local a: { [number]: ElemMarker } = { rF, rG, sF, rF:Callback(function() end) }
	local b: { [number]: ElemMarker } = { rT } -- NEG 다른 클래스
	local c: { [number]: ElemMarker } = { rN } -- NEG Ref<nil> — 호출자가 Ref<<Frame?>>로 넓힐 것
	local d: { [number]: ElemMarker } = { sT } -- ⚠️ self 타입 메소드 변형: 여기선 통과(샘), 실물에선 거부 — 규칙 불안정, NEG 아님
	return a, b, c, d
end

return { q1, q2 }
