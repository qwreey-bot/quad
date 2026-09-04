# M7 단위 ② — flatten·`ProcessedModifierHandler`·drive 봉합 실기기 실측 (2026-09-04)

> **무엇인가**: round17 `H-311`을 rojo 라이브 싱크로 Studio에 올려 실물
> Instance 위에서 돌린 결과(관용구는 `m5-unit5-first-render-2026-09-02.md`).
> CLI spec(`spec.flatten`/`spec.handlers` 10절/`spec.claim` 8절)이 mock 위에서
> 고정한 계약의 엔진 대면 델타만 본다. 전부 동기 관측(프로퍼티 대입).

| # | 항목 | 관측 |
|---|---|---|
| 1 | `D.Frame { mod, child, Visible = true }` — `mod = Modifier():Name("FromMod"):ZIndex(state):Visible(false):BackgroundColor3(red)` | `Name=FromMod ZIndex=3 Visible=true Color=1,0,0` — 필드가 실물 프로퍼티로 앉고 **인라인 `Visible`이 modifier를 이김**, 정적 자식은 부착(`child.Parent=FromMod`), 소진된 슬롯이 형제 오프셋에 0 기여(`getOffsetAt(f, 2) == 0`). `state:Set(7)` → `ZIndex=7`(State 필드 반응형) |
| 2 | 두 modifier `a:Name("A"):ZIndex(1)`, `b:Name("B"):ZIndex(None)` | `Name=B`(나중 modifier 우선), `ZIndex=1`(기본값 유지 — `None` 필드는 NoneHandler → nil → Property `v == nil` 방어로 **쓰기 건너뜀**, 정본 2-1의 실물 귀결) |
| 3 | `Claim(template:Clone(), M.Frame(M.Root) { mod, M.TextLabel "Title" { mod2, TextSize = 12 } })` | `root.BackgroundTransparency=0.5 Title.Text=from mod Title.TextSize=12` — 루트·매핑 자식 props의 Modifier가 `drive` 안 flatten으로 소진되고 인라인이 이김(Claim 봉합 자동, round17 Q4 (a)) |
