# M7 자율 구현 **17라운드** — 발견 원장 (Modifier)

> **이 파일이 무엇인가**: **[2026-09-04 신설]** M7(Modifier) 자율 구현
> 구간의 발견 전부 — 규약은 `m7-implementation-round17-brief.md`(§0
> Q1~Q4 (a) 확정, Q5 후순위 확정). 번호는 **`H-309`부터**(메인 직렬).
> 갈래: ① 자율(코드+문서 같은 커밋) / ② §4 배치 회신 대기 / ③ 즉시 중단.
> **상태의 소스는 이 파일 자신.**

## 요약 표

| 번호 | 갈래 | 심각도 | 한 줄 | 상태 |
|---|---|---|---|---|
| `H-309` | ① | 🟢 | **[단위 ① — 값 런타임]** `quad-base/src/Modifier.luau`: `Modifier()` 바닥 생성자(콜러블 테이블 `setmetatable<{Overridden}, {__call}>` — Tag/Attribute 관용구), 제네릭 `__index`(예약 메소드 `Apply`/`Peek`/`Overridden` 우선 → 필드 setter 클로저), 내부 저장소 `FieldsKey`(outer·fields 둘 다 `table.clone`, 둘 다 frozen — 사용자 mutate 차단), 4분기 setter(plain+리터럴 / plain+함수 `fn(old)` / State+리터럴 통째 교체 / State+함수 `old:Compute(fn)`), `nil`=부재·`None`=실재값, 핸들러 계층 값 즉시 error(`isRef`(Pre/Post 포함)·`isObserver`·`isEffect`·`SlotBrand:is`·`isModifier` — **Brand에 `isSlot` 술어가 없어 브랜드 직접 조회**), `Overridden` 닷·콜론 동일 함수·0인자/비Modifier 인자 error, `H-238` 태깅(`__call`·`Overridden`). quad-types `Modifier`/`ModifierConstructor` + `Quad.Modifier`(런타임 표면만 — 클래스별 setter 타입은 단위 ③). `spec.modifier` 7절(스파이크 17 재현·State 4분기·Peek/Apply·Overridden·핸들러 계층 가드·M2 가드 재확인) | ✅ 구현 완료. 에이전트 재량 둘(뒤집기 가능): (a) setter 클로저의 error는 `error(msg, 2)`(클로저는 테이블 경유 호출이 아니라 태그 안 함 — `H-250`) / (b) `Overridden()` 0인자는 error(빈 Modifier를 돌려주는 대안보다 오용 신호가 명확) |

| `H-310` | ② | 🟡 | **[단위 ① 끝 절차 `/code-review`]** `Modifier(...)`의 `__call`이 **인자를 조용히 버린다** — `Tag("a")`/`Attribute(store)`/`Source(v)`/`Store({defaults})` 관습을 따라 `Modifier({ FontSize = 14 })`나 `Modifier(otherMod)`를 쓰면 빈 Modifier가 돌아와 오류가 렌더 시점까지 숨는다. 정본 3절은 *"`Type(args)` 팩토리 관습 … Modifier는 초기 필드가 필수가 아니므로 `args`가 비어도 되는 `Modifier()`"*라 **인자가 올 수 있음을 암시**하지만 모양은 미정 | ⏳ 갈래: (a) **초기 필드 plain 테이블 하나를 받는다**(`Modifier({ FontSize = 14, Color = state })` — setter와 같은 핸들러 계층 값 검사, 비테이블 인자는 error; `Store({defaults})`와 같은 결, 권고) / (b) 인자 전부 error(0인자만 허용) / (c) 현상 유지(무시). 코드엔 `-- TODO(H-310)` 마커 |

## §4 배치 회신 대기 (② 갈래)

| 번호 | 문항 | 권고 |
|---|---|---|
| `H-310` | `Modifier(...)` 인자 모양 — 초기 필드 테이블 (a) / 전부 error (b) / 무시 (c) | (a) |
