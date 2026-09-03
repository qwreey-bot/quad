# [역전됨] `OnChange(name)` = 해시 파트 특수 키(`[OnChange "Text"] = fn`) — 배열부 디스크립터 값 `OnChange(name, fn)`으로 대체됨

**역전 일시**: 2026-09-03(`session/2026-09-03-05-onchange-array-reversal.md`).
**원 확정 일시**: 2026-08-10 세션(`base/onchange-plan.md` 최초 작성),
2026-08-11 아홉 번째 세션 후속(이름별 weak 캐시 동등성), 2026-08-24 `H-27`
(`v == nil` 얼리리턴). **구현까지 됐다가 같은 날 뒤집혔다** — 키 형태의
구현(`0eb4a01`, round16 `H10-13`)이 M10 둘째 단위로 커밋된 지 몇 시간 만에
사용자 제안으로 역전. **현재 유효한 설계**: `base/onchange-plan.md`(전면
재작성)가 소스. 이 파일은 구현에 안 쓴다 — 왜 "특수 키"에서 "배열부 값"으로
넘어갔는지가 `Tag`의 같은 역전(`archive/tag-hash-key-model-reversed.md`)과
짝을 이루는 `quadnomicon` 소재라 원문·사유를 보존해둔 것.

## 원래 무엇을 확정했었나

- **`OnChange(propertyName): OnChangeKey`** — 프로퍼티 이름을 감싸는 특수 키
  팩토리, `AttributeKey(name)`과 같은 패턴. 사용:
  `Frame { [OnChange "Position"] = function(v: UDim2) ... end }`.
- **제네릭 타입 파라미터 없음** — 콜백 파라미터 타입은 호출부가 인라인으로
  명시, Luau가 실제 프로퍼티 타입과의 일치를 검증하지 않는다(근거: 이름을
  인자로 받는 팩토리라 생성기가 타입을 찍어둘 필드가 없고, 프로퍼티별 전량
  생성은 `archive/onchange-per-property-codegen-rejected.md`로 기각).
- **`OnChange(name)`도 `AttributeKey`와 같은 이름별 weak 캐시** —
  `OnChange "a" == OnChange "a"`가 외부에서 관찰 가능한 동등성(사용자 확인).
- **`process(inst, k, v, index)`**: `v == nil`이면 Connect를 건너뛰고 no-op
  클로저(`H-27` — 없으면 `None`으로 끄는 게 "나중에 터질 Connection을 새로
  심는" 동작이 됨), 아니면 `inst:GetPropertyChangedSignal(name):Connect(
  function() v(inst[name]) end)` 후 Disconnect 클로저 반환.
- 대조 표에서 `OnChange`는 "특수 키" 열에 `AttributeKey`와 나란히 있었다.

## 왜 뒤집혔나

구현 직후 두 문항이 올라왔다(round16 `H10-11`/`H10-12`):

1. **해시 순서 비결정** — 같은 props에 `Text = "a"`와 `[OnChange "Text"]`가
   있으면 초기 대입이 콜백을 깨울지가 해시 파트 순회 순서에 달렸다(base가
   약속하는 순서는 배열→해시뿐, `F-4-1`). mock에서 실제로 뒤집혀 spec이
   깨졌다.
2. **strict 타이핑 사각** — `[OnChange "Text"] = fn`이 생성 `<Class>Param<E>`
   (`[number]: E` 인덱서)에 타입으로 들어갈 자리가 없었다.

사용자 제안(2026-09-03 원문): *"OnChange "Text" 는 뭔가 설계 단위 이슈인것
같네. 테그나 OnCreated 같은 것이 했던것 처럼, OnChange("KeyName", func) 형태가
되는게 어쩜 맞을수도. 여기에서 Keyname 은 K&(union) 하면 캐치 가능하고, 오직
컨스트럭터 상 index<> 만 수행해서 func 안 입력타입을 알려주는게 가능하지 않나
싶은. 이러면 심지어 여러 콜백을 지정도 가능하고, State<...> 으로도 연결이
가능함."*

배열부 값이 되면 넷이 한꺼번에 닫힌다:
- 배열→해시 순서 계약으로 **Connect가 항상 프로퍼티 대입보다 먼저** → 순서
  비결정이 "초기값 발화" 계약으로 바뀐다. 사용자(역전 동의 원문): *"초기값
  발화는 계약으로. … observer 와 유사한 동작이 난다는 점도 의외로 흔한
  디자인이 돼. 다만 설정 뒤에서 안 하면, emit 안 나긴 하고, AbsolutePosition
  같은게 바로 계산되진 않겠지만, 그냥 프로퍼티 셋 이전에 바운딩 해준다만
  만족해도 해결돼. 오히려 순서 없던것 보다 훨씬 나아보임."*
- 타이핑이 "새 인덱서 문제"에서 **이미 예정된 `E` 유니언 확장**으로 바뀐다
  (`types.luau`의 `NewChild`는 마일스톤마다 넓히기로 돼 있던 자리).
- **같은 이름 중복이 조용히 사라지던 결함**이 없어진다 — 키 형태에선
  `[OnChange "Text"] = a, [OnChange "Text"] = b`가 테이블 리터럴에서 b만 남았고,
  캐시 동등성이 오히려 그 충돌을 보장했다. 값이면 둘 다 붙는다.
- `State<디스크립터>`가 `Tag`와 같은 배열 원소 경로(StoreBind 언랩)로 통한다.

부수로 이름별 weak 캐시·키 브랜드·`H-27` 얼리리턴(nil은 이제
NoneHandler/NilHandler 몫이라 이 핸들러에 안 닿음)이 전부 불필요해졌다.
타이핑 실측 경위(제네릭 `K` 싱글톤 넓힘, `K & keyof<PropTypes>` +
`index<PropTypes, K>`로 검증·추론 성립, 큰 싱글톤 유니언/오버로드 교집합은
"too complex")는 `luau-test/done/30-*`와 `base/typing-limits.md` 8.7절.
