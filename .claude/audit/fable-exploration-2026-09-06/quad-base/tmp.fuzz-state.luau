--[[ explorer fuzz — random reactive DAG: Get correctness + observer dedup (delete after) ]]
local mock = require("./mock")
local newQuad = mock.newQuad

local SEED = tonumber((...)) or 777
local rngState = SEED
local function ri(a: number, b: number): number
	rngState = (rngState * 1103515245 + 12345) % 2147483648
	return a + (rngState // 65536) % (b - a + 1)
end

local q = newQuad()

-- model: nodes[i] = { kind = "src"|"cmp"|"gate", deps = {...}, node = State, value = fn }
local nodes: { any } = {}
local NSRC, NCMP = 4, 14
for i = 1, NSRC do
	local v = ri(0, 9)
	nodes[i] = { kind = "src", node = q.Source(v), val = v }
end
local blockers: { any } = {}
for i = NSRC + 1, NSRC + NCMP do
	local d1 = ri(1, i - 1)
	local d2 = ri(1, i - 1)
	local kind = if ri(1, 4) == 1 then "gate" else "cmp"
	if kind == "gate" then
		local b = q.Blocker()
		table.insert(blockers, b)
		local g: any = nodes[d1].node:Apply(b)
		nodes[i] = { kind = "gate", deps = { d1 }, node = g, blocker = b }
	else
		local mul = ri(1, 3)
		local n1, n2 = nodes[d1].node, nodes[d2].node
		local c = n1:Compute(function(a: any, _p: any, b: any) return a:Get() * mul + b:Get() end, n2)
		nodes[i] = { kind = "cmp", deps = { d1, d2 }, node = c, mul = mul }
	end
end

-- model evaluation (gates are pass-through for values)
local function modelValue(i: number): number
	local nd = nodes[i]
	if nd.kind == "src" then return nd.val end
	if nd.kind == "gate" then return modelValue(nd.deps[1]) end
	return modelValue(nd.deps[1]) * nd.mul + modelValue(nd.deps[2])
end

-- observers on every node: count fires per wave; record last seen value
local fires: { number } = {}
local lastSeen: { number } = {}
for i, nd in nodes do
	fires[i] = 0
	nd.node:Observer(function(st: any, _o: any, from: any)
		if from ~= nil then
			fires[i] += 1
			lastSeen[i] = st:Get()
		end
	end):Subscribe()
end

-- effects: random 1..3 deps among nodes, count reruns per wave
local effects: { any } = {}
for e = 1, 8 do
	local deps = {}
	for _ = 1, ri(1, 3) do table.insert(deps, ri(1, #nodes)) end
	local rec = { deps = deps, runs = 0 }
	local depNodes = {}
	for _, d in deps do table.insert(depNodes, nodes[d].node) end
	rec.handle = q.Effect(function() rec.runs += 1 end, table.unpack(depNodes))
	rec.handle:Subscribe()
	table.insert(effects, rec)
end
local function resetFires() for i in nodes do fires[i] = 0 end for _, e in effects do e.runs = 0 end end

-- does node i transitively depend on src s through a path with NO closed gate?
local function reachableOpen(i: number, s: number, seenGateClosed: boolean): boolean
	local nd = nodes[i]
	if i == s then return not seenGateClosed end
	if nd.kind == "src" then return false end
	if nd.kind == "gate" then
		return reachableOpen(nd.deps[1], s, seenGateClosed or nd.blocker:IsOn())
	end
	return reachableOpen(nd.deps[1], s, seenGateClosed) or reachableOpen(nd.deps[2], s, seenGateClosed)
end

local ITER = 3000
for it = 1, ITER do
	local action = ri(1, 10)
	if action <= 6 then
		local s = ri(1, NSRC)
		local v = ri(0, 9)
		nodes[s].val = v
		resetFires()
		nodes[s].node:Set(v)
		-- values: every node's Get must equal model
		for i in nodes do
			local got = nodes[i].node:Get()
			local want = modelValue(i)
			assert(got == want, `it {it}: node {i} Get {got} ~= model {want}`)
		end
		-- dedup: at most one fire per node per Set; and nodes reachable via an all-open path must fire exactly once
		for i in nodes do
			assert(fires[i] <= 1, `it {it}: node {i} fired {fires[i]} times for one Set`)
			if i ~= s and reachableOpen(i, s, false) then
				assert(fires[i] == 1, `it {it}: node {i} reachable via open path from src {s} but fired {fires[i]}`)
			end
		end
		for ei, e in effects do
			assert(e.runs <= 1, `it {it}: effect {ei} reran {e.runs} times for one Set`)
			local expect = false
			for _, d in e.deps do if d == s or reachableOpen(d, s, false) then expect = true end end
			if expect then assert(e.runs == 1, `it {it}: effect {ei} should rerun once (open path) but ran {e.runs}`) end
		end
	elseif action <= 8 and #blockers > 0 then
		blockers[ri(1, #blockers)]:On()
	elseif #blockers > 0 then
		local b = blockers[ri(1, #blockers)]
		resetFires()
		b:Off()
		for _, e in effects do assert(e.runs <= 1, `it {it}: effect reran {e.runs} times for one flush`) end
		for i in nodes do
			assert(fires[i] <= 1, `it {it}: node {i} fired {fires[i]} times for one flush`)
			local got = nodes[i].node:Get()
			local want = modelValue(i)
			assert(got == want, `it {it}: after flush node {i} Get {got} ~= model {want}`)
		end
	end
end
print(`fuzz-state OK seed={SEED} iters={ITER} nodes={#nodes} gates={#blockers}`)
