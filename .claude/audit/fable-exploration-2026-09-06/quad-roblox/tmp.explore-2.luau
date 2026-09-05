--[[ explorer scratch 2 — quad-roblox handlers under CLI (delete after) ]]
local Quad = require("../luau_packages/quad_base")
local QuadRoblox = require("../src").QuadRoblox
local installProperty = require("../src/Handlers/Property")
local installEvent = require("../src/Handlers/Event")
local installEngineOps = require("../src/EngineOps")
local mock = require("../../quad-base/test/mock")
local Instance = mock.Instance
local collectgarbage = (_G :: any).collectgarbage :: (...any) -> any

local W = { Write = "" }
local REFLECTED: { [string]: { any } } = {
	Frame = { { Name = "Name", Permits = W }, { Name = "Size", Permits = W }, { Name = "Visible", Permits = W }, { Name = "Parent", Permits = W }, { Name = "Text", Permits = W } },
	TextLabel = { { Name = "Name", Permits = W }, { Name = "Text", Permits = W } },
}
mock.declareEvents("Frame", { "MouseButton1Click" })
local gameShim = mock.gameShim(REFLECTED)

local function newQ(): any
	local q: any = Quad.New():UseProvider(QuadRoblox)
	;(getfenv(installProperty) :: any).game = gameShim
	;(getfenv(installEvent) :: any).game = gameShim
	;(getfenv(installEngineOps) :: any).game = gameShim
	;(getfenv(q.D.New) :: any).Instance = { new = mock.Instance.new }
	q.isInst = mock.isMockInstance
	q.errorNamespace.setFuncLevel(q.isInst, 1)
	return q
end

local function section(name: string) print(); print("=== " .. name .. " ===") end

section("R1 StoreBind churn on array child — memory bounded, exactly one child")
do
	local q = newQ()
	local st = q.Source(q.D.Frame({}))
	local parent = q.D.Frame({ st })
	collectgarbage("collect"); collectgarbage("collect")
	local before = collectgarbage("count")
	for i = 1, 2000 do
		st:Set(q.D.Frame({}))
	end
	collectgarbage("collect"); collectgarbage("collect")
	local after = collectgarbage("count")
	print(string.format("KB before=%.1f after=%.1f delta=%.1f", before, after, after - before))
	print("children now:", #parent:GetChildren())
end

section("R2 Property churn on hash key via State — memory bounded")
do
	local q = newQ()
	local st = q.Source("a")
	local f = q.D.Frame({ Text = st })
	collectgarbage("collect"); collectgarbage("collect")
	local before = collectgarbage("count")
	for i = 1, 5000 do st:Set("v" .. i) end
	collectgarbage("collect"); collectgarbage("collect")
	local after = collectgarbage("count")
	print(string.format("KB before=%.1f after=%.1f delta=%.1f Text=%s", before, after, after - before, f.Text))
end

section("R3 Event via State<fn|None> — reconnect/disconnect; None disconnects")
do
	local q = newQ()
	local fires = 0
	local st = q.Source(function() fires += 1 end)
	local f = q.D.Frame({ MouseButton1Click = st })
	f.MouseButton1Click:Fire()
	st:Set(function() fires += 10 end)
	f.MouseButton1Click:Fire()
	st:Set(q.None)
	f.MouseButton1Click:Fire()
	print("fires", fires, "(expect 11)")
end

section("R4 Modifier field None + inline absent → property skipped; inline None wins over modifier value")
do
	local q = newQ()
	local m = q.Modifier({ Text = "fromMod", Size = 7 })
	local f = q.D.Frame({ m, Text = q.None })
	print("Text", f.Text, "Size", f.Size)
end

section("R5 Modifier with State field then flatten + StoreBind; re-Set propagates")
do
	local q = newQ()
	local s = q.Source("x")
	local m = q.Modifier():Text(s)
	local f = q.D.Frame({ m })
	s:Set("y")
	print("Text", f.Text)
end

section("R6 PostRef ordering vs nested child PostRef + PreRef + Modifier mixed")
do
	local q = newQ()
	local log = {}
	local pre = q.PreRef(nil):Callback(function(v) if v then table.insert(log, "pre:" .. v.Name) end end)
	local post = q.PostRef(nil):Callback(function(v) if v then table.insert(log, "post:" .. v.Name .. ":children=" .. #v:GetChildren()) end end)
	local m = q.Modifier({ Name = "Outer" })
	local f = q.D.Frame({ post, q.D.Frame({ Name = "Inner" }), m, pre })
	print(table.concat(log, " | "))
end

section("R7 Claim — descriptor tree with a child; nativeClaim double error path")
do
	local q = newQ()
	local root = Instance.new("Frame"); root.Name = "Root"
	local child = Instance.new("Frame"); child.Name = "Kid"; child.Parent = root
	local D = q.D
	local desc = D.Mapper.Frame(D.Mapper.Root)({ Text = "r", D.Mapper.Frame("Kid")({ Text = "k" }) })
	q.Claim(root, desc)
	print("root.Text", root.Text, "child.Text", child.Text, "child parent ok", child.Parent == root)
	local ok, err = pcall(function() q.Claim(root, D.Mapper.Frame(D.Mapper.Root)({})) end)
	print("double claim ok=", ok, err)
end

section("R8 Tag through State swapping; Attribute group through State")
do
	local q = newQ()
	local tagS = q.Source(q.Tag("a", "b"))
	local attrS = q.Source(q.Attribute({ x = 1 }))
	local f = q.D.Frame({ tagS, attrS })
	print("tags", table.concat(mock.getTags(f), ","), "attrs.x", f:GetAttribute("x"))
	tagS:Set(q.Tag("b", "c"))
	attrS:Set(q.Attribute({ y = 2 }))
	print("tags", table.concat(mock.getTags(f), ","), "attrs.x", f:GetAttribute("x"), "attrs.y", f:GetAttribute("y"))
end

section("R9 Slot in D.Frame with reactive State element, swap to nil and back")
do
	local q = newQ()
	local st = q.Source(q.D.Frame({ Name = "A" }))
	local slot = q.Slot({ st })
	local f = q.D.Frame({ slot })
	print("children", #f:GetChildren(), "Length", slot.Length:Get())
	st:Set(nil)
	print("children", #f:GetChildren(), "Length", slot.Length:Get())
	st:Set(q.D.Frame({ Name = "B" }))
	print("children", #f:GetChildren(), "Length", slot.Length:Get(), f:GetChildren()[1].Name)
end

section("R10 Effect fn calling D.Frame (drive inside Effect fn) — cleanup destroys")
do
	local q = newQ()
	local s = q.Source(1)
	local parent = q.D.Frame({})
	local e = q.Effect(function()
		local c = q.D.Frame({ Name = "c" .. s:Get() })
		c.Parent = parent
		return function() c:Destroy() end
	end, s)
	q.D.Frame({ e }) -- host
	s:Set(2)
	print("children", #parent:GetChildren(), parent:GetChildren()[1].Name)
end

section("R1b StoreBind churn WITH dispose(old) — memory bounded?")
do
	local q = newQ()
	local cur = q.D.Frame({})
	local st = q.Source(cur)
	local parent = q.D.Frame({ st })
	collectgarbage("collect"); collectgarbage("collect")
	local before = collectgarbage("count")
	for i = 1, 2000 do
		local old = cur
		cur = q.D.Frame({})
		st:Set(cur)
		q.dispose(old)
	end
	collectgarbage("collect"); collectgarbage("collect")
	local after = collectgarbage("count")
	print(string.format("KB before=%.1f after=%.1f delta=%.1f", before, after, after - before))
	print("children now:", #parent:GetChildren())
end

section("R1c unreferenced D.Frame({}) never parented — collected? (claim pin)")
do
	local q = newQ()
	collectgarbage("collect"); collectgarbage("collect")
	local before = collectgarbage("count")
	for i = 1, 2000 do
		q.D.Frame({ Name = "orphan" })
	end
	collectgarbage("collect"); collectgarbage("collect")
	local after = collectgarbage("count")
	print(string.format("KB before=%.1f after=%.1f delta=%.1f", before, after, after - before))
end

section("R11 Tag name churn — tagNameMap holders accumulate per unique name?")
do
	local q = newQ()
	local tagS = q.Source(q.Tag("n0"))
	local f = q.D.Frame({ tagS })
	collectgarbage("collect"); collectgarbage("collect")
	local before = collectgarbage("count")
	for i = 1, 5000 do tagS:Set(q.Tag("n" .. i)) end
	collectgarbage("collect"); collectgarbage("collect")
	local after = collectgarbage("count")
	print(string.format("KB before=%.1f after=%.1f delta=%.1f tags=%s", before, after, after - before, table.concat(mock.getTags(f), ",")))
end

section("R12 State<Slot|nil> toggle churn — memory bounded")
do
	local q = newQ()
	local slot = q.Slot({ q.D.Frame({ Name = "x" }) })
	local st = q.Source(slot)
	local parent = q.D.Frame({ st })
	collectgarbage("collect"); collectgarbage("collect")
	local before = collectgarbage("count")
	for i = 1, 2000 do st:Set(nil); st:Set(slot) end
	collectgarbage("collect"); collectgarbage("collect")
	local after = collectgarbage("count")
	print(string.format("KB before=%.1f after=%.1f delta=%.1f children=%d", before, after, after - before, #parent:GetChildren()))
end

section("R13 Slot Add/Remove churn on mounted slot — memory bounded")
do
	local q = newQ()
	local slot = q.Slot()
	local parent = q.D.Frame({ slot })
	collectgarbage("collect"); collectgarbage("collect")
	local before = collectgarbage("count")
	for i = 1, 2000 do
		slot:Add(q.D.Frame({}))
		slot:Remove(1)
	end
	collectgarbage("collect"); collectgarbage("collect")
	local after = collectgarbage("count")
	print(string.format("KB before=%.1f after=%.1f delta=%.1f children=%d", before, after, after - before, #parent:GetChildren()))
end

section("R14 Attribute group churn with fresh group objects — memory bounded")
do
	local q = newQ()
	local aS = q.Source(q.Attribute({ k = 1 }))
	local f = q.D.Frame({ aS })
	collectgarbage("collect"); collectgarbage("collect")
	local before = collectgarbage("count")
	for i = 1, 3000 do aS:Set(q.Attribute({ k = i })) end
	collectgarbage("collect"); collectgarbage("collect")
	local after = collectgarbage("count")
	print(string.format("KB before=%.1f after=%.1f delta=%.1f k=%s", before, after, after - before, tostring(f:GetAttribute("k"))))
end

print()
print("=== DONE ===")
