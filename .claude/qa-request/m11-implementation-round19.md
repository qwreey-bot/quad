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

## §4 배치 회신 대기 (② 갈래)

**열린 문항 0, 확인 항목 2**(사용자가 뒤집으면 타입 별칭·캐스트 한 줄 수준):
- `H-324` — `TweenConstructor`를 8.6 예외(함수∩테이블 교집합 + 모듈 쪽 이중 캐스트)로 둔 것.
- `H-326` — Q3 (a)의 quad-roblox 정밀판(`read Info: TweenInfo?`) 포기 — `Types.Tween<T>`는 quad-types 그대로.
