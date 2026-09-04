# M7 단위 ④ 실측 — 클래스 태그 마커·`As`·`Into`·상위 클래스 Modifier (2026-09-04)

> **이 파일이 무엇인가**: M7 단위 ④(`modifier-plan.md` 11절) 착수 **전** 스크래치
> 실측(사용자 제안 스파이크 둘 → 설계 대화 → 최종 구성)과 착수 **후** Studio
> 스모크의 기록. 계획이 아니라 결과. 규칙의 소형 재현은 `luau-test/done/31`,
> 실물 규모 양성 회귀는 `quad-roblox/test/spec.modifiertypes.luau`, 솔버 규칙은
> `typing-limits.md` 8.9절이 정본. 스크래치 생성기·변형 D·격리 파일은 세션
> scratchpad에만 있었고 레포엔 남기지 않았다(재현은 아래 표의 조건이 소스).

도구: `luau-lsp 1.69.0` 새 솔버(`LuauSolverV2=true`), `test.sh` 플래그
(`LuauTarjanChildLimit=160000`, `LuauSubtypingIterationLimit=100000`), 핀 defs.
실물 규모 = D 스코프 31클래스(+ 조상 16).

## 1. 사용자 제안 스파이크 둘

### 1-1. 클래스 문자열 싱글톤 마커로 children 자리의 클래스 소속 검사 회복

| 변형(마커) | too complex | 분석 시간 | 다른 클래스 Modifier 거부 |
|---|---|---|---|
| 현행 `{ read __quadModifier: true }` | 없음 | 2.9s | ✗ (`H-313`) |
| `"FrameModifier"` 자기 클래스만 | 없음 | 2.9s | **✗** |
| 조상 체인 마커 나열 / 한 멤버에 문자열 유니언 | 없음 | 2.9s | **✗** |
| 위 + `Apply: <U>(self: any, factory: (any) -> U) -> U` | 없음 | 2.9s | **✓** |
| 위 + `Apply: <U>(self: any, factory: (<Class>Modifier) -> U) -> U` | 없음 | 2.9s | ✗ (factory 인자의 재귀만으로도 샌다) |

마커는 문제가 아니었다. 격리(작은 타입으로 12개 조합)로 얻은 규칙:
**서브타입 테이블에 자기 타입을 참조하는 함수 필드가 있고, 유니언의 어느
멤버가 같은 이름의 함수 필드를 가지면 유니언 검사가 조용히 통과한다.** 재귀
없는 충돌(`Zed: () -> number`)·충돌 없는 재귀·문자열 필드끼리의 충돌
(OnChange의 `Name`)·단일 테이블 슈퍼타입은 전부 정상 거부. children 유니언엔
`Tag.Apply`/`State.Apply`가 있고 `<Class>Modifier.Apply`가 재귀라 정확히 여기
걸렸다. `Apply`를 `(self: any, factory: (any) -> U)`로 두면 닫힌다. 손실:
무주석 팩토리는 현행에서도 이미 에러였고(제네릭 람다가 `(X) -> U`에 안 맞음)
바뀐 뒤엔 `any`로 통과한다 — 주석 붙인 팩토리는 그대로 타입드. Tarjan 비용은
그대로(40000이면 여전히 too complex).

### 1-2. 공유 props를 `&` 교집합으로 호이스팅

조상별 `InstanceProps & GuiBase2dProps & GuiObjectProps & …`(39개 테이블, 생성
파일 2937 → 2037줄)로 찍자 **양성이 전부 에러** — `D.Frame({})`조차 `{number}`로
추론돼 거부. 소형 격리도 동일(`Leaf<E> & Shared`에 키 있는 리터럴 거부,
인라인 교집합에 `{}` 거부 — `luau-test/done/31` Q4). 원인: 리터럴이 conjunct마다
따로 대조되는데 인덱서를 가진 conjunct가 자기에게 없는 문자열 키를 `number`
인덱서 위반으로 거부한다(평면 Param에서 오타를 잡아주는 바로 그 메커니즘).
분석 시간도 2.7s로 차이 없음 — 중복은 소스 부피일 뿐 검사 비용의 원인이
아니다. **도입 불가로 닫음.**

## 2. 설계 대화 뒤 최종 구성의 실측

사용자 제안: 검사형 `As`(하위 클래스만) + 무검사 `As<<T>>()` 병존 + `Into<Class>`
인터페이스(Rust `Into`) + 자기 자신도 `As<Self>` 구현 + 상위 클래스 Modifier
분리 + Param은 전부 인라인 유지. 실측한 `As` 네 모양:

| `As` 모양 | 결과 |
|---|---|
| `As: <K>(self, class: K & keyof<Desc>) -> index<Desc, K>` (`:As("TextLabel")`) | 선언부 too complex — 한도 플래그 10종(`TypeFamilyGraphReductionMaximumSteps`/`TypeFamilyApplicationCartesianProductLimit`/`TypeInferRecursionLimit`/`NormalizeCacheLimit`/`TypeInferIterationLimit`/`CheckRecursionLimit`/`TarjanChildLimit`/`Normalize*Limit`/`TypeFunctionSerdeIterationLimit`) 전부 무효 |
| 오버로드 교집합 `((self, "TextLabel") -> TextLabelModifier) & …` | too complex |
| **`AsTextLabel: (self) -> TextLabelModifier` 클래스별 메소드** | **전부 통과** — 음성 9건 전부 거부, 잎 클래스엔 `As*` 부재 |
| `As: <T>(self) -> T` (`:As<<T>>()`) | 통과, 대상 검사 없음(의도된 확장점) |

최종 조합(하향 `As<Desc>` + 항등 `As<Self>` + 무검사 `As<<T>>()` +
`Into<Class> = { As<Class>: (self: any) -> <Class>Modifier }` + 조상 체인 마커 +
`Apply` any): 실물 규모 **양성 전부 클린, 음성 12건 전부 거부**(형제 클래스
Modifier를 자식에 / 조상 아닌 클래스로 As / 잎의 As / As 뒤 다른 클래스
setter / Into 불만족·잘못된 반환 / 오타 키 회귀 / Mapper 자리). 분석 3.1s.

- `Into`의 `self`는 `any`여야 한다 — `self: IntoTextLabel`이면 반공변 때문에
  setter를 가진 실제 Modifier가 안 들어온다.
- **플래그 하나 추가**: 상위 클래스 캐스트 자리(`ModifierNS.GuiObject = …`)와
  상위 클래스 팩토리를 `Apply`에 넘기는 자리가 `LuauTypeInferIterationLimit`
  (기본 20000)에 걸린다 — 50만이면 0건, 100만으로 핀. 시간 무해.
- **상향 `As<Ancestor>`(TextLabel → GuiObject)**: 왕복까지 타입드로 성립하지만
  상하위 상호 참조 순환으로 분석 시간 3.1s → 8.5s. **채택 안 함** — 상향은
  무검사 `As<<T>>()`/`As(name)` 몫.
- `As` 접두와 겹치는 스코프 프로퍼티는 `AspectRatio`/`AspectType`뿐(As 뒤가
  소문자 — 접두 규칙 `^As%u` 밖). 스코프 프로퍼티 이름과 State/Tag/Attribute
  메소드 이름의 충돌은 0.

## 3. 착수 후 — 실물 D 음성 12/12 + Studio 스모크 8/8

생성기 반영 뒤 실물 `D`에 대한 음성 12건(위 목록) 전부 거부 확인(스크래치,
삭제). Studio(`Place1.rbxl`, rojo 싱크 — `.Source`에 `Define`/`castTo` 확인):

| # | 확인 | 결과 |
|---|---|---|
| 1 | `D.Modifier.GuiObject():Visible(false):ZIndex(3):AsTextLabel():Text("from-as")`가 `D.TextLabel{}`의 실물 프로퍼티로 앉음 | PASS |
| 2 | 태그 — 생성 생성자 `"Frame"`, 하강 뒤 `"TextLabel"`, base `Modifier()`는 `true`, setter는 태그 유지 | PASS |
| 3 | 상위 클래스 Modifier를 캐스트 없이 `D.Frame{}` 자식에 — flatten은 태그를 안 봄 | PASS |
| 4 | 캐스트 error 넷(미등록 / 형제 / 상향 / 오타 접두 `AsTextLabl`) — blame이 사용자 줄(`AssistantCommand:20`) | PASS |
| 5 | `quad.Modifier.Define("MaterialButton", "TextButton")` 커스텀 클래스 — 생성자 태그, `Into` 형 헬퍼가 GuiObject Modifier를 받아 하강, `As("MaterialButton")` 무검사 재태그, 재-Define 동일 생성자 | PASS |
| 6 | 커스텀 클래스 값이 `D.TextButton{}`를 구동 / 상향 `AsTextButton()` 거부 / `As("TextButton")`은 강제 | PASS |
| 7 | `Overridden` 결과 무타입 + `As()` 무인자 항등 | PASS |
| 8 | **[소멸된 규칙 — 그 시점 계약, 4절 분리 뒤엔 반대로 허용됨]** `Define` error — 다른 부모로 재등록 / 미등록 부모 | PASS(당시) |

첫 시도의 FAIL 하나는 스모크 자체의 오류였다(6번을 `Material(...):AsTextButton()`
상향으로 적어 검사형이 정확히 거부) — 결함이 아니라 계약 확인.

## 4. 후속 — `Define` 분리 뒤 재실측 (같은 날)

사용자 결정(*"Define 은 단순해져야해. 하나의 동작만"*)으로 `Define(name, parent?)`을
`TypedFactory(name)`(이름 + 태그 생성자) / `DefineSubtype(parent, subtype)`(간선 하나,
부모 여럿 허용)으로 가른 뒤 Studio 스모크 8/8 재실측 — 위 표의 1~4·7과 같은
항목(8행은 규칙이 반전돼 제외 — 다른 부모 재등록은 이제 부모 추가, 미등록 부모는
성립하지 않는 케이스)에 더해: 부모 둘(`TextButton` + 인터페이스 `Elevated`)을 가진
`MaterialButton`이 두 경로 모두에서 `AsMaterialButton()` 하강 통과, 잎부터 등록해도
됨(순서 자유), 같은 간선 재등록 no-op, 순환(`DefineSubtype("MaterialButton",
"TextButton")`) 거부, `TypedFactory` 같은 이름 → 같은 생성자. 위 3절 표 5행의
`Define` 표기는 개명 전 기록이고(dedup 계약은 `TypedFactory`로 그대로 산다),
8행은 위 태그대로 소멸된 규칙이다.

