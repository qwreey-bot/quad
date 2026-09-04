# M8 단위 ② Studio 실측 — Ref leaf·이중 배치·재바인드·PreRef/PostRef 시점 (2026-09-04)

> **이 파일이 무엇인가**: M8 단위 ②(round18 `H-319`)의 엔진 대면 델타를
> `Place1.rbxl`에서 실물로 확인한 기록(계획 아님). CLI(mock)로 닫히지 않는
> 것만 — 실물 gcconn/gchold 위의 이중 배치 거부, `State<Ref>` 재바인드가
> 실물 Frame을 오가는 것, `PreRef`가 해시 파트(프로퍼티) 전에·`PostRef`가
> 자식 부착 뒤에 fire되는 것, 부모 부착이 경로에 따라 갈리는 것(브리프 Q6),
> `task.spawn` 스레드의 `:Wait`. 반입은 rojo 라이브 싱크(`.Source`에
> `prePass`/`registerDispatchHandlers` 확인 뒤 실행).

**운영 메모**: 착수 시점에 `rojo serve`가 죽어 있었다(sourcemap 워처만 생존)
— 재기동하니 Studio 플러그인의 `autoReconnect`가 잠시 뒤 잡혔다. Studio
프로세스는 살아 있었으므로 `HUMAN_TODO.md` 12번(프로세스 재기동) 범위 밖,
serve 생존은 에이전트 몫이라는 그 항목의 서술 그대로.

| # | 확인 | 결과 |
|---|---|---|
| 1 | `D.Frame({ r, Name = "F1" })` — `RefLeafHandler`가 실물 Frame을 `r:Set` | PASS |
| 2 | 같은 `r`을 두 번째 `D.Frame({ r })`에 — 실물 `bindLifetime`(gcconn `.Connected`)의 `canBound` 가드가 error, blame은 사용자 줄(`AssistantCommand:18`) | PASS — `bindLifetime: value is already bound to another Instance` |
| 3 | `Source(refA)`를 자식 자리에 두고 `refB`로 교체 — `refA`는 `nil` 통지(콜백 3회 = 등록·inst·nil) + 해제돼 다른 Frame에 재배치 가능, `refB`는 원래 Frame에 바인딩 | PASS |
| 4 | `D.TextLabel({ Name = "after", pre, Text = "t" })` — `PreRef` 콜백 시점의 `.Name`이 기본값 `TextLabel`(해시 파트 전, 배열 위치 무관) | PASS |
| 5 | `D.Frame({ post, Frame c1, Frame c2 })`를 바깥 Frame에 리터럴 중첩 — `PostRef` 콜백 시점에 자식 2개 부착, `.Parent`는 `nil`(리터럴 경로는 아직 미부착) | PASS |
| 6 | 이미 부모가 있는 Frame을 `Claim`으로 소유하며 `PostRef` — 콜백 시점 `.Parent`가 그 부모(붙은 채로 fire) — 브리프 Q6 "어느 쪽도 무보장"의 실증 | PASS |
| 7 | named 자리 `Hook = PreRef()` → 가드 error(`typeof(k)` = string 실림) / 이미 fire된 `pre`를 다시 놓기 → one-shot error | PASS |
| 8 | `task.spawn(function() got = rw:Wait().Value end)` 뒤 `D.Frame({ rw })` — 바인딩 시점에 스레드 재개, `.Value`가 그 Frame | PASS |

8/8. FAIL 없음. 5·6이 함께 브리프 Q6의 사용자 정정(*"우리가 정의할 수 있는건
단지 자식이 다 붙은 다음이지, 부모에게 붙었을 지 안 붙었을 지 그건 보장하는
바가 아님"*)을 실물로 보여준다 — 같은 `PostRef` 계약에서 경로에 따라 `.Parent`가
갈린다.

**후속(같은 날, 감사 1라운드 정정 뒤 재실측)**: 첫 구현은 `PostRef`를 배치
종료·recompute 뒤에 fire했는데 정본(`H-17`)은 배치 닫기 앞(게이트 켜진 채)이라
되돌렸다. 되돌린 뒤 5번 재실측 — 콜백 시점에 자식 2개 부착 + **배치 게이트
켜짐(`getBlocker(inst):IsOn() == true`)** + `.Parent` nil, 4번·2번도 그대로 PASS.
즉 "자식이 다 붙은 다음"은 게이트가 닫히기 전에도 이미 성립한다(자식 부착은
핸들러가 process 시점에 물리적으로 끝내고, recompute는 부기다).

