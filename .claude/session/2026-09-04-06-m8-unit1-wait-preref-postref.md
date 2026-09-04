# 2026-09-04 (06) — M8 §0 확정 + 단위 ①: `:Wait`·`PreRef`·`PostRef`

> 원문 로그. 정본은 `base/ref-plan.md`("API 모양" 절의 `:Wait` 항목, "`Ref`의
> retract" 절 의사코드 순서, "`PostRef`" 절 보장 범위), 규약은
> `qa-request/m8-implementation-round18-brief.md`(§0 회신 블록), 발견은
> `-round18.md`.

## 1. §0 회신

사용자 원문은 brief §0 회신 블록에 그대로. 요지: Q1~Q5 (a). **Q6는 문항의
전제를 사용자가 정정** — *"'먼저다' 는 아니긴 함. Claim 을 건다던가, 어딘가 이미
Parent 가 셋팅 되든 우린 상관 안 함. 우리가 정의할 수 있는건 단지 자식이 다
붙은 다음이지"* → `PostRef`의 보장은 "자기 서브트리 완성"뿐, 부모 부착 여부는
어느 쪽도 보장하지 않음(정본 "`PostRef`" 절·ROADMAP M8 정정). **Q4는 지시**
(*"다른 내가 못 본 동작 변이가 있는지만 보고, 괜찮다면 택해줘"*)대로 훑었다 —
같은 v 재진입만 고쳐지고(dedup), 다른 v'로의 재진입은 순서와 무관하게 기존
UB, 콜백 error 중단은 no-pcall 계약상 실질 차이 없음 → (a) 채택, 정본 의사코드
`relate:SetWeak`를 `v:Set(inst)` 앞으로. **Q5**: *"항상 기다리면 돼. 그럴 땐
Option/Monad 같은 값을 제공하면 된다고 생각함 … 유저가 간단히 만들어 주입
가능한 타입"* → `Wait`는 채워져 있어도 다음 `:Set`까지, "값 없음"의 구분은
사용자가 `Just`/`Nothing`류를 `T`로 주입(quad가 개념을 도입하는 건 필요 시
사용자 결정) — 정본 "API 모양" 절에 등재.

## 2. 단위 ①

- `Ref.luau` `:Wait(thread?)` — 대기자는 이미 M2가 `:Set`의 thread 키 분기로
  받아 두었던 자리(`spec.ref` 9절이 흉내 내던 등록을 실물로). 태깅 `H-231`.
- `PreRef.luau`/`PostRef.luau` — 같은 템플릿(브랜드·마커·`_fired`만), 헤더에 각자의
  fire 시점(PostRef는 Q6 정정 반영).
- quad-types: `Wait`, `PreRef<T>`/`PostRef<T>`(교집합 마커 nominal), `Quad` 필드.
  새 export type이라 relink만으론 안 보이고 `pesde install`이 필요했다.
- spec: `spec.ref` 12~14절, `spec.preref` 3절. 3절을 짜다 정본 "Modifier 필드
  어디든" 옛 문장이 `modifier-plan` 4절과 어긋난 걸 봤다 → `H-316` 한정 각주.

## 3. 끝 절차

감사 1라운드 8건(옛 "부모에 붙기 전" 서술 5곳 — lifecycle-hooks-plan 두 곳·
documentation-content-map·README 두 행, `Modifier 필드` 잔여 2곳, round12
포인터 닫힘) 반영. `/code-review medium` 2건 — `Ref<T>` self 반환 메소드를
`<Self>` 제네릭으로(`H-317`, 소형 실측 뒤 반영; 확인 항목으로 §4에), `:Wait()`
`isyieldable` 가드(`H-318`). doc-check ERROR 0, test.sh 39 파일 통과.

