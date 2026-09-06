--!strict
--[[
	30 — `OnChange(name, fn)` 배열부 디스크립터 타이핑 (2026-09-03, onchange-plan
	역전 착수 전 — 사용자 제안 "K & union으로 이름 캐치, 생성자 쪽 index<>로
	콜백 입력 타입"의 실현 가능 경계 실측). 자리표시자 3필드 — 실물 규모
	(D 스코프 전체, 클래스당 수십 멤버)는 `quad-roblox/test/spec.onchangetypes.luau`
	가 상시 회귀로 본다.

	질문 셋:
	 (Q1) 생성기가 클래스별 `{ Name: "Position", Callback: (UDim2) -> () } | …`
	      유니언을 `<Class>Param<E>`의 E에 넣으면, 팩토리가 만든 값이 그 유니언과
	      **검증**되는가 — 이름 오타·콜백 타입 불일치·클래스 밖 이름이 잡히는가.
	 (Q2) 콜백 파라미터를 무주석으로 두면 **추론**되는가.
	 (Q3) `State<디스크립터>`가 같은 E 자리에 들어가는가.

	실행: `luau-analyze <이 파일>` — 기대 음성은 **NEG 주석 4줄**(오타 줄은
	keyof/index 양쪽에서 진단 여러 개를 낸다). 그 외 줄에 진단이 나오면
	메커니즘이 깨진 것.

	[2026-09-03 실측] 최종 형태(아래)는 양성 전부 클린 + NEG 4줄에만 진단.
	거쳐 간 형태와 결과:
	 - `OnChange<K, V>(name: K, fn: (V) -> ())` — **K가 `string`으로 넓혀져**
	   양성까지 전부 실패(리터럴 인자가 제네릭에 묶이면 싱글톤이 안 남는다).
	 - `name: K & PropName`(전 이름 싱글톤 유니언 235개) — 3~4개 자리표시자에선
	   통과, 실물 규모에선 "Code is too complex"(유니언∩K 정규화).
	 - 이름·타입 쌍 오버로드 교집합(생성기 산출) — 37개부터 too complex.
	 - 인라인 테이블 리터럴 `{ Name = "Position", Callback = fn }` — Name이
	   string으로 넓혀져 실패(양방향 추론이 싱글톤을 못 지킨다).
	 - ⭐ `name: K & keyof<PropTypes>`, `fn: (index<PropTypes, K>) -> ()` —
	   통과. `index<>`가 파라미터 타입을 직접 만들어 **무주석 추론까지** 된다.
	   실물 규모(`PropTypes` 235개)에서도 통과하되 Color3/string 콜백은
	   `LuauSubtypingIterationLimit` 기본 한도를 넘어 test.sh가 10만을 싣는다.
	   클래스 간 타입이 다른 이름은 PropTypes에서 `any`(index<>가 유니언을
	   주면 주석 콜백이 반공변으로 거부됨).
	 - 캐비엇: `State<T>`는 `Set` 파라미터로 불변 — `Source<단일 디스크립터>`는
	   `State<클래스 유니언>`에 안 맞아 캐스트 경유(`:: FrameOnChange`)로 만든다.
	   반응형 자식 `Source<Frame>` vs `State<Instance>`도 같은 규칙(선행 한계).
	결론은 `base/onchange-plan.md` "타이핑" 절 + `typing-limits.md` 8.7절.
]]

type State<T> = { Get: (self: State<T>) -> T, Set: (self: State<T>, T) -> () }
type None = { __none: true }
type UDim2 = { __udim2: true }
type Color3 = { __color3: true }
type Frame = { __frame: true, Name: string }

type NewChild = Frame | State<Frame> | None

-- 생성기 산출물 ①: 스코프 전체 이름 → 타입(자리표시자 4개; 실물은 235개)
type PropTypes = {
	Position: UDim2,
	Size: UDim2,
	BackgroundColor3: Color3,
	Text: string, -- Frame엔 없는 프로퍼티(다른 클래스의 것) — 클래스 밖 음성용
}

-- 생성기 산출물 ②: 팩토리 타입 — 이름은 keyof, 콜백 파라미터는 index<>
type OnChangeDescriptor<K> = { Name: K, Callback: (index<PropTypes, K>) -> () }
type OnChangeFn = <K>(name: K & keyof<PropTypes>, fn: (index<PropTypes, K>) -> ()) -> OnChangeDescriptor<K>
local OnChange = (nil :: any) :: OnChangeFn

-- 생성기 산출물 ③: 클래스별 유니언(이름-콜백 짝) — E에 합류
type FrameOnChange =
	{ Name: "Position", Callback: (UDim2) -> () }
	| { Name: "Size", Callback: (UDim2) -> () }
	| { Name: "BackgroundColor3", Callback: (Color3) -> () }

type FrameParam<E> = {
	[number]: E,
	Position: (UDim2 | State<UDim2> | None)?,
	Size: (UDim2 | State<UDim2> | None)?,
	Name: (string | State<string> | None)?,
}

local D = {}
D.Frame = (nil :: any) :: (FrameParam<NewChild | FrameOnChange | State<FrameOnChange>>) -> Frame

local child: Frame = nil :: any
local function Source<T>(v: T): State<T>
	return { Get = function(_s): T return v end, Set = function(_s, _v) end }
end

-- ── 양성 ──────────────────────────────────────────────────────────
local f1 = D.Frame({
	Name = "a",
	child,
	OnChange("Position", function(v: UDim2) end),
	OnChange("BackgroundColor3", function(v: Color3) end),
	OnChange("Position", function(v: UDim2) end), -- 같은 이름 둘 — 배열이라 충돌 없음
})
-- Q2: 무주석 콜백 — index<>가 v: UDim2를 준다
local f2 = D.Frame({
	OnChange("Position", function(v)
		local _: UDim2 = v
	end),
})
-- 변수 경유(싱글톤 K가 변수를 지나도 살아남는다)
local pre = OnChange("Size", function(v: UDim2) end)
local f3 = D.Frame({ pre })
-- Q3: State<디스크립터> — 클래스 유니언으로 캐스트해 만든다(State 불변성 캐비엇)
local reactive = Source(OnChange("Size", function(v: UDim2) end) :: FrameOnChange)
local f4 = D.Frame({ reactive })
print(f1, f2, f3, f4)

-- ── 음성 대조군(정확히 4건) ─────────────────────────────────────────
local n1 = D.Frame({ OnChange("Position", function(v: Color3) end) }) -- NEG 1: 콜백 타입 불일치(호출 자리)
local n2 = D.Frame({ OnChange("Positon", function(v: UDim2) end) }) -- NEG 2: 이름 오타(keyof)
local n3 = D.Frame({ OnChange("Text", function(v: string) end) }) -- NEG 3: 클래스 밖 이름(생성자 자리)
local n4 = D.Frame({
	OnChange("Position", function(v)
		local _: string = v -- NEG 4: 추론된 v(UDim2)는 string이 아니다
	end),
})
print(n1, n2, n3, n4)
