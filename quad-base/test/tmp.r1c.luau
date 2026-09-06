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
	process = function(_inst, _k, v, _idx)
		return function(nextValue, retracting)
			print(("  retractor(%s) next=%s retracting=%s"):format(tostring(v), tostring(nextValue), tostring(retracting)))
			if retracting and reenter then
				reenter = false
				print("   -> re-Setting source from inside the retractor")
				G.src:Set("B")
			end
		end
	end,
})

local src = q.Source("A")
G.src = src
q.Dispatch.process(inst, "key", src, 1)
print("installed")
print("retractFrom...")
q.Dispatch.retractFrom(inst, "key", 1)
print("after retract")
local ok, err = pcall(function() q.Dispatch.process(inst, "key", "C", 1) end)
print("reprocess:", ok, tostring(err))
