# M10 잔여 InstanceShorthand Studio 실측 (2026-09-06, round20 §0 Q6)

**무엇**: `Handlers/InstanceShorthand.luau`를 실기기(`Place1.rbxl`, Edit,
`ServerStorage.QuadTestRun` 클론 관용구, `StarterGui`의 `ScreenGui` 아래)에서
돌린 결과. 싱크 경위는 `m11-unit2-studio-2026-09-06.md`와 같다 — rojo 플러그인
미연결이라 `InstanceShorthand`(신설)·`Animate`(신설)·`RobloxFactory`(설치 줄 셋)를
execute_luau로 `.Source` 패치했다(`HUMAN_TODO.md` 12번). 다음 Studio 세션은
플러그인 Connect 뒤 전체 재싱크가 먼저다.

| # | 항목 | 관측 | 판정 |
|---|---|---|---|
| 1 | `Frame{ UICorner = 8 }` | `_quad_round`(UICorner) 자식 부착, `CornerRadius.Offset == 8` | PASS |
| 2 | `State<number>` 4 → 12 | 같은 자식(재생성 없음), Offset 12, 자식 수 1 | PASS |
| 3 | `Tween{ Value = 100, Time = 1, Linear }`(첫 값 0 스냅 뒤) | 0.4s에 43(보간 중) → 1.2s에 100 — `(child, CornerRadius)` 슬롯에서 애니메이션(`:Mapped` 경로) | PASS |
| 4 | `nil` → 자식 파괴(`Parent == nil`), 다시 `Tween{ Value = 50 }` → 새 자식 + 첫 값 스냅(50) | 정본 캐비엇 그대로 | PASS |
| 5 | `UIPadding = UDim.new(0, 4)` / `UIPaddingOffset = 6` / `UIScale = 1.5` | `_quad_padding` 네 Padding 4 / 네 Padding 6 / `_quad_scale` 1.5 | PASS |
| 6 | (보너스) `D.Modifier.Frame():UICorner(src:Apply(Animate{ Time = 0.5 }))` | 첫 값 2 스냅, `Set(40)` 뒤 0.25s에 24(보간 중) — Modifier setter·`Animate`·숏핸드·Tween 슬롯이 한 경로로 | PASS |

발견 없음(CLI spec과 동일 동작). `UIPadding`/`UIPaddingOffset` 공유 자식(`H-335`)은
CLI로 확인.
