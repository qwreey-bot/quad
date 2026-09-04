# 2026-09-04-01 — M7 착수: §0 회신 + 단위 ① Modifier 값 런타임 (자율 구간)

## §0 회신 (사용자)

Q1~Q4 권고 (a) 채택. Q5(상위 클래스 Modifier 타입)는 (a)로 착수하되 **후순위
확정** — 원문: *"textbutton/textlabel 전부 Boldify 같은걸 쓸 수 있어야 할텐데,
안 해두면 둘 다 따로 만들어야 하는 부분이라서. 상위 클래스에 대해서 생성하는건
있을 필요가 있긴한 부분이라 생각해. 다만 지금 당장 할 필요가 있냐 하면 그건
아닐 수 있어. … 최종 개발에 있어 적용되어야할 방식은 지금 권고대로 끝나는건
아쉬울 수 있다, 정도만 짚어주고 싶어"*. → brief §0 회신 블록, ROADMAP M7
후순위 항목(스파이크 09 한계를 넘는 메커니즘도 그때 결정), modifier-plan 9-2
각주. 그 전에 사용자가 brief 표의 열 밀림(Q2 셀 코드 스팬 파이프)을 잡아
`0aa7865`로 정정.

## 단위 ① — `quad-base/src/Modifier.luau`

정본 3·4·4-1·8·9·2-1절 + 스파이크 17 구조의 1:1 전사. 재량으로 정한 것(round17
`H-309`, 뒤집기 가능): setter 클로저의 핸들러 계층 값 error는 `error(msg, 2)`
(클로저는 테이블 경유 호출이 아니라 태그 대상이 아님 — `H-250`), `Overridden()`
0인자는 error, outer·fields 테이블 둘 다 frozen(사용자 mutate 차단 — clone은
unfrozen 새 테이블). Brand에 `isSlot` 술어가 없어 `SlotBrand:is`를 직접 씀.
quad-types엔 런타임 표면(`Modifier`/`ModifierConstructor`·`Quad.Modifier`)만 —
클래스별 setter 타입은 단위 ③. `spec.modifier` 7절, 36 파일 전부 통과.
Studio 실측 생략(Q1 (a) — 엔진 대면 델타 없음).

## 끝 절차

- **감사 1라운드** 확실 2(bind-system 파이프라인 의사코드에 Q4 정정 포인터 부재
  → ⚠️ 주석 / CLAUDE.md·project-context 머리말 미갱신) + `Peek` 타입을 정본대로
  제네릭 `<T>`로, spec 미사용 import 제거. **감사자가 레포 루트의 미추적 코어
  덤프 `core.1440711`(47MB)을 임의 삭제**(읽기 전용 규약 위반 — 작업물 손실은
  없음, 사용자에게 보고). 코어 덤프는 OnChange 타이핑 실측 중 luau-lsp가
  죽으며 남은 것으로 추정.
- **`/code-review medium` 1회** — 2건: `Modifier(...)` 인자 무시 → §4 `H-310`
  (정본이 `args`를 암시하나 모양 미정, 권고 (a) 초기 필드 테이블) / 임포트
  3파일의 단위 목록 중복 → 포인터로 축약(체크리스트 4번). 반박: setter
  클로저 `error(msg, 2)`(태그 없는 클로저에서 errorBeforeNearest는 quad 줄을
  blame), 브랜드 검사 비용, 브랜드 목록 공유, `Overridden` 이중 시그니처.
- 탐사자 생략, Studio 생략(Q1 (a)). doc-check ERROR 0, test.sh 36 파일.
