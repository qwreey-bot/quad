# 2026-09-03-05 — `OnChange` 배열부 값으로 역전 (사용자 제안, 같은 날 재구현)

`session/2026-09-03-04-m10-events.md`의 커밋 `0eb4a01`(키 형태 `[OnChange
"x"] = fn`) 보고에 사용자 문항 둘(`H10-11` 해시 순서 비결정 / `H10-12` 특수
키 strict 타이핑 사각)을 올렸더니, 사용자가 문항 답이 아니라 **설계 단위**로
되돌렸다.

## 사용자 제안 원문

> "OnChange "Text" 는 뭔가 설계 단위 이슈인것 같네. 테그나 OnCreated 같은
> 것이 했던것 처럼, OnChange("KeyName", func) 형태가 되는게 어쩜 맞을수도.
> 여기에서 Keyname 은 K&(union) 하면 캐치 가능하고, 오직 컨스트럭터 상
> index<> 만 수행해서 func 안 입력타입을 알려주는게 가능하지 않나 싶은.
> 이러면 심지어 여러 콜백을 지정도 가능하고, State<...> 으로도 연결이
> 가능함. 어떻게 봐?"

내 판정: 동의 — 배열부 값이면 (1) 배열→해시 순서 계약으로 `H10-11`이 결정적
계약("초기값 발화")으로 바뀌고, (2) `H10-12`가 "새 인덱서 문제"에서 이미
예정된 `E` 유니언 확장으로 바뀌며(`Tag`가 인덱서 문제라 적었던 건 반은
틀림 — Tag는 배열부 값), (3) 키 형태에서 같은 이름 둘이 테이블 리터럴에서
조용히 하나로 사라지던 결함이 없어지고, (4) `State<디스크립터>`가 Tag와
같은 경로로 통한다. 캐시·브랜드 키·`H-27`이 통째로 불필요. 타이핑은 "검증은
되지만 추론은 스파이크 감"으로 기대값을 잡고 확인을 둘 구했다: 초기값 발화를
계약으로 받아들일지, 지금 착수할지.

## 사용자 확정 원문

> "초기값 발화는 계약으로. 개낸 아이덴티티 값이거나 보통 엔진 프리미티브라,
> 그냥 == 비교가 엄청 싸서 그 안에서 dedup 하면 되는 부분이고, observer 와
> 유사한 동작이 난다는 점도 의외로 흔한 디자인이 돼. 다만 설정 뒤에서 안
> 하면, emit 안 나긴 하고, AbsolutePosition 같은게 바로 계산되진 않겠지만,
> 그냥 프로퍼티 셋 이전에 바운딩 해준다만 만족해도 해결돼. 오히려 순서 없던것
> 보다 훨씬 나아보임. 역전을 난 동의."

읽기: 계약은 "프로퍼티 셋 이전에 바운딩된다" 하나. 초기값 발화는 그
따름정리이고, 초기값을 거를지는 콜백 안 `==`로 사용자 몫(quad가 억제하지
않음). props에 없는 프로퍼티는 발화 없음, 파생 프로퍼티가 그 자리에서
계산돼 있다는 보장 없음.

## 타이핑 스파이크(`luau-test/done/30-*`) — 사용자 가설의 실현 경계

- `OnChange<K, V>(name: K, fn: (V) -> ())` — **K가 string으로 넓혀져** 양성도
  실패. 인라인 리터럴 `{ Name = "Position", … }`도 같은 이유로 실패.
- `name: K & PropName`(전 이름 싱글톤 235 유니언) — 자리표시자에선 통과,
  실물 규모에선 too complex. 이름·타입 쌍 **오버로드 교집합**도 37개부터
  too complex.
- ⭐ `name: K & keyof<PropTypes>`, `fn: (index<PropTypes, K>) -> ()` — 통과.
  오타(keyof)·콜백 타입 불일치(index<>)가 호출 자리에서 잡히고, **무주석
  콜백의 파라미터가 추론**된다(사용자 가설 "index<>로 입력 타입" 그대로 —
  다만 "컨스트럭터 상"이 아니라 팩토리 시그니처에서). 클래스 소속은
  생성자 쪽 `<Class>OnChange` 유니언이 `E`에서 잡는다.
- 실물 규모의 두 캐비엇: Color3/string 콜백이 `LuauSubtypingIterationLimit`
  기본 한도를 넘어 test.sh에 10만을 핀(5만이면 클린, 다른 한도 6종·유니언
  멤버 `Callback: any`/`read` 형태는 무효); `State<T>` 불변성(`Set`)으로
  `Source<단일 디스크립터>`는 클래스 유니언 캐스트 경유(반응형 자식
  `Source<Frame>` vs `State<Instance>`도 같은 선행 한계 — 이번에 드러남).
  클래스 간 타입이 다른 이름 6개는 `PropTypes`에서 `any`.
  → `typing-limits.md` 8.7절.

## 한 일

- `Handlers/OnChange.luau` 재작성(디스크립터 `{ Name, Callback }` frozen +
  모듈 로컬 weak-key 브랜드, 이름 문자열·콜백 함수 검증, 길이 0 말단 —
  Tag 관용구, retractor Disconnect), `types.luau` `OnChangeDescriptor`,
  `init.luau` `RobloxExtension.OnChange: OnChangeFn`(생성 타입).
- `gen-d.py`: `PropTypes`·`OnChangeDescriptor<K>`·`OnChangeFn`·클래스별
  `<Class>OnChange` 유니언, `D.<Class>`/`Mapper.<Class>` `E`를
  `NewChild | <Class>OnChange | State<<Class>OnChange>`로.
- `spec.events` 4~6절 재작성(초기값 발화·같은 이름 둘·길이 0·거부 둘·
  `State<디스크립터>` None/재연결/철거·팩토리 공유), strict
  `spec.onchangetypes`(실행 없이 타입만 — 주석/무주석/변수/반응형 캐스트/
  충돌 이름/Mapper), test.sh 플래그.
- Studio 재실측(audit 3절): 초기값 발화 a·b 각 2회, 자식 무영향, 반응형
  None/재연결, 거부 메시지 셋(미지 프로퍼티는 엔진 원시 에러).
- 문서: `onchange-plan.md` 전면 재작성, `archive/onchange-hash-key-reversed.md`,
  event-plan/bind-system-plan/architecture 정정, ROADMAP M10 배너·체크박스,
  round16 `H10-11` ✅(갈래 밖 (d))·`H10-12` OnChange 몫 ✅(AttributeKey 몫
  잔여)·`H10-14` 신설, README/STATUS/luau-test README, typing-limits 8.7.

## 끝 절차

- **감사 루프**: 1라운드 확실 4(`attribute-plan.md` "OnChange도 같은 캐시" —
  옛 모델 배너로 / `lifecycle-hooks-plan.md` "해시 파트 특수 키 팩토리" —
  둘 다 배열부 값 팩토리로 정정, 대조 표는 계속 분리 / 기각 archive 머리말
  요약 / README 색인 arity) + 의심 둘(`question.md` `OnChangeKey` 전례 표기,
  audit 절 순서) 반영. 2라운드 확실 1(round16 `H10-13` "정본 정정 없음"이
  인접 `H10-14`와 모순 → 후속 각주). 에디터 fflags 등재는 8.5절 방침("아프면
  그때") 유지. 3라운드는 리뷰 반영분 각도로.
- **`/code-review medium` 1회 — 2건 반영(생성기 위생)**: 프로퍼티 0개
  클래스 `never` 가드, 배열 원소 유니언을 클래스당 `<Class>Elem`/
  `<Class>MapperElem` 별칭으로(네 자리 손 나열 제거). 기각: 런타임/생성
  `OnChangeDescriptor` 이중 타입(의도된 분리), 호출당 디스크립터 할당,
  플래그 인상(실측된 트레이드오프), None/0 부기 반복(관용구).
- **탐사자 생략** — 핸들러 하나·정본 1:1 전사, Studio가 엔진 축을 봤다.
- doc-check ERROR 0, `./scripts/test.sh` exit 0(35 파일).
