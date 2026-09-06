--[[ explorer scratch 6 — chain key pinning proof + destroyed value in unmounted State-wrapper (delete after) ]]
local QuadTypes = require("../luau_packages/quad_types")
local mock = require("./mock")
local Instance = mock.Instance
local newQuad = mock.newQuad
local collectgarbage = (_G :: any).collectgarbage :: (...any) -> any
local function section(name: string) print(); print("=== " .. name .. " ===") end

section("K1 proof: a fresh table key used once with process+retractFrom stays pinned while inst lives")
do
	local q = newQuad()
	q.Dispatch.addHandler({
		name = "AnyTableKey",
		isHandlable = function(_i: any, k: any, v: any): boolean return type(k) == "table" and type(v) == "string" end,
		priority = q.Dispatch.HANDLER_PRIORITY_LOW,
		process = function(): (any?, boolean) -> () return q.Void end,
	} :: QuadTypes.Handler)
	local inst = Instance.new("Frame")
	local weak = setmetatable({}, { __mode = "v" })
	local function run()
		local key = { "fresh" }
		weak.key = key
		q.Dispatch.process(inst, key, "v", 1)
		q.Dispatch.retractFrom(inst, key, 1)
	end
	run()
	collectgarbage("collect"); collectgarbage("collect"); collectgarbage("collect")
	print("key alive after retractFrom + GC (inst alive):", weak.key ~= nil)
	inst:Destroy(); inst = nil
	collectgarbage("collect"); collectgarbage("collect"); collectgarbage("collect")
	print("key alive after inst Destroy + drop + GC:", weak.key ~= nil)
end

section("K2 same via Attribute group: private group keys pinned after State<Attribute> swap")
do
	local q = newQuad()
	local inst = Instance.new("Frame")
	local aS = q.Source(q.Attribute({ k = 1 }))
	q.Dispatch.drive(inst, { aS })
	local weak = setmetatable({}, { __mode = "v" })
	local function swap()
		local old = aS:Get()
		weak.oldGroup = old
		aS:Set(q.Attribute({ k = 2 }))
	end
	swap()
	collectgarbage("collect"); collectgarbage("collect"); collectgarbage("collect")
	print("old group object alive after swap + GC:", weak.oldGroup ~= nil, "(group itself may be collectable; its private keys/lists are what stay)")
end

section("D1 unmounted State-wrapper holds a value; user Sets nil then destroys it; remount → nativeExtract on destroyed inst?")
do
	local q = newQuad()
	local root = Instance.new("Frame")
	local leaf = Instance.new("Frame"); leaf.Name = "leaf"
	local src = q.Source(leaf)
	local slot = q.Slot({ src })
	local portal = q.Source(slot)
	q.Dispatch.drive(root, { portal })
	print("mounted children", #root:GetChildren())
	portal:Set(nil) -- unmount slot (leaf.Parent = nil, wrapper still holds leaf in _elements)
	print("after unmount: leaf.Parent", leaf.Parent, "wrapper _elements", #slot._elements[1]._elements)
	src:Set(nil) -- user: Set first (unmount), ...
	leaf:Destroy() -- ...then destroy — the documented order
	print("after Set(nil)+Destroy while unmounted: wrapper _elements", #slot._elements[1]._elements, "destroyed?", mock.isDestroyed(leaf))
	local ok, err = pcall(function() portal:Set(slot) end) -- remount → deferred reconcile → KeyGone → rawUnmount → nativeExtract({leaf}) → leaf.Parent = nil on a destroyed instance
	print("remount ok=", ok, err, "children", #root:GetChildren(), "wrapper _elements", #slot._elements[1]._elements)
	print("(Roblox: Parent assignment on a Destroyed instance raises 'Parent property is locked' — Studio 실측 필요)")
end

section("D2 same but the value is inside a :List (non-detach) — remount reconcile destroys a destroyed inst (Destroy is idempotent)")
do
	local q = newQuad()
	local root = Instance.new("Frame")
	local data = q.Source({ 1 })
	local made = {}
	local slot = q.Slot()
	slot:List(data, function(item, _i, _o, prev)
		if item == q.KeyGone then return nil end
		if prev then return prev end
		local f = Instance.new("Frame"); made[item] = f; return f
	end, function(item) return item end)
	local portal = q.Source(slot)
	q.Dispatch.drive(root, { portal })
	portal:Set(nil)
	data:Set({})
	made[1]:Destroy() -- user destroys the element that the deferred reconcile will try to nativeRemove later
	local ok, err = pcall(function() portal:Set(slot) end)
	print("remount ok=", ok, err, "children", #root:GetChildren())
end

print()
print("=== DONE ===")
