# M11 자율 구현 — 19라운드 발견 원장

> **[2026-09-06 신설]** M11(Tween) 자율 구현 구간의 발견·문항 원장. 규약은
> `m11-implementation-round19-brief.md`(§0 권고 (a)로 착수 — 사용자 결정). 세
> 갈래(①자율 반영 / ②§4 문항 — 새 표면·메커니즘·확정 역전 / ③중단)는 M8
> 규약 준용. 번호는 `H-323`부터. **상태의 소스는 이 파일의 표.**

## 요약 표

| ID | 갈래 | 심각도 | 무엇 | 처리 |
|---|---|---|---|---|
| `H-323` | ① | 🟢 | **[단위 ① — 센티널 형태]** brief Q4 (a)는 `{ __quadTweenOverride = "Cancel" }`을 적었지만, 코퍼스엔 이미 frozen 마커 센티널 생성자 하나(`Dispatch/None.luau`의 `sentinel(name)` — `None`/`Processed*`)가 있어 그걸 재사용했다. 마커는 `__quadTweenCancel = true` / `__quadTweenFinish = true`, 타입 `TweenCancel`/`TweenFinish`, 유니언 `TweenOverride`. 동등성 비교만 되면 된다는 정본 조건 그대로 | ✅ `Tween.luau`·quad-types. 문자열 리터럴 마커 대신 `true` 마커 둘 — `None`과 한 생성자 |
| `H-324` | ② 확인 | 🟡 | **[단위 ① — `TweenConstructor` 타입, typing-limits 8.6 예외]** 8.6 규칙(콜러블 테이블은 `setmetatable<A, B>`)대로 두면 제네릭 `__call`의 `T`가 `*error-type* \| number`로 오염돼 (1) 다른 `T`의 슬롯 대입, (2) 옵션 필드 타입, (3) `Mapped` 결과 오타입을 전부 놓친다. 함수∩테이블 교집합 `(<T>(opts: TweenOptions<T>) -> Tween<T>) & { Cancel, Finish }`는 셋 다 잡고 UseProvider 통과·필드 접근도 클린. 대신 8.6이 예고한 대로 `init.luau`의 `:: Quad` 리터럴 캐스트가 raw 콜러블 값을 거부해, `Tween.luau`가 `(raw :: any) :: TweenConstructor`로 타입을 실어 내보낸다(생성 D의 `TypedFactory` 이중 캐스트 선례). `luau-test/done/33` | ✅ 반영(교집합 + 이중 캐스트). **사용자 확인 대상**: 8.6은 `H10-3`/`H10-4` (d) 사용자 확정인데 Tween만 예외다 — 근거는 "제네릭 `__call`"이라는 조건(Tag/Attribute는 비제네릭). 8.6절에 조건부 예외로 등재 |
| `H-325` | ① | 🟢 | **[단위 ① — `TweenOptions<T>` 필드는 `read`]** 미리 만든 옵션 테이블 변수를 넘기면 새 솔버가 가변 필드 `Time: number`를 `number?`에 불변으로 대조해 거부(spec 32행 실측). 생성자는 읽기만 하므로 전 필드 `read` | ✅ quad-types |
| `H-326` | ① (+②) | 🔴→✅ | **[단위 ① — 생성 D 슬롯 유니언에 `State<Tween<T>>` 부재 + 정밀판 별칭 포기]** 정본 `tween-plan.md` "타입 대수" 절은 `T \| Tween<T> \| State<T \| Tween<T>>`인데 생성기(bind-system 원장 `H-298`)는 `T \| State<T> \| Tween<T> \| None`뿐이라 **`Animate`/`:Compute`가 돌려주는 `State<Tween<T>>`가 strict에서 거부**됐다(M11 주 사용례). 실측 셋: (1) 새 솔버 `State<X>`는 불변 — `State<T \| Tween<T>>` 하나로는 `State<T>`를 못 받아 State 멤버 둘을 각각 나열; (2) 그대로 수백 자리에 인라인하면 `DMapper` 인스턴스화가 "too complex"(Tarjan 640000·다른 한도 플래그 무효) → 프로퍼티 타입별 별칭 `PVn` 73개로 한 번만 풀게 함(1.8s); (3) `State<X>`의 X는 `Animate`가 돌려주는 `QuadTypes.Tween<T>`와 **글자 그대로 같아야** 해서 brief Q3 (a)의 quad-roblox 정밀판(`read Info: TweenInfo?`)은 포기 — `Types.Tween<T>`는 quad-types 별칭 그대로(Q3 (a) 자신이 "실측 안 맞으면 `H-nnn`"으로 열어 둠). 바깥 멤버는 데이터부 `TweenData<T>`(8.8) | ✅ `gen-d.py`(PVn·`State<Tween<T>>`)·`types.luau`·bind-system 원장 정정·tween-plan 배너. **사용자 확인 대상**: Q3 (a)의 정밀판 포기(엔진 타입 자리는 `any` — 오용은 `Enum` 자체·엔진 에러 몫) |
| `H-327` | ① | 🟡 | **[M7 하자 — Modifier setter `Field<T \| Tween<T>>`가 `State<T>`를 거부]** 옛 `Field<V>`에 `V = T \| Tween<T>`를 넣으면 `State<V>` = `State<T \| Tween<T>>`라 새 솔버 불변성 때문에 plain `State<T>`가 strict에서 막혔다(`m:Position(state)` — M7 spec은 `UDim2 \| Tween<UDim2>` 캐스트로 우회해 못 봤다). `Field<T> = T \| Tween<T> \| State<T> \| State<Tween<T>> \| None \| fn` | ✅ `gen-d.py`·`spec.modifiertypes` 정정·modifier-plan 각주. M7 원장엔 동형 규칙대로 여기서 처리 |

## §5 fable 탐사 발견 (2026-09-06, 마일스톤 밖 — `audit/fable-exploration-2026-09-06.md`)

| ID | 갈래 | 심각도 | 무엇 | 처리 |
|---|---|---|---|---|
| `H-328` | ① (확인) | 🟢 | **[단위 ② 해석 — override 정책의 주체]** 정본은 `Override`를 `Tween{...}` 옵션에 두고 슬롯엔 `{ Tween, Value }`만 저장(`H-155`) — 그러면 활성 트윈 위에 새 값이 올 때 참조되는 정책은 **들어오는 값의 `Override`**이고, plain 값이 오면 정책이 없어 `Cancel`과 같다(정본 "Tween→plain 전환은 두 옵션 모두 정리 후 즉시 덮어쓰기"). 슬롯에 정책을 안 넣는 정본 모양과 유일하게 맞는 해석 | 단위 ②에서 구현. §4 확인 항목 |
| `H-329` | ② | 🟡 | **[탐사 X-1 — 체인 리스트·키 잔존]** `Dispatch.retractFrom(…, 1)`은 `list[i] = nil`만 하고 리스트·키를 `chains`(강한 키)/gchold에서 놓지 않는다 — `State<Attribute>`가 새 그룹 객체를 emit할 때마다(`groupKey`가 객체별) 새 키+리스트가 inst 수명 동안 누적(C1 478 B/iter, C3 554 B/iter; 문자열 키 재사용·`Attribute({k = State})`는 0). `process` (B) 분기가 `retractFrom` 뒤 **같은 `list` 참조에 재설치**하므로 `retractFrom` 안에서 단순 삭제하면 체인이 끊긴다. attribute-plan *"구독은 반드시 끊음 — 자원은 새면 안 됨"*과 긴장 | **사용자 문항** — 갈래: (a) `retractFrom`의 외부 호출(재처리 아닌 순수 철거)에서만 리스트를 비우면 `chains`/gchold 해제 / (b) 그룹 키를 `(inst, name)` 단위로 재사용(객체별 키 폐기 — attribute-plan 키 모양 역전) / (c) UB 문서화(동적 그룹 객체 churn은 사용자 몫). 권고 **(a)** — 메커니즘이라 착수 안 함 |
| `H-330` | ① | 🟡 | **[탐사 X-2 — blame이 quad 내부 줄]** Slot의 디스패치·발행 깊이 raise 8곳(`claimOwner`/`claimOwnerAt`/`wrapElement` 검증/`mountSlot` destroyed/KeyGone)이 `errorBeforeNearest`라 최근접 표면(`SlotHandler.process`)의 호출부 `Dispatch/init.luau:224`를 blame; `Source:Set`이 태그된 `Impl.Emit`을 직접 호출해 파동 안 모든 Nearest raise가 `Source.luau:73`을 blame(B3/B8) | ✅ 8곳 `errorBefore`(`H-272` 선례 — `wrapElement` 공용 경로는 직접 `Add`에서도 최외곽 blame이 되는 트레이드오프), `Source` 꼬리를 태그 없는 로컬 `bumpAndEmit`으로(`H-250`). spec.slot 7b·spec.observer 9a |
| `H-331` | ① | 🟢 | **[탐사 X-3 — Tag holders 누적]** 이름별 holders 테이블이 비어도 안 지워짐(동적 이름 ×5000 → 954 KB) | ✅ retractor가 빈 집합을 `tagNameMap:SetStrong(inst, name, nil)` |
| `H-332` | ① | 🟢 | **[탐사 X-4 — Observer `_running` 재진입]** fn 안에서 자기 State를 Set하면 중첩 `_receive`가 `_running = false`로 내려 바깥 fn 꼬리가 가드 없이 진행(`H-183` 구멍) | ✅ `_receive`·`_catchUp` 둘 다 save/restore. spec.observer 9a |

## §4 배치 회신 대기 (② 갈래)

**열린 문항 1, 확인 항목 3**:
- **문항 `H-329`** — 비워진 체인 리스트·키의 해제 시점(권고 (a) — `retractFrom` 외부 호출에서만 해제). M11 영역(Property 핸들러)과 겹치지 않아 착수를 막지 않는다(사용자 2026-09-06 규칙).
- 확인 `H-324` — `TweenConstructor`를 8.6 예외(함수∩테이블 교집합 + 모듈 쪽 이중 캐스트)로 둔 것.
- 확인 `H-326` — Q3 (a)의 quad-roblox 정밀판(`read Info: TweenInfo?`) 포기 — `Types.Tween<T>`는 quad-types 그대로.
- 확인 `H-328` — override 정책의 주체는 들어오는 값(단위 ②).
