--!nocheck
-- raw Lua semantics probe: `#` on a table whose [1] was set then nil'd, [2] live
local t = {}
t[1] = "a"
t[2] = "b"
t[2] = nil
t[1] = nil
t[2] = "c"
print("case1 #t =", #t)
local u = {}
u[1] = "a"
u[1] = nil
u[2] = "c"
print("case2 #u =", #u)
