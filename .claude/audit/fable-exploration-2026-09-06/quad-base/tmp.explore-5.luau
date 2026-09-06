--[[ explorer scratch 5 — blame destinations for user-input errors reached at dispatch depth (delete after) ]]
local mock = require("./mock")
local Instance = mock.Instance
local newQuad = mock.newQuad
local function section(name: string) print(); print("=== " .. name .. " ===") end
local function blameOf(err: any): string
	local msg = tostring(err)
	local file = string.match(msg, "^([^:]+:%d+):") or "(no prefix)"
	return file .. "  ||  " .. msg
end

section("B1 mount-time reconcile: updateFn returns a non-mountable → blame?")
do
	local q = newQuad()
	local inst = Instance.new("Frame")
	local slot = q.Slot()
	slot:List({ 1 }, function(item) return "not-an-instance" end)
	local ok, err = pcall(function() q.Dispatch.drive(inst, { slot }) end)
	print(blameOf(err))
end

section("B2 same Slot literal in two Frames (double mount) → blame?")
do
	local q = newQuad()
	local slot = q.Slot({ Instance.new("Frame") })
	q.Dispatch.drive(Instance.new("Frame"), { slot })
	local ok, err = pcall(function() q.Dispatch.drive(Instance.new("Frame"), { slot }) end)
	print(blameOf(err))
end

section("B3 reconcile at data:Set depth returns non-mountable → blame? (user Set line expected)")
do
	local q = newQuad()
	local inst = Instance.new("Frame")
	local data = q.Source({ 1 })
	local slot = q.Slot()
	slot:List(data, function(item)
		if item == q.KeyGone then return nil end
		if item == 2 then return "bad" end
		return Instance.new("Frame")
	end)
	q.Dispatch.drive(inst, { slot })
	local ok, err = pcall(function() data:Set({ 2 }) end)
	print(blameOf(err))
end

section("B4 mount-time reconcile: same Instance twice via two list items → blame?")
do
	local q = newQuad()
	local inst = Instance.new("Frame")
	local shared = Instance.new("Frame")
	local slot = q.Slot()
	slot:List({ 1, 2 }, function(item) if item == q.KeyGone then return nil end return shared end)
	local ok, err = pcall(function() q.Dispatch.drive(inst, { slot }) end)
	print(blameOf(err))
end

section("B5 Observer leaf at a hash key → blame (control: expected user line)")
do
	local q = newQuad()
	local o = q.Source(1):Observer(function() end)
	local ok, err = pcall(function() q.Dispatch.drive(Instance.new("Frame"), { Named = o }) end)
	print(blameOf(err))
end

section("B6 Slot(initial) with a destroyed slot element → blame (control: constructor line)")
do
	local q = newQuad()
	local dead = q.Slot(); q.dispose(dead)
	local ok, err = pcall(function() return q.Slot({ dead }) end)
	print(blameOf(err))
end

section("B7 PreRef callback throws inside drive → inst blocker stuck On → later length change never recomputes (UB confirm)")
do
	local q = newQuad()
	local sources = {}
	mock.addSpecLeaf(q, sources)
	local inst = Instance.new("Frame")
	local pre = q.PreRef(nil):Callback(function(v) if v then error("boom-in-drive") end end)
	local ok, err = pcall(function() q.Dispatch.drive(inst, { "a", pre, "b" }) end)
	print("drive ok=", ok, "blocker on?", q.Dispatch.getBlocker(inst):IsOn())
end

section("B8 blame at emission depth: KeyGone returning a value (errorBeforeNearest at reconcile) → Source.luau:73?")
do
	local q = newQuad()
	local inst = Instance.new("Frame")
	local data = q.Source({ 1 })
	local slot = q.Slot()
	slot:List(data, function(item)
		if item == q.KeyGone then return Instance.new("Frame") end -- illegal: new value on KeyGone
		return Instance.new("Frame")
	end)
	q.Dispatch.drive(inst, { slot })
	local ok, err = pcall(function() data:Set({}) end)
	print(blameOf(err))
end

section("B9 control: errorBefore at emission depth (Tag name non-string via State) → user Set line?")
do
	local q = newQuad()
	local inst = Instance.new("Frame")
	local tS = q.Source(q.Tag("a"))
	q.Dispatch.drive(inst, { tS })
	local o = q.Source(1):Observer(function() end)
	local ok, err = pcall(function() tS:Set(o) end) -- Observer at array slot via State → leaf handler binds fine; use Attribute dup instead
	print("(tag→observer swap) ok=", ok, blameOf(err))
	local aS = q.Source(q.Attribute({ x = 1 }))
	q.Dispatch.drive(inst, { aS, q.Attribute({ y = 1 }) })
	local ok2, err2 = pcall(function() aS:Set(q.Attribute({ y = 2 })) end) -- name y already claimed by the literal group
	print("(attribute name clash at Set depth)", blameOf(err2))
end

print()
print("=== DONE ===")
