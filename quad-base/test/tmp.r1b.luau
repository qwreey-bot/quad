--!nocheck
local mock = require("./mock")
local Instance = mock.Instance
local q = mock.newQuad()
local sources = {}
mock.addSpecLeaf(q, sources)
local inst = Instance.new("Frame")

-- user props table with an illegal numeric key (hash part, number)
local ok, err = pcall(function()
	q.Dispatch.drive(inst, { [0] = "x" })          -- <-- USER LINE
end)
print("key 0 :", ok, tostring(err))

local ok2, err2 = pcall(function()
	q.Dispatch.drive(inst, { [1.5] = "x" })        -- <-- USER LINE
end)
print("key 1.5:", ok2, tostring(err2))

local ok3, err3 = pcall(function()
	q.Dispatch.drive(inst, { [-2] = "x" })
end)
print("key -2 :", ok3, tostring(err3))

local nan = 0/0
local ok4, err4 = pcall(function()
	q.Dispatch.drive(inst, { [nan] = "x" })
end)
print("key nan:", ok4, tostring(err4))
