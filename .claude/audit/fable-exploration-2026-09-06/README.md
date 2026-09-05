# explorer scratch (2026-09-06, HEAD a716eb4 → 455ef53 during the run)

All `.luau` here expect to be copied into `quad-base/test/` (or `quad-roblox/test/` for the quad-roblox ones) and run with `luau <file>` (fuzzers: `luau <file> -a <seed>`). `tmp.types*.luau` are checked with the `luau-lsp analyze` line from `scripts/test.sh`. Every `.out` is the captured run.

- `quad-base/tmp.explore-1.out` — E1 blame / E5·E6 leaf survives Destroy / sparse drive / diamond glitch / gate+Effect / Ref:Wait / catch-up (`.luau` was deleted from the repo mid-session by another agent — only the output survives)
- `quad-roblox/tmp.explore-2.luau/.out` — quad-roblox handlers under CLI: StoreBind child churn (R1/R1b/R1c), Property churn, Event via State/None, Modifier+None, PreRef/PostRef order, Claim, Tag/Attribute via State, Slot+State element, **R11 tag-name growth, R14 State<Attribute> growth**
- `quad-base/tmp.explore-3.out` — Observer reentrancy tail, Effect pending, gates chain, Unsubscribe/replay, Slot GC after owner Destroy, remount after owner Destroy (`.luau` deleted mid-session)
- `quad-base/tmp.explore-4.luau/.out` — **X-1/X-2 evidence**: chain-list retention per fresh key (C1 vs C2 control), State<Attribute> vs Attribute({k=State}) (C3), Tag fresh names vs two names (C4)
- `quad-base/tmp.explore-5.luau/.out` — **X-3 evidence**: blame destinations (B1/B2/B4 → Dispatch/init.luau:224, B3/B8 → Source.luau:73, B5/B6/B9 controls → user line), B7 blocker stuck after a throw in drive
- `quad-base/tmp.explore-6.luau/.out` — K1 pinning proof (weak ref to the key survives GC while inst lives, dies after Destroy), K2, D1/D2 destroyed value in an unmounted wrapper → remount is bookkeeping-only (no physical op)
- `quad-base/tmp.fuzz-slot.luau` — nested Slot CRUD fuzz (Add/Remove/Move/Swap/Replace/Extract+re-Add/Splice/Clear) vs model invariants (Length = leaf count, Offset = base, getOffsetAt prefix sums, bk.N, root children set) — OK seeds 12345/2/99/7/1/2/3 × 4000 ops
- `quad-base/tmp.fuzz-slot2.luau` — List slots (Detach / KeyGone→nil, permute/add/remove/re-add ids), State elements (nil↔inst), portal State<Slot> swap + nil/back, cross-slot Extract — OK seeds 4242/5/66/1001/31337/1/2/3 × 3000 ops
- `quad-base/tmp.fuzz-state.luau` — random Source/Compute/Gate DAG + Observer on every node + 8 Effects: Get == model after every Set/flush, fires/reruns ≤ 1 per wave, == 1 when reachable through an all-open path — OK seeds 777/3/41/8/123/1/2/3 × 3000
- `quad-roblox/tmp.types*.luau/.out` — negative typing probes after M11 unit ①: all annotated wrong-T slots rejected; only the unannotated derived `State<Tween<number>>` slips (typing-limits §1① known rule: annotate derived States)
