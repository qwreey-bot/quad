--[[ explorer fuzz — nested Slot CRUD vs model invariants (delete after) ]]
local mock = require("./mock")
local Instance = mock.Instance
local newQuad = mock.newQuad

local SEED = tonumber((...)) or 12345
local ITER = 4000
local rngState = SEED
local function ri(a: number, b: number): number
	rngState = (rngState * 1103515245 + 12345) % 2147483648
	return a + (rngState // 65536) % (b - a + 1)
end

local q = newQuad()
local root = Instance.new("Frame")
local top = q.Slot()
q.Dispatch.drive(root, { top })

local allSlots: { any } = { top }
local nextId = 0
local function newLeaf(): any
	nextId += 1
	local f = Instance.new("Frame")
	f.Name = "L" .. nextId
	return f
end

-- model: recursive leaves list from _elements (the truth we compare bookkeeping against)
local function leaves(slot: any, out: { any }?): { any }
	local acc = out or {}
	for _, el in ipairs(slot._elements) do
		if q.isSlot(el) then leaves(el, acc) else table.insert(acc, el) end
	end
	return acc
end

local function checkSlot(slot: any, base: number, path: string)
	-- Length == leaf count
	local lv = leaves(slot)
	local L = slot.Length:Get()
	assert(L == #lv, `{path}: Length {L} ~= leaves {#lv}`)
	-- Offset == base
	local off = slot.Offset:Get()
	assert(off == base, `{path}: Offset {off} ~= base {base}`)
	-- per position offsets
	local cur = base
	for i, el in ipairs(slot._elements) do
		local got = q.Dispatch.getOffsetAt(slot, i)
		assert(got == cur, `{path}[{i}]: getOffsetAt {got} ~= {cur}`)
		if q.isSlot(el) then
			checkSlot(el, cur, path .. "/" .. i)
			cur += #leaves(el)
		else
			assert(el.Parent == root, `{path}[{i}]: leaf not parented to root`)
			cur += 1
		end
	end
	local bk = q.Dispatch.getBookkeeping(slot)
	assert((bk.N or 0) == #slot._elements, `{path}: bk.N {bk.N} ~= #_elements {#slot._elements}`)
end

local function checkAll()
	checkSlot(top, 0, "top")
	-- root children set == leaves set
	local lv = leaves(top)
	local kids = root:GetChildren()
	assert(#kids == #lv, `root children {#kids} ~= leaves {#lv}`)
	local set = {}
	for _, k in kids do set[k] = true end
	for _, l in lv do assert(set[l], "leaf missing from root children") end
end

local function pickSlot(): any
	return allSlots[ri(1, #allSlots)]
end

local ops = 0
for it = 1, ITER do
	local s = pickSlot()
	local n = #s._elements
	local op = ri(1, 9)
	local ok, err = pcall(function()
		if op == 1 then -- Add leaf
			s:Add(newLeaf(), if n > 0 and ri(1, 2) == 1 then ri(1, n + 1) else nil)
		elseif op == 2 then -- Add nested slot (bounded depth by count)
			if #allSlots < 12 then
				local child = q.Slot()
				if ri(1, 2) == 1 then child:Add(newLeaf()) end
				s:Add(child, if n > 0 then ri(1, n + 1) else nil)
				table.insert(allSlots, child)
			end
		elseif op == 3 and n > 0 then -- Remove (destroy)
			local i = ri(1, n)
			local el = s._elements[i]
			s:Remove(i)
			if q.isSlot(el) then
				-- destroyed subtree: drop from allSlots (recursively)
				local function drop(sl: any)
					for j = #allSlots, 1, -1 do if allSlots[j] == sl then table.remove(allSlots, j) end end
					for _, e in ipairs(sl._elements) do if q.isSlot(e) then drop(e) end end
				end
				drop(el)
			end
		elseif op == 4 and n > 1 then -- Move
			s:Move(ri(1, n), ri(1, n))
		elseif op == 5 and n > 1 then -- Swap
			s:Swap(ri(1, n), ri(1, n))
		elseif op == 6 and n > 0 then -- Replace with leaf (destroys old)
			local i = ri(1, n)
			local el = s._elements[i]
			s:Replace(i, newLeaf())
			if q.isSlot(el) then
				local function drop(sl: any)
					for j = #allSlots, 1, -1 do if allSlots[j] == sl then table.remove(allSlots, j) end end
					for _, e in ipairs(sl._elements) do if q.isSlot(e) then drop(e) end end
				end
				drop(el)
			end
		elseif op == 7 and n > 0 then -- Extract then re-Add elsewhere
			local i = ri(1, n)
			local el = s:Extract(i)
			local t = pickSlot()
			-- avoid re-adding a slot into its own subtree
			local function contains(sl: any, target: any): boolean
				if sl == target then return true end
				for _, e in ipairs(sl._elements) do if q.isSlot(e) and contains(e, target) then return true end end
				return false
			end
			if q.isSlot(el) and contains(el, t) then
				t = top
				if contains(el, t) then q.dispose(el); return end
			end
			t:Add(el, if #t._elements > 0 then ri(1, #t._elements + 1) else nil)
		elseif op == 8 and n > 0 then -- Splice
			local i = ri(1, n)
			local cnt = ri(0, n - i + 1)
			local removed = s:Splice(i, cnt, newLeaf(), newLeaf())
			for _, el in ipairs(removed) do
				if q.isSlot(el) then
					local function drop(sl: any)
						for j = #allSlots, 1, -1 do if allSlots[j] == sl then table.remove(allSlots, j) end end
						for _, e in ipairs(sl._elements) do if q.isSlot(e) then drop(e) end end
					end
					drop(el)
					q.dispose(el)
				else
					el:Destroy()
				end
			end
		elseif op == 9 and n > 0 then -- Clear a small slot
			if n <= 2 then
				for _, el in ipairs(s._elements) do
					if q.isSlot(el) then
						local function drop(sl: any)
							for j = #allSlots, 1, -1 do if allSlots[j] == sl then table.remove(allSlots, j) end end
							for _, e in ipairs(sl._elements) do if q.isSlot(e) then drop(e) end end
						end
						drop(el)
					end
				end
				s:Clear()
			end
		end
		ops += 1
	end)
	if not ok then
		error(`iteration {it} op {op} failed: {err}`)
	end
	local ok2, err2 = pcall(checkAll)
	if not ok2 then
		error(`iteration {it} (after op {op}) invariant failed: {err2}`)
	end
end
print(`fuzz-slot OK seed={SEED} iters={ITER} ops={ops} slots={#allSlots} leaves={#leaves(top)}`)
