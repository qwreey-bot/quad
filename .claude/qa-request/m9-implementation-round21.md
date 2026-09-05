# M9 자율 구현 — 21라운드 발견 원장

> **[2026-09-06 신설]** 규약은 `m9-implementation-round21-brief.md`(§0 권고 (a)로
> 착수 — Q2 이름은 사용자 문항, 가칭으로 진행). 번호는 `H-340`부터. **상태의
> 소스는 이 파일의 표.**

## 요약 표

| ID | 갈래 | 심각도 | 무엇 | 처리 |
|---|---|---|---|---|
| `H-340` | ② | 🟡 | **[컴포넌트 경계 — 커스텀 클래스 Modifier의 커스텀 필드를 벗겨 부모 클래스로 넘길 길이 없다]** `Material({ Elevation = 2 })`(`DefineSubtype("TextButton", "MaterialButton")`)를 받은 컴포넌트가 `Elevation`을 소비한 뒤 나머지를 `TextButton` 루트에 꽂으려면 그 키를 **제거**해야 하는데, 유일한 언셋 `:Elevation(None)`은 키를 지우는 게 아니라 `None`을 디스패치하고(정본 `None` 센티널 — "명시적 없음"), TextButton엔 `Elevation` 핸들러가 없어 `no handler matched key Elevation`. 검사형 `AsTextButton()`은 11절대로 하강 전용이라 거부(정상), 무검사 `As("TextButton")`은 태그만 바꾼다. 즉 11절이 말한 "D 밖의 커스텀 구현체가 `Into<TextButton>`을 구현" 경로는 **타입에서만** 성립하고 런타임엔 그 구현 자리가 없다(`^As%u`는 예약 접두라 값에 메소드를 못 얹는다). spec.component 5절이 현 동작을 관측 | **사용자 문항** — 갈래: (a) **키 제거 연산 신설** `mod:Without("Elevation", …) -> Modifier`(불변 clone에서 키를 빼는 것 — flatten/`Overridden`과 같은 데이터 연산, 새 표면) / (b) 컴포넌트가 자기 커스텀 키의 **핸들러를 등록**(`Elevation` 키를 받는 Handler — 키 이름이 전역이라 충돌 위험, 컴포넌트마다 핸들러 하나) / (c) `None`이 해시 키에서 무매치일 때 조용히 스킵(오타가 숨는다 — 기각 권고). 권고 **(a)** — 착수 안 함(새 표면). 순수 서브타입 태그(커스텀 필드 없음)는 `As("TextButton")`으로 지금도 동작 |
| `H-341` | ① | 🟢 | **[관측 — Slot 반환 컴포넌트의 물리 순서]** `Frame{ header, ItemList{…}, footer }`에서 논리 순서(Length/Offset 부기)는 정본대로지만 mock의 `GetChildren`은 부착 순서라 나중 `Add`가 물리적으로 맨 뒤에 붙는다 — ROADMAP 백로그 "Slot 형제 순서 보장(다중 백엔드 관점)"이 이미 다루는 것(Roblox GUI는 자식 순서가 아니라 레이아웃이 순서를 정한다). spec은 `getOffsetAt`으로 논리 순서만 단언 | ✅ 기록만 |

## §4 배치 회신 대기 (② 갈래)

**열린 문항 2, 확인 항목 0**:
- **brief §0 Q2** — 경계 필드 이름 `props.Modifier`/`props.Ref`(가칭 그대로 권고 (a)). spec·정본은 가칭으로 작성됨 — 회신이 (b)/(c)면 치환.
- **`H-340`** — 커스텀 필드 제거 연산(권고 (a) `Without`). 회신까지 커스텀 필드 있는 컴포넌트 Modifier는 spec 5절이 관측한 대로 동작.
