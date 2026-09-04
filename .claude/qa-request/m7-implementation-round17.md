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

| `H-311` | ① | 🟢 | **[단위 ② — flatten + 센티널 + 핸들러 + drive 봉합]** `Modifier.luau`에 `flatten`(정본 의사코드 1:1 — 역순 `for`, `~= nil` 건너뛰기, in-place, `ProcessedModifier` 소진)·`ProcessedModifier`(frozen·이름 있는 센티널, 최상위 재노출 없음), `Dispatch/Modifier.luau`에 `ProcessedModifierHandler`(`H-35` 1:1, HIGH — NoneHandler/NilHandler와 같은 대역·서로소 매치, InitDispatch가 None 쌍 옆에서 등록), **`Dispatch.drive`가 첫 줄에서 `flatten(flattened)`**(Q4 (a) — 배치 판정 앞, 배열 길이를 바꾸지 않으므로 순서 무관), 생성 `D`의 ③ 스텁 제거·`Claim` 헤더 정정. `spec.flatten` 3절 + `spec.handlers` 10절 + `spec.claim` 8절, Studio 3/3(`audit/m7-unit2-studio-2026-09-04.md`). 정본 정정: bind-system 파이프라인 의사코드 ③④, modifier-plan flatten 절 배너 | ✅ 구현 완료. 관측 하나: `mod:X(None)` 필드는 NoneHandler → nil → Property `v == nil` 방어로 **쓰기를 건너뛰어** 실물에선 기본값이 남는다(Studio 2번 — 정본 2-1 "실제 지우기는 NoneHandler가 담당"의 실물 귀결, 결함 아님) |

| `H-312` | ② | 🟡 | **[단위 ② 끝 절차 `/code-review`]** flatten은 배열부만 훑으므로 **해시 키 자리의 Modifier**(`D.Frame { Name = mod }`)는 소진되지 않고 raw로 디스패치된다 — 실프로퍼티 키면 Property 핸들러가 `inst.Name = <Modifier>`를 시도해 엔진 원시 에러(blame이 quad 핸들러 줄), 비프로퍼티 키면 일반 no-match. 정본 flatten 절은 배열부만 서술하고 해시 자리 배치는 침묵 | ⏳ 갈래: (a) **flatten이 해시 파트도 훑어 Modifier 값이면 surface error**("Modifier는 배열부에 놓는다" 진단 — drive마다 해시 키 순회 한 번, 권고) / (b) UB로 문서화만 / (c) 무시. 코드엔 `-- TODO(H-312)` 마커 |
| 리뷰 기각 | — | — | `ProcessedModifierHandler`의 `setLength(inst, k, 0, inst)` 4번째 인자를 NilHandler처럼 빼라는 제안 — **정본 `H-35` 의사코드가 `inst`를 명시**하고 `TagFallbackHandler`도 같은 모양이라 1:1 전사를 유지(anchor는 `isState(len)` 분기에서만 읽혀 지금은 무해) | 기각 기록 |

## §4 배치 회신 대기 (② 갈래)

| 번호 | 문항 | 권고 |
|---|---|---|
| `H-310` | `Modifier(...)` 인자 모양 — 초기 필드 테이블 (a) / 전부 error (b) / 무시 (c) | (a) |
| `H-312` | 해시 키 자리의 Modifier — flatten이 해시부도 훑어 error (a) / UB 문서화 (b) / 무시 (c) | (a) |
