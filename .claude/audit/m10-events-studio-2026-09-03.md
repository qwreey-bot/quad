# M10 엔진 축 둘째 단위 — Event/OnChange 핸들러 실기기 실측 (2026-09-03)

> **무엇인가**: `quad-roblox/src/Handlers/Event.luau`·`Handlers/OnChange.luau`
> (round16 `H10-13`)를 rojo 라이브 싱크로 Studio에 올려 실물
> `RBXScriptSignal`/`ReflectionService` 위에서 돌린 결과. CLI spec
> (`quad-roblox/test/spec.events.luau`)이 mock 위에서 고정한 계약의 엔진
> 대면 델타만 본다. 관용구는 `m5-unit5-first-render-2026-09-02.md`(패키지
> 클론 → `require(clone.src)`, `Quad.New():UseProvider(QuadRoblox)`).
> Deferred 시그널 환경이라(`H-291`) 콜백 관측은 두 번째 `execute_luau`에서.

## 0. 선행 실측 — 리플렉션 API

| 확인 | 결과 |
|---|---|
| `ReflectionService:GetEventsOfClass(className)` 존재 | ✅ 함수. `GetMembersOfClass`/`GetFunctionsOfClass`/`GetCallbacksOfClass`는 **없음**(`GetMethodsOfClass`는 있음) |
| 디스크립터 모양 | `{ Name, Display, Owner, Permits, Parameters }` 배열 — `TextButton`에 37개, **상속 포함**(`Owner = GuiButton`인 `MouseButton1Click`) |
| 프로퍼티/이벤트 집합 분리 | `MouseButton1Click`은 `GetPropertiesOfClass`에 **없음** → Property/Event 두 핸들러가 같은 NORMAL 우선순위에 있어도 매치 집합이 겹치지 않는다 |
| `typeof(inst.MouseButton1Click)` | `RBXScriptSignal`(`Changed`·`GetPropertyChangedSignal(...)`도 동일) |

## 1. 실측 항목 (전부 PASS)

| # | 항목 | 관측 |
|---|---|---|
| 1 | Event — 상속 이벤트 `ChildAdded`를 `D.Frame { ChildAdded = fn }`으로 바인딩, 자식 셋 부착 | 콜백 3회, **각 `argc = 1`, 첫 인자 `typeof == "Instance"`** — self/Instance가 앞에 붙지 않음(event-plan 1절) |
| 2 | OnChange — `[q.OnChange "Text"] = fn` 뒤 `Text = "hello"`, `"world"` | 콜백 2회, 값은 **`world, world`** — Deferred 배달 시점에 `inst[name]`을 읽으므로 중간값 `hello`는 관측되지 않는다(계약 `v(inst[name])` 그대로, 엔진 Deferred 특성 — `H-291`과 같은 축, 결함 아님) |
| 3 | store-bind + `None`(`H-27`) — `Source(fn)`을 `[OnChange "Text"]`와 `MouseButton1Click` 두 자리에, `Text = "x"` → `Set(None)` → `Text = "y"` → `Set(fn2)` → `Text = "z"` | 합계 **100**: `x`의 지연 배달은 그 전에 `Set(None)`이 `Disconnect`해 **드롭**(Deferred 엔진 — 끊긴 Connection의 대기 배달은 취소), `None` 구간의 `y`는 무호출·**무에러**(얼리리턴이 없었다면 `attempt to call a nil value`), 재연결 뒤 `z`만 `+100` |
| 4 | 키 동등성 | `q.OnChange "Text" == q.OnChange "Text"` → `true` |
| 5 | `q.OnChange(42)` | `AssistantCommand:52: OnChange: property name must be a string` — 호출한 사용자 줄을 blame(`H-238`) |
| 6 | 이벤트 아닌 문자열 키 `Frame { Bogus = 1 }` | 여전히 `no handler matched key Bogus` — Event 핸들러가 비이벤트 키를 삼키지 않음 |
| 7 | 다른 클래스의 이벤트 이름 `Frame { MouseButton1Click = fn }` | `no handler matched key MouseButton1Click (value: function)` — 클래스별 판별 |
| 8 | 1차 호출 시점 카운트 | 전부 0 — Deferred(동기 관측 불가), 2차 호출에서 위 값들 |
| 9 | **(리뷰 반영 후 추가)** Property `v == nil` 방어 — `Frame { BackgroundColor3 = src }` 뒤 `src:Set(q.None)` | `pcall ok=true`, 색은 마지막 값 `1, 0, 0` 유지(엔진의 nil 거부 에러가 `process` 안에서 나지 않음), `Set(Color3)` 재쓰기 정상 — dispatch-core `None` 캐비엇의 M10 구현 확인 |

## 2. 부수 관측 — 미부착 루트의 자식 (재현 실패, 기록만)

2차 호출에서 `EvRoot`(Parent 없는 quad 루트, `_G`로만 참조)의 `GetChildren()`이
비어 있었다. 같은 모양을 두 벌(`q` 보관/비보관) 다시 만들어 다음 호출에서
확인하니 **둘 다 자식 셋 그대로**(파괴 판정 pcall도 생존) — 재현되지 않아
결론 없음. 이벤트 바인딩과 무관할 가능성이 크고(1차 관측의 콜백은 정상
배달됐음) 사람이 Studio에서 GC 사이클을 두고 볼 항목으로만 남긴다.
