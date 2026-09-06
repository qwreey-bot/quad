# 2026-09-04-03 — M7 단위 ③: 생성기 `<Class>Modifier` + `D.Modifier.<Class>()` (자율 구간)

단위 ②(`c549ee8`) 직후 착수. round17 §0 Q3 (a)(`D.Modifier.<Class>()`), Q5 (a)
(D 스코프 클래스만) 확정 기준.

## 타이핑 실측 — 두 번 막히고 두 번 풀림

1. **첫 스크래치의 "too complex"는 내 실수**: 타입 별칭 `None`을 값 자리에 써
   "Unknown global"이 연쇄를 냈다. 값/타입을 바로잡고 변형 다섯(`Field<V>`
   별칭 / 변환 인자 `any` / 함수 `any` / 함수 없음 / Tween 제외)을 대조하니
   실물 규모(Frame 37·TextButton 59 메소드)에서 **전부 통과** — 별칭
   `Field<V> = V | State<V> | None | ((old: V | State<V> | None | nil) -> …)`를
   채택(변환 `old` 타입·`Apply` 팩토리 클래스 타입·음성 셋 전부 기대대로).
2. **전 규모(31 클래스)에서 진짜 "too complex"**: `<Class>Modifier`를
   `<Class>Elem` 유니언에 넣자 큰 클래스의 `D.<Class>` 캐스트 자리에서 죽음.
   한도 플래그 15종 대조 — `SolverConstraintLimit`만 지점을 옮길 뿐 전부 무효.
   → **마커 타입**으로 전환: `NewChild`에 `{ read __quadModifier: true }`만,
   생성 `<Class>Modifier`·quad-types `Modifier`·런타임 값 모두 그 필드를 가진다
   (`H-300` `None` 관례). children 자리의 클래스 소속 검사를 잃고 setter 호출
   자리가 대신한다(typing-limits 8.8절 신설).
3. 그 뒤 남은 "too complex"는 8.5절의 그것(별칭 존재 비용) — `LuauTarjanChildLimit`
   40000 → 160000으로 클린(4.3s대).

## 한 일

- `gen-d.py`: `Field<V>`, 클래스별 `<Class>Modifier`(프로퍼티만 — **이벤트
  제외**: setter의 함수 인자는 변환 함수라 콜백과 구분 불가, 정본 4절; 예약
  메소드 셋; `Parent`는 덤프 층 제외 그대로), `DModifier` 타입 + `D.Modifier`
  네임스페이스(런타임은 `quad.Modifier` 하나, 클래스별 캐스트 별칭), 배너.
- quad-types `Modifier`에 마커 필드·`ModifierMarker`, quad-roblox `NewChild`에
  마커, `Modifier.luau` 값에 `__quadModifier = true`(리터럴 키 — `__index`를
  안 탄다).
- `spec.modifiertypes`(strict 양성: setter 4형·State 필드 캐스트·`Peek<<T>>`·
  `Apply` 팩토리·`Overridden` 닷/콜론·children/Mapper), `spec.d`의 `D` 필드
  단언에 `Modifier` 네임스페이스 갈래. test.sh Tarjan 160000. Studio 생략
  (런타임 델타 0).
- 문서: ROADMAP M7 체크박스 넷(`Parent`·`Overridden` any·Tween 치환·`H-25`),
  round17 `H-313`, typing-limits 8.5 갱신 + 8.8 신설, modifier-plan 5절
  구현 배너, bind-system `D.FrameModifier` 실물 주석.

## 끝 절차

- **감사 1라운드** 확실 3(bind-system `NewChild` 원장에 M7 확장 누락 / typing-limits
  8.5 JSON 블록의 옛 Tarjan 값 / README round17 행 나열형) + 의심 2(8.8절에
  "Tarjan도 무효" 명시, 클래스 수 하드코딩 완화) 반영. 감사자가 `H-312` 회신
  참고(타입 붙은 호출 자리는 이미 정적으로 잡힘)를 냈고 §4 행에 붙였다.
- **`/code-review medium` 1회** — 3건: 예약 이름 충돌의 조용한 `continue` → 생성
  실패(`SystemExit`) / 마커 방식이 children 자리 클래스 소속 검사를 잃는 계약
  변화 → §4에 확인 항목 / 생성기 주석 "6종" → 8.8절 포인터.
- Studio 생략(런타임 델타 0). doc-check ERROR 0, test.sh 38 파일.
