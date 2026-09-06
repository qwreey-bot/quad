--[[ explorer fuzz 2 — List slots (Detach/KeyGone), State elements, portal (State<Slot> swap) (delete after) ]]
local mock = require("./mock")
local Instance = mock.Instance
local newQuad = mock.newQuad

local SEED = tonumber((...)) or 4242
local ITER = 3000
local rngState = SEED
local function ri(a: number, b: number): number
	rngState = (rngState * 1103515245 + 12345) % 2147483648
	return a + (rngState // 65536) % (b - a + 1)
end

local q = newQuad()
local root = Instance.new("Frame")
local top = q.Slot()
local alt = q.Slot()
local portal = q.Source(top)
mock.addSpecLeaf(q, {})
q.Dispatch.drive(root, { "static", portal }) -- a static (spec leaf, length 1) sibling before the portal: base offset 1

local mounted = top -- which slot the portal currently shows
local crudSlots: { any } = { top, alt }
local listSlots: { any } = {} -- { slot, data, ids, made, detachMode }
local stateElems: { any } = {} -- Sources used as elements
local nextId = 0
local function newLeaf(tag: string?): any
	nextId += 1
	local f = Instance.new("Frame")
	f.Name = (tag or "L") .. nextId
	return f
end

local function leaves(slot: any, out: { any }?): { any }
	local acc = out or {}
	for _, el in ipairs(slot._elements) do
		if q.isSlot(el) then leaves(el, acc) else table.insert(acc, el) end
	end
	return acc
end

local function checkSlot(slot: any, base: number, path: string)
	local lv = leaves(slot)
	assert(slot.Length:Get() == #lv, `{path}: Length {slot.Length:Get()} ~= leaves {#lv}`)
	assert(slot.Offset:Get() == base, `{path}: Offset {slot.Offset:Get()} ~= base {base}`)
	local cur = base
	for i, el in ipairs(slot._elements) do
		assert(q.Dispatch.getOffsetAt(slot, i) == cur, `{path}[{i}]: getOffsetAt {q.Dispatch.getOffsetAt(slot, i)} ~= {cur}`)
		if q.isSlot(el) then
			checkSlot(el, cur, path .. "/" .. i)
			cur += #leaves(el)
		else
			assert(el.Parent == root, `{path}[{i}]: leaf {el.Name} not parented to root`)
			cur += 1
		end
	end
end

local function checkList(ls: any)
	-- _elements order == ids order, mapping via made[id]
	local slot = ls.slot
	if slot._physicalTarget == nil then return end -- unmaterialized/unmounted: reconcile is deferred to mount
	assert(#slot._elements == #ls.ids, `list: #_elements {#slot._elements} ~= #ids {#ls.ids}`)
	for i, id in ipairs(ls.ids) do
		local el = slot._elements[i]
		assert(el == ls.made[id], `list: position {i} holds wrong element for id {id}`)
	end
end

local function checkAll()
	checkSlot(mounted, 1, "mounted")
	local lv = leaves(mounted)
	local kids = root:GetChildren()
	assert(#kids == #lv, `root children {#kids} ~= leaves {#lv}`)
	-- unmounted portal side: none of its leaves are under root
	local other = if mounted == top then alt else top
	for _, l in leaves(other) do
		assert(l.Parent ~= root, "unmounted side leaf still under root")
	end
	for _, ls in listSlots do checkList(ls) end
end

local function pickCrud(): any return crudSlots[ri(1, #crudSlots)] end

local function makeListSlot(): any
	local ls = { ids = {}, made = {}, detachMode = ri(1, 2) == 1, detached = {} }
	ls.data = q.Source({})
	ls.slot = q.Slot()
	ls.slot:List(ls.data, function(item, _index, _offset, prev)
		if item == q.KeyGone then
			return if ls.detachMode then q.Detach else nil
		end
		if prev ~= nil then return prev end
		local f = newLeaf("I" .. item .. "_")
		ls.made[item] = f
		return f
	end, function(item) return item end)
	table.insert(listSlots, ls)
	return ls
end

local ops = 0
for it = 1, ITER do
	local op = ri(1, 12)
	local ok, err = pcall(function()
		if op == 1 then -- CRUD add leaf
			local s = pickCrud(); local n = #s._elements
			s:Add(newLeaf(), if n > 0 and ri(1, 2) == 1 then ri(1, n + 1) else nil)
		elseif op == 2 then -- add a list slot into a crud slot
			if #listSlots < 4 then
				local ls = makeListSlot()
				local s = pickCrud(); local n = #s._elements
				s:Add(ls.slot, if n > 0 then ri(1, n + 1) else nil)
			end
		elseif op == 3 then -- add a State element
			if #stateElems < 5 then
				local src = q.Source(if ri(1, 2) == 1 then newLeaf("S") else nil)
				table.insert(stateElems, src)
				local s = pickCrud(); local n = #s._elements
				s:Add(src, if n > 0 then ri(1, n + 1) else nil)
			end
		elseif op == 4 and #stateElems > 0 then -- flip a State element
			local src = stateElems[ri(1, #stateElems)]
			local cur = src:Get()
			if cur ~= nil and ri(1, 2) == 1 then
				src:Set(nil)
			else
				src:Set(newLeaf("S"))
			end
		elseif op == 5 and #listSlots > 0 then -- mutate list data (permute / add / remove ids)
			local ls = listSlots[ri(1, #listSlots)]
			local ids = table.clone(ls.ids)
			local kind = ri(1, 4)
			if kind == 1 then
				nextId += 1
				table.insert(ids, ri(1, #ids + 1), "k" .. nextId)
			elseif kind == 2 and #ids > 0 then
				local removed = table.remove(ids, ri(1, #ids))
				if not ls.detachMode then ls.made[removed] = nil end
			elseif kind == 3 and #ids > 1 then
				local a, b = ri(1, #ids), ri(1, #ids)
				ids[a], ids[b] = ids[b], ids[a]
			elseif kind == 4 and ls.detachMode then
				-- re-add a previously detached id (its instance is held, must be reused)
				local cands = {}
				for id, inst in pairs(ls.made) do
					if not table.find(ids, id) then table.insert(cands, id) end
				end
				if #cands > 0 then table.insert(ids, ri(1, #ids + 1), cands[ri(1, #cands)]) end
			end
			ls.ids = ids
			ls.data:Set(table.clone(ids))
		elseif op == 6 then -- Move/Swap in a crud slot
			local s = pickCrud(); local n = #s._elements
			if n > 1 then
				if ri(1, 2) == 1 then s:Move(ri(1, n), ri(1, n)) else s:Swap(ri(1, n), ri(1, n)) end
			end
		elseif op == 7 then -- Extract a crud element and re-add to the other crud slot
			local s = pickCrud(); local n = #s._elements
			if n > 0 then
				local el = s:Extract(ri(1, n))
				local t = if s == top then alt else top
				t:Add(el, if #t._elements > 0 then ri(1, #t._elements + 1) else nil)
			end
		elseif op == 8 then -- portal swap
			local other = if mounted == top then alt else top
			portal:Set(other)
			mounted = other
		elseif op == 9 then -- portal to nil and back (same slot)
			portal:Set(nil)
			assert(#root:GetChildren() == 0, "portal nil: nothing mounted")
			portal:Set(mounted)
		elseif op == 10 then -- remove a plain leaf from a crud slot (destroy)
			local s = pickCrud(); local n = #s._elements
			if n > 0 then
				local i = ri(1, n)
				local el = s._elements[i]
				if not q.isSlot(el) then s:Remove(i) end
			end
		elseif op == 11 then -- Splice in crud slot around plain leaves only
			local s = pickCrud(); local n = #s._elements
			if n > 0 then
				local i = ri(1, n)
				if not q.isSlot(s._elements[i]) then
					local removed = s:Splice(i, 1, newLeaf())
					for _, el in ipairs(removed) do el:Destroy() end
				end
			end
		elseif op == 12 then -- Replace a plain leaf
			local s = pickCrud(); local n = #s._elements
			if n > 0 then
				local i = ri(1, n)
				if not q.isSlot(s._elements[i]) then s:Replace(i, newLeaf()) end
			end
		end
		ops += 1
	end)
	if not ok then error(`iteration {it} op {op} failed: {err}`) end
	local ok2, err2 = pcall(checkAll)
	if not ok2 then error(`iteration {it} (after op {op}) invariant failed: {err2}`) end
end
print(`fuzz-slot2 OK seed={SEED} iters={ITER} ops={ops} lists={#listSlots} stateElems={#stateElems} mountedLeaves={#leaves(mounted)}`)
