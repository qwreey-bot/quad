local Quad = require("../src")
local mock = require("./mock")
local Source, Store = Quad.Source, Quad.Store

-- A) Store constructor accepts non-string keys (H-201 closed only `Of`)
local ok, err = pcall(function()
    return Store({ [1] = Source(1), hp = Source(2) })
end)
print("A store numeric key ok=", ok, err)
if ok then
    local s = Store({ [1] = Source(1) })
    local names = s:Names()
    print("A Names() ->", #names, typeof(names[1]), tostring(names[1]))
end

-- B) EpochMap wrap sanity
print("B", bit32.bnot(-0), bit32.bnot(-4294967295))
