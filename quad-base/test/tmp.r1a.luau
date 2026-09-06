--!nocheck
local mock = require("./mock")
local Instance = mock.Instance
local q = mock.newQuad()

-- A: handler calls setLength with a bad position -> who is blamed?
q.Dispatch.addHandler({
	name = "BadPos",
	isHandlable = function(_i, k, v) return type(k) == "number" and v == "bad" end,
	priority = q.Dispatch.HANDLER_PRIORITY_NORMAL,
	process = function(inst, k, _v, _idx)
		q.Dispatch.setLength(inst, 0, 1) -- illegal position 0
		return q.Void
	end,
})
local inst = Instance.new("Frame")
local ok, err = pcall(function()
	q.Dispatch.process(inst, 1, "bad", 1)
end)
print("A handler-depth setLength blame:", ok, tostring(err))

-- B: direct user call
local ok2, err2 = pcall(function()
	q.Dispatch.getOffsetAt(inst, -3)
end)
print("B direct getOffsetAt blame:", ok2, tostring(err2))

-- C: drive path
local ok3, err3 = pcall(function()
	q.Dispatch.drive(inst, { "bad" })
end)
print("C drive blame:", ok3, tostring(err3))
