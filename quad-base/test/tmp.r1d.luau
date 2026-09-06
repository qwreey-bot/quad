--!nocheck
local mock = require("./mock")
local Instance = mock.Instance
local q = mock.newQuad()
local inst = Instance.new("Frame")

local G = {}
local reenter = true
q.Dispatch.addHandler({
	name = "ReLeaf",
	isHandlable = function(_i, k, v) return type(k) == "string" and type(v) == "string" end,
	priority = q.Dispatch.HANDLER_PRIORITY_NORMAL,
	process = function(_inst, _k, v, idx)
		print(("  process(%s) at index %d"):format(tostring(v), idx))
		return function(nextValue, retracting)
			print(("  retractor(%s@%d) next=%s retracting=%s"):format(tostring(v), idx, tostring(nextValue), tostring(retracting)))
			if retracting and reenter then
				reenter = false
				print("   -> Set source to a nested Source (deepens the chain)")
				G.src:Set(G.inner)   -- realv is a Source -> StoreBind at index 2 -> recursion to index 3
			end
		end
	end,
})

local src = q.Source("A")
local inner = q.Source("Z")
G.src, G.inner = src, inner
q.Dispatch.process(inst, "key", src, 1)
print("installed (depth 2)")
q.Dispatch.retractFrom(inst, "key", 1)
print("after retract")
local ok, err = pcall(function() q.Dispatch.process(inst, "key", "C", 1) end)
print("reprocess:", ok, tostring(err))
