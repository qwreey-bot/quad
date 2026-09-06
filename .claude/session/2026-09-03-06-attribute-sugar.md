# 2026-09-03-06 — `AttributeKey` 무타입화 + 타입드 스칼라 슈가 (사용자 확정 "한 발 얹기")

`session/2026-09-03-05-onchange-array-reversal.md` 보고의 "남은 것" 설명
(round16 `H10-12`의 `AttributeKey` 몫 — 해시부 특수 키가 strict
`<Class>Param<E>`에 타입으로 못 들어감, 갈래 (a) 현상 유지 / (b) 인덱서
확장 / (c) 배열부 값)에 사용자가 (c)의 변형을 확정했다.

## 사용자 원문

> "c 갈래 괜찮아보여. 내부적으로 클래임을 위해서 AttributeKey 를 여전히
> 두는데, StringAttribute 등은 핸들러 상 싱글 attr group 마냥 작동하는거지.
> 그냥 일반 AttributeKey"..." 구조는 안 달라지고, 래핑만 생기고, AttributeKey
> 는 내부적 요소로 놓는거야. 슈거로써 StringAttribute("name", value) 를
> 두고, 만일 없는 타입을 구현하기 위해서는 AttributeKey 를 쓰고, 내부
> 타입체크나 그런건 구현 쪽에 부담시키는거지(그쪽이 아니까) 괜찮아보여?
> 사실 구조를 개편시킨다기 보단, 한 발 더 얹는거야. 2 는 그냥 문서화만
> 일단 해둬. 문제 생기면 그 때 바로 볼 수 있게 말이야. 이거 끝나면 더 볼 것
> 없다면, M7 규약 문항지를 쓰자, 그런데 AttributeKey 부터 해결해야 할것
> 같아. - 이제 결과적으로 AttributeKey 는 타입이 몰라도 되는 존재가 된다.
> 고 보면 돼, AttributeGroup 에서는 Store 에 타입을 걸거나 하면 되어서,
> 괜찮은 부분이고."

읽기: (1) `AttributeKey(name)`는 그대로(해시부 키, 이름 claim의 소유자) —
제네릭 `<<T>>`를 벗은 **무타입 프리미티브**, 패밀리가 못 덮는 엔진 고유
타입용. (2) `StringAttribute(name, value)`류는 **배열부 슈가**로 "싱글 attr
group"처럼 동작. (3) 타입 검사는 슈가(구현 쪽)가 진다. (4) 에디터 fflags는
문서화만. (5) 이 단위 뒤 M7 규약 문항지.

## 설계 판단 — 새 핸들러 없음

"싱글 attr group 마냥"을 문자 그대로: `StringAttribute(name, value)` =
`Attribute({ [name] = value })`. 그룹 핸들러가 이미 가진 것(이름별 개인
키 — 다른 소유자와 claim 충돌, `H-41` 위치 claim, `H10-8` 같은-값 dedup,
`dispatch.process(inst, key, source, 1)` 위임 → StoreBind 언랩)을 전부
상속하므로 새 메커니즘이 0이다. 슈가에 남는 일은 검증뿐: 이름 문자열, raw
값의 Lua 타입(`State`/`None` 통과), `nil` 거부(plain 테이블에 실을 수 없어
조용히 사라지므로 삭제는 `None`).

quad-types: `AttributeSugar<T> = (name, T | State<T> | None) -> Attribute`,
`Quad`의 패밀리 필드가 이 타입. quad-roblox `NewChild`에 `Tag`/`Attribute`
(+`State` 형태)를 합류시켜 strict `D` children에서 셋 다 타입이 선다 —
`H10-12`가 `Tag`/그룹에도 있다고 적었던 `E` 누락이 같이 닫힘.

## 한 일

- `AttributeKey.luau`: 패밀리 별칭 제거, 헤더 정정. `Attribute.luau`:
  `scalarSugar(fnName, luaType)` 팩토리로 셋 생성 + `H-238` 태깅 + `Init`
  노출. `quad-base/src/init.luau` 필드 소스 변경.
- `spec.attribute` 1절 정정(패밀리 = 키 단언 제거) + 10절 신설(그룹 값
  여부·셋 착지·반응형·None 삭제·검증 넷 blame·직접 키의 claim 탈취
  거부·다른 자리 같은 이름 충돌·같은 객체 두 자리 `H-41`). 1차에 내가
  틀린 것 둘: mock quad엔 `nativeClaim`이 없다 / 같은 자리 재드라이브는
  하강 diff가 옛 그룹을 먼저 물려 충돌이 아니다(충돌은 다른 자리).
- `spec.onchangetypes`에 `Tag`/`State<Tag>`/그룹/슈가 셋 양성. pesde
  재설치(새 export type).
- Studio 실측(`audit/m10-engine-axis-studio-2026-09-03.md` 후속 절): 슈가
  셋 + `AttributeKey` Color3 동거, State 갱신·None 삭제, 거부 셋 blame,
  같은 이름 충돌.
- 문서: `attribute-plan.md` 머리 배너(옛 `AttributeKey<<T>>`·"패밀리 = 같은
  키" 서술은 옛 모델로 표시, 배치 표), architecture/dispatch-core/
  bind-system/typing-limits §3 정정, README/ROADMAP/question, round16
  `H10-12` ✅·`H10-15`. 에디터 fflags는 typing-limits 8.5절에 설정 스니펫만
  (사용자 지시 "문서화만").

## 끝 절차

- **감사 루프 2라운드**(확실 4 → 2, 전부 문서·주석 동기화): 1라운드 —
  attribute-plan "동등성" 절의 "패밀리도 같은 캐시" 불릿(정정), ROADMAP M10
  배너의 "AttributeKey 몫만 남는다"(배너가 잔여 목록의 유일한 소스인데
  안 고쳐져 있었음)·체크박스 본문(배너만 달고 본문 미수정 — conventions가
  경고하는 그 실패형), bind-system "값 유니언 정본"의 `NewChild` 목록에 M10
  확장 누락, 이중 꺾쇠 예시 둘(`AttributeKey<<T>>` → `store:Of<<T>>`),
  types.luau 헤더. 2라운드 — quad-types 주석의 "제네릭 값 좁힘 미실측"
  프레이밍, AttributeKey.luau의 "aliases share the same function object".
- **`/code-review medium` 1회 — 발견 0**(후보 전부 반박: 그룹 위치 claim 부분 실패는 문서화된 by-design, 전방 타입 참조는 통과, 태깅·재대입 관용구는 기존 패턴, 호출당 그룹 할당·슈가 전용 타입 검사는 사용자 확정 설계 그대로).
- 탐사자 생략(새 핸들러 0, 그룹 경로 재사용).
