# 핸드오버 전체 코드 리뷰 원장 — 2026-09-07 (`H-344`~`H-356`)

> **이 파일이 무엇인가**: 마일스톤 M0~M11 완료 뒤 핸드오버 시점에 돌린 **전체 코드
> 리뷰**(마일스톤 단위 원장이 아니라 코퍼스 전체 — 그래서 `mN-implementation-roundNN`
> 이름을 안 쓴다)의 발견 원장. 사용자 요청(2026-09-06): *"세션 로그와 전반 구조를
> audit 하고 코드리뷰 해줘, 전체 코드 리뷰를 해도 좋아 … 여럿 코드리뷰를 돌려보기
> 좋은 상황이야"*. 발견 번호는 round21(`H-341`)·round19 리뷰(`H-343`)에 이어
> **`H-344`부터**. 세 갈래·처리 규약은 round11 brief 준용. 상태의 소스는 이 파일.
>
> **경위(중요 — 규약 `conventions.md` 2026-09-06 항목의 두 번째 사례)**: 2026-09-06
> 밤에 띄운 리뷰 9개(R1~R3 opus + `/code-review high` 포크와 앵글 5)가 사용자의
> `/compact` 인자 편집 중 **전부 중단**됐다. 2026-09-07 새벽에 (1) 중단된
> 트랜스크립트에서 sonnet 서브에이전트가 발견 후보를 추출하고, (2) 같은 지시로
> R1~R3·`/code-review high`를 **다시** 띄웠다. 아래 표는 둘을 합친 것 — "출처" 열의
> `구R*`/`구A*`는 중단분 추출, `R*`는 재실행분. 중단분의 실측 로그(`tmp.*`/`zz_probe*`
> 스크래치)는 판정 근거로만 쓰고 삭제했다(측정치는 표에 전사).

## §1 반영한 것 (갈래 ① — 이 커밋)

| ID | 출처 | 자리 | 무엇 | 처리 |
|---|---|---|---|---|
| **`H-344`** | R2-3 / 구R2 / 구Simplification / 판정 보조자 — **셋이 독립 발견** | `quad-base/src/Tag.luau` `Removed` | `Added`는 `flattenInto`로 비문자열을 거부하는데 `Removed`는 검증 없이 조용한 no-op, `nil`은 VM "table index is nil"(실측)로 `Tag.luau`를 blame | `Removed`도 `flattenInto`를 태운 뒤 제거(본문 재사용). `spec.tag` 음성 둘 |
| **`H-345`** | R2-1 | `quad-base/src/Attribute.luau` `flattenArg` 셋째 분기 | `type(arg) == "table"`만 보고 "plain"을 강제하지 않아 `Attribute(source)`가 `_value`/`Revision`/`_subs`를 속성 이름으로 펼친다 — Modifier가 `H-310`으로 이미 닫은 사고(`isPlainFieldTable`) | `getmetatable(arg) == nil` 조건 추가 → 나머지는 기존 else 메시지("plain tables"). `spec.attribute` 1b절 |
| **`H-346`** | R1-2 / R2-2 | `quad-base/src/Dispatch/init.luau` `BRAND_PROBES` | 모듈 표면 술어 중 `isMapperDescriptor`만 누락 — 체크리스트 0-b(`H-338`/`H-342`의 마지막 잔여) | 목록 머리에 추가. `spec.claim` 7절이 `brand: MapperDescriptor`를 단언 |
| **`H-347`** | R1-3 | `quad-base/src/Store.luau` 생성자 | `Of`는 `H-201`로 키 타입을 검사하는데 생성자 문은 열려 `Store({ Source(1) })`가 통과, `Names()`가 `{ 1 }` | `type(name) ~= "string"` → `errorBeforeNearest`. `spec.store` 음성 |
| **`H-348`** | R1-4 | `quad-base/src/LifetimeHandle.luau` 미설치 스텁 | 지배적 발화 지점이 디스패치 깊이(`process` → `bindLifetime`)인데 `errorBeforeNearest` — 체크리스트 0의 실패 모드. 실 백엔드(`quad-roblox/src/LifetimeHandle.luau`)는 `errorBefore` | `errorBefore`로 통일 |
| **`H-349`** | 구Conventions-1 | `quad-base/src/init.luau` `UseProvider` 중복 설치 에러 | 직접 호출 표면인데 `errorBefore` — 체크리스트 0의 판별대로면 `errorBeforeNearest`(단일 태그 프레임이라 관측상 동일, 일관성) | 교체. `spec.robloxfactory` `assertBlamesUser` 그대로 통과 |
| **`H-350`** | R1-1 | `quad-base/src/Bookkeeping.luau` `getOffsetAt` | 루프 중 재시작이 `math.max(cursor, 1)`로 클램프해 커서가 0으로 내려간 경우(M6 splice `j-1 = 0`·owner base 이동)에 **옛 `offsetCache[1]` 위에** 캐시를 다시 쌓는다 — 그 자리 주석의 전제("M3에선 1 밑으로 안 내려간다, M6가 base를 다시 읽어야")가 M6 착지 후 미이행 | 부트스트랩을 `ensureBase()`로 빼서 재시작 직전에도 호출. **in-tree 재현 경로 없음**(`setLength` 호출부 전수가 상수/`slot.Length`) — spec 없이 정본 의사코드만 갱신(`dispatch-core-plan.md`) |
| **`H-351`** | R3-1 | `quad-roblox/src/types.luau` `NewChild` | children 값 유니언에 `Slot`이 없다 — `bind-system-plan.md`가 M5에 예고한 "M6 Slot" 확장 팔이 fork 슬라이스에서 실행되지 않았다(M7/M8/M10은 마커 있음). 런타임 `SlotHandler`는 받는다. strict spec 7개 중 children에 Slot을 넣는 것이 없어 살아남음 | `\| QuadTypes.Slot<Instance>` 합류(생성 `<Class>Elem` 전량 — "too complex" 없음, CLI 49/49). `spec.componenttypes` `_slotChild`. **`State<Slot<…>>` 팔은 §4 Q1** |
| **`H-352`** | R3-4 / 구A3(실측: 활성 트윈에 `None` → 취소 0, 끝까지 재생) | `quad-roblox/src/Handlers/Property.luau` 헤더 | 헤더의 "마지막 쓰인 값이 남는다"가 활성 트윈 분기에선 참이 아니다 — 동작은 **의도된 것**(`spec.tweenproperty` 5절 "None → nil: skip-defense, active tween untouched") | 헤더에 예외 한 줄. 코드 변경 없음 — 버그로 재개봉 방지 |
| **`H-353`** | R3-2(추정) → **메인 실측 확정** | `scripts/gen-d.py` `PVn`·Modifier setter | 유일한 유니언 프로퍼티 타입 `UICorner: number \| UDim`의 `PV73 = … \| State<number \| UDim> \| …`가 `Source(8)`/`Source(UDim)`을 **둘 다 거부**(`State<X>` 불변, `H-326`/`H-327`) — 인라인 리터럴·로컬 바인딩·Modifier `:UICorner(radius)` 전부 실측 거부. `spec.shorthandtypes`는 `UICorner`에 State를 한 번도 안 넣어 우회 | 유니언 타입은 **멤버마다** `State<m>`/`TweenData<m>`/`State<Tween<m>>` 팔을 나열(`PV73` 9팔), setter는 `Field<number> \| Field<UDim>`. `LuauSolverConstraintLimit=1000000` 그대로 통과. `spec.shorthandtypes` 양성 넷. `typing-limits.md` 8.9절 |
| — | R3-5 | `spec.tweentypes` 헤더 | `H-324` 교집합 서술이 `H-343` 이후 stale | 문장 정정 |

## §2 기각·확인만 한 것 (재발견 금지)

| 출처 | 무엇 | 판정 |
|---|---|---|
| 구A1(실측: `tmp.b1`) | `Effect`의 `fn`이 함수가 아닌 값을 cleanup으로 반환하면 rerun에서 `attempt to call a table value`, 이후 `_running`/`_cleanupRunning`이 stuck돼 `Unsubscribe` 거부 | **기각 — 문서화된 계약**. `Effect.luau` 헤더 *"errors leave `_running` / `_cleanupRunning` set — that Effect is dead, by contract"*(no-pcall 규칙). 1차 방어는 타입(`fn: () -> (() -> ())?`). 비함수 검사 추가는 "드문 오용 방어" 원칙 위반 |
| 구A2(실측: `zz_probe3` EXP B) | `Splice(2,1,X,Y)` 뒤 mock의 물리 자식 순서 `a,c,X,Y` vs 논리 `a@0 X@1 Y@2 c@3` | **기각 — 물리 순서는 계약 밖**. `dispatch-core-plan.md` 1498행: Roblox는 `LayoutOrder`/`ZIndex`가 `Parent` 배열 물리 순서와 분리, Slot은 `LayoutOrder`를 건드리지 않는다(같은 문서 1562행 폐기 기록). 논리 순서·Offset은 정확 |
| 구R2(실측: `tmp.r2leak`/`r2bisect`, 원인 미특정 채 중단) | Attribute 그룹을 같은 이름으로 churn하면 사이클당 30~75 B 누적 | **기각 — 누수 아님(메인 재실측)**. (1) `AK._newUncachedKey` 생성만 해도 30.72 B/cycle, (2) 순수 Luau `setmetatable({}, {__mode="k"})`에 삽입만 해도 **동일 32 B/cycle**(N=128000까지 선형), (3) 100사이클마다 `collectgarbage("collect")`를 끼우면 Tag/Attribute 1·3이름/사설 키 churn **전부 0 B/cycle**. 즉 Luau CLI의 GC 페이싱 아래서 약참조 **키** 테이블(Brand 레지스트리·Relate 버킷)의 노드 배열이 고수위까지 커진 채 남는 것 — quad 코드의 강참조 잔여가 아니다 |
| R2·구R2·판정 보조자 | `Ref:Wait(thread)`에 죽은 thread → `:Set`이 `coroutine.resume` 실패로 에러, 남은 콜백 미발화 | 기결정 `H-170`/`H-339` |
| 구R1(실측: `tmp.r1h`) | 핸들러 `process` 안에서 자기 키를 `retractFrom` → 반환한 retractor 미호출 | 체크리스트 5 "재진입/자기 재정의 무방어" 계약 범위(R1 재실행도 같은 판정) |
| 구R1(`tmp.r1i` — 하네스 오류로 미완주) | `Compute` 안에서 `slot.Offset:Set()` 재진입의 오프셋 캐시 | **`H-350`이 닫은 자리**와 같은 축(base 이동 → 커서 0). 별도 항목 없음 |
| 구Conventions-2 | `Claim.luau` `isMapperDescriptor` 검사의 `errorBefore` | 유지 — 리뷰어 본인이 "근거 약함". `Claim`은 DFS 경로에서 자기 하위 에러의 최외곽 blame 자리이기도 해 outermost가 맞다 |
| 구Conventions-3 | `type-version-check`의 `pcall` | 오탐(컴파일타임 type function — "no-pcall" 규칙은 런타임 계약) |
| R1(번호 없음) | `drive`의 recompute 호출부가 `bk.recomputeBlocker`만 보고 배치 `blocker:IsOn()`은 안 봄(`H-119` 문구는 둘 다) | 확인 항목 — `_handles`가 in-tree에서 비어 검사가 공허. 공개 `getBlocker`를 게이트 정책으로 쓰는 제3자가 생기면 실효. 코드 변경 없음(§4 Q3에 묶음) |
| 구A1 퍼저 | 반응형 그래프 정합성 300 trial·게이트/블로커 400 trial | 실패 0 — `audit/fable-exploration-2026-09-06.md`와 같은 결론 |
| R3 | `OnChange` `setLength` anchor·초기값 발화 순서·`UseProvider` 락·`Animate` 의사코드·Property 3-상태·InstanceShorthand·연결 해제·mock↔실 프로바이더 계약 | 전부 정본 일치(원장 R3 본문에 근거 기록) |

## §3 확인 항목 (코드 변경 없음, 기록)

- **`H-354`** — strict에서 타입드 Slot을 만드는 관용구는 **`q.Slot() :: QuadTypes.Slot<Instance>` 캐스트뿐**. `q.Slot(nil :: { SlotElement<Instance> }?)`·`q.Slot({} :: {…})`·`local s: Slot<Instance> = q.Slot()`는 전부 "too complex" 또는 불일치(생성자 `<T>(initial: { SlotElement<T> }?)`에서 `T`가 `T | State<T> | Slot<T>` 안쪽이라 추론이 안 되고, 배열 타입은 불변). M6 fork가 strict spec을 안 남겨 드러나지 않았던 것. `typing-limits.md` 8.9절에 기록. 생성자 시그니처를 바꾸는 건 새 표면 — 필요가 관측되면 문항.

## §4 사용자 문항 (갈래 ②)

| 문항 | 무엇 | 선택지 | 권고 |
|---|---|---|---|
| **Q1** (`H-351` 후속) | `NewChild`에 `State<Slot<Instance>>` 팔도 넣을지 — 런타임은 StoreBind 언랩으로 도착하고 `isHandlable`이 `isSlot`만 보므로 동작은 이미 된다. 타입만의 문제 | (a) 넣는다(`State<Slot<Instance>>` 한 팔 — `State<X>` 불변이라 그 글자 그대로만) / (b) 안 넣는다(`State<Slot>`은 slot-plan의 "교체는 언마운트" 의미론이 있는 드문 관용구 — 필요가 관측되면) | **(b)** — 관측된 필요 없음, 팔 하나가 "too complex" 예산을 먹는다 |
| **Q2** (R3-3, **`H-355`**) | children 유니언에 `Observer`/`EffectHandle`도 없다 — `state:Observer(fn)`을 children에 놓는 관용구는 `source-state-plan.md`가 정본화했고 leaf 핸들러가 받는데 strict는 거부 | (a) 둘 다 넣는다 / (b) `Observer`만 / (c) 안 넣는다 | **(a)** — 정본화된 관용구가 strict에서 막히는 건 `H-351`과 같은 모양. 다만 M5 확장 목록에 이름이 없었으니 사용자 확인 |
| **Q3** (구 앵글 Efficiency/Simplification/Reuse/Altitude, **`H-356`**) | 코드 품질 제안 묶음 — 결함이 아니라 판단 대상이라 반영 안 함: ① `Slot:List` 재정렬 O(N²)(N=1000에 19.6ms 실측)·reconcile마다 `table.clone(prevKeys)`·`prepareElements` 전체 재스캔 / ② `notInstalled` 스텁 팩토리가 `Tag.luau`·`AttributeKey.luau`에 바이트 동일 / ③ `registerEmptySlot` 관용구를 quad-roblox `OnChange`·`InstanceChild`가 패키지 경계 때문에 인라인 복제(`None.luau` 주석은 `OnChange`만 승인) / ④ `Property.luau`·`Event.luau`의 Reflection 캐시 손코딩 중복 / ⑤ `Dispatch/Modifier.luau`가 `Ref.luau`의 `addProcessed` 팩토리를 안 쓰고 세 번째 사본 / ⑥ Slot CRUD 9곳 `assertLive; assertManual` 복붙 / ⑦ `gen-d.py`의 `reserved`·`union_member_functions`·`SHORTHAND` 목록이 런타임 소스(`Modifier.luau`·`types.luau`·`InstanceShorthand.luau`)를 안 읽고 손 복제 / ⑧ `drive`의 배치 Blocker 검사(§2 마지막 행) | 항목별 (a) 반영 / (b) 보류 | ①은 **(b)**("관측된 병목에만" — 실측이 벤치지 실사용이 아님), ②③⑤⑥은 **(a)** 후보(본문 공유가 아니라 데이터·순수 헬퍼 공유라 "하나가 두 일" 위반 아님)지만 리뷰 제안이라 사용자 결정, ④는 `H-302`가 갈라 둔 자리라 **(b)**, ⑦은 **(a)**(조용히 어긋나는 손 복제 — `SHORTHAND`는 `InstanceShorthand.luau` `TABLE`에서 읽게), ⑧ **(b)** |

`/code-review high`(재실행분) 결과는 도착하는 대로 이 파일에 이어 쓴다.
