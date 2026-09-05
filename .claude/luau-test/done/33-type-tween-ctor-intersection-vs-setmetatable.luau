--!strict
--[[
	검증 대상: 제네릭 `__call` 콜러블 네임스페이스(`Tween{...}` — `Tween<T>`를
	돌려주는 생성자 + `Cancel`/`Finish` 필드)의 타입 선언 방식. 8.6절 규칙
	(콜러블 테이블은 `setmetatable<A, B>`)을 그대로 따르면 **제네릭 `T`가
	`*error-type* | number`로 오염**돼 (1) 다른 `T`의 슬롯 대입, (2) 옵션 필드
	타입, (3) `Mapped` 결과 오타입을 전부 놓친다. 함수∩테이블 교집합은 셋 다
	잡는다 — M11 단위 ①이 교집합을 택한 근거(round19 `H-324`, 8.6절 예외).

	배경: `base/typing-limits.md` 8.6절(`H10-3`/`H10-4` — Tag/Attribute는
	비제네릭 __call이라 setmetatable 형이 맞았다), `base/tween-plan.md`.
	실행: `luau-analyze 33-*.luau` — 기대: A(setmetatable) 블록은 L-A2·L-A3이
	**진단 없이 통과**(결함 재현), B(교집합) 블록은 L-B2·L-B3·L-B4가 정확히 에러.
	(quad-types 없이 자립 — 최소 재현.)
]]

type Opts<T> = { read Value: T, read Time: number? }
type TwData<T> = { read Value: T, read Time: number? }
local function mapped<T, U>(_self: TwData<T>, _fn: (T) -> U): Tw<U>
	return nil :: any
end
type Tw<T> = TwData<T> & { Mapped: typeof(mapped) }

-- A. 8.6절 규칙대로: setmetatable<A, B> + 제네릭 __call
type A = setmetatable<{ Cancel: { read __c: true } }, { __call: <T>(self: any, opts: Opts<T>) -> Tw<T> }>
local a: A = nil :: any
local a1 = a({ Value = 1 }) -- T가 `*error-type* | number`로 추론된다(hover로 확인)
local a2: Tw<string> = a({ Value = 1 }) -- L-A2 기대: 에러여야 하나 **조용히 통과**
local a3 = a({ Value = 1, Time = "x" }) -- L-A3 기대: 에러여야 하나 **조용히 통과**(8.6 잔여 구멍)

-- B. 함수∩테이블 교집합
type B = (<T>(opts: Opts<T>) -> Tw<T>) & { Cancel: { read __c: true } }
local b: B = nil :: any
local b1 = b({ Value = 1 }) -- T = number
local b2: Tw<string> = b({ Value = 1 }) -- L-B2 에러 ✓
local b3 = b({ Value = 1, Time = "x" }) -- L-B3 에러 ✓
local b4: string = b({ Value = 1 }):Mapped(function(v: number): number
	return v
end).Value -- L-B4 에러 ✓
local b5: { read __c: true } = b.Cancel -- 필드 접근 OK

return a1, a2, a3, b1, b2, b3, b4, b5
