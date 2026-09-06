--[[ explorer scratch 4 — chain-list retention after retractFrom (copy into quad-base/test/ to run) ]]
local QuadTypes = require("../luau_packages/quad_types")
local mock = require("./mock")
local Instance = mock.Instance
local newQuad = mock.newQuad
local collectgarbage = (_G :: any).collectgarbage :: (...any) -> any
local function section(name: string) print(); print("=== " .. name .. " ===") end

local function addAnyKeyHandler(q: any)
	q.Dispatch.addHandler({
		name = "AnyTableKey",
		isHandlable = function(_inst: any, k: any, v: any): boolean
			return type(k) == "table" and type(v) == "string"
		end,
		priority = q.Dispatch.HANDLER_PRIORITY_LOW,
		process = function(inst: any, k: any, v: any, _index: number): (any?, boolean) -> ()
			return q.Void
		end,
	} :: QuadTypes.Handler)
end

section("C1 process(inst, freshKey_i, 'v', 1) + retractFrom(inst, freshKey_i, 1) × N — retained?")
do
	local q = newQuad()
	addAnyKeyHandler(q)
	local inst = Instance.new("Frame")
	q.Dispatch.drive(inst, {})
	collectgarbage("collect"); collectgarbage("collect")
	local before = collectgarbage("count")
	for i = 1, 5000 do
		local key = { i }
		q.Dispatch.process(inst, key, "v", 1)
		q.Dispatch.retractFrom(inst, key, 1)
	end
	collectgarbage("collect"); collectgarbage("collect"); collectgarbage("collect")
	local after = collectgarbage("count")
	print(string.format("KB before=%.1f after=%.1f delta=%.1f (per iter %.0f B)", before, after, after - before, (after - before) * 1024 / 5000))
	inst:Destroy()
	inst = nil
	collectgarbage("collect"); collectgarbage("collect"); collectgarbage("collect")
	print(string.format("after Destroy+drop KB=%.1f (vs before %.1f)", collectgarbage("count"), before))
end

section("C2 same, but STRING keys reused (bounded set) — control")
do
	local q = newQuad()
	q.Dispatch.addHandler({
		name = "AnyStringKey",
		isHandlable = function(_inst: any, k: any, v: any): boolean return type(k) == "string" and type(v) == "string" end,
		priority = q.Dispatch.HANDLER_PRIORITY_LOW,
		process = function(inst: any, k: any, v: any, _index: number): (any?, boolean) -> () return q.Void end,
	} :: QuadTypes.Handler)
	local inst = Instance.new("Frame")
	collectgarbage("collect"); collectgarbage("collect")
	local before = collectgarbage("count")
	for i = 1, 5000 do
		q.Dispatch.process(inst, "k", "v", 1)
		q.Dispatch.retractFrom(inst, "k", 1)
	end
	collectgarbage("collect"); collectgarbage("collect"); collectgarbage("collect")
	local after = collectgarbage("count")
	print(string.format("KB before=%.1f after=%.1f delta=%.1f", before, after, after - before))
end

section("C3 Attribute group churn: State<Attribute> (fresh group objects) vs Attribute({k = State}) (stable)")
do
	local q = newQuad()
	local inst = Instance.new("Frame")
	local aS = q.Source(q.Attribute({ k = 0 }))
	q.Dispatch.drive(inst, { aS })
	collectgarbage("collect"); collectgarbage("collect")
	local before = collectgarbage("count")
	for i = 1, 3000 do aS:Set(q.Attribute({ k = i })) end
	collectgarbage("collect"); collectgarbage("collect"); collectgarbage("collect")
	local after = collectgarbage("count")
	print(string.format("State<Attribute>: delta=%.1f KB (per iter %.0f B)", after - before, (after - before) * 1024 / 3000))

	local inst2 = Instance.new("Frame")
	local kS = q.Source(0)
	q.Dispatch.drive(inst2, { q.Attribute({ k = kS }) })
	collectgarbage("collect"); collectgarbage("collect")
	local before2 = collectgarbage("count")
	for i = 1, 3000 do kS:Set(i) end
	collectgarbage("collect"); collectgarbage("collect"); collectgarbage("collect")
	local after2 = collectgarbage("count")
	print(string.format("Attribute({k=State}): delta=%.1f KB", after2 - before2))
end

section("C4 Tag churn with fresh names vs same name set")
do
	local q = newQuad()
	local inst = Instance.new("Frame")
	local tS = q.Source(q.Tag("n0"))
	q.Dispatch.drive(inst, { tS })
	collectgarbage("collect"); collectgarbage("collect")
	local before = collectgarbage("count")
	for i = 1, 5000 do tS:Set(q.Tag("n" .. i)) end
	collectgarbage("collect"); collectgarbage("collect"); collectgarbage("collect")
	local after = collectgarbage("count")
	print(string.format("fresh names: delta=%.1f KB (per name %.0f B)", after - before, (after - before) * 1024 / 5000))
	local before2 = collectgarbage("count")
	for i = 1, 5000 do tS:Set(q.Tag(if i % 2 == 0 then "a" else "b")) end
	collectgarbage("collect"); collectgarbage("collect"); collectgarbage("collect")
	local after2 = collectgarbage("count")
	print(string.format("two names alternating: delta=%.1f KB", after2 - before2))
end

print()
print("=== DONE ===")
