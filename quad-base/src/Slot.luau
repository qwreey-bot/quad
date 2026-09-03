--!strict
--[[
	Slot.Init(module) — the top-level Slot value type (`base/slot-plan.md`,
	ROADMAP M6). A mutable child array whose bound children track its CRUD.

	[M6 fork, H6] Built in slices; this file grows per slice. The subsystem
	factory pattern (`H-174`): `module.bindLifetime`/`isState`/`Dispatch.*` are
	read late off `module` (backends overwrite them after New()). elementOwner
	and the Detach/KeyGone sentinels live here (re-exported at top level like
	None), so the top-level SlotHandler and this file share one registry.

	Canonical: `base/slot-plan.md`. Bookkeeping (setLength/setOffsetSource/
	getOffsetAt/recompute/getBlocker/getBookkeeping) is `module.Dispatch.*`.
]]

local Brand = require("./Brand")
local Err = require("./ErrorNamespace")
local QuadTypes = require("../luau_packages/quad_types")

local SURFACE = QuadTypes.ERROR_LEVEL_SURFACE

-- Sentinels — identity only (like None). Re-exported at top level.
local Detach = table.freeze(setmetatable({}, { __tostring = function() return "Detach" end }))
local KeyGone = table.freeze(setmetatable({}, { __tostring = function() return "KeyGone" end }))

local function Init(module: any)
	-- ⚠️ H6-3: Slot_mt is created PER module instance, NOT at file scope. Its
	-- methods are closures capturing `module`; a file-level metatable would pin
	-- the most-recent quad module globally and break the New()-instance GC
	-- contract (`H-181`, spec.init test 2).
	local Slot_mt = {}
	Slot_mt.__index = Slot_mt

	local Dispatch = module.Dispatch
	-- H6-2: the Bookkeeping header states Slot must reach the bookkeeping
	-- subsystem directly (not through Dispatch) — and `recompute` is only on
	-- `_bookkeeping` (Dispatch re-exports the other five, not it). Route all six
	-- prefix-sum ops through BK.
	local BK = module._bookkeeping
	local None = module.None
	local isState = module.isState
	-- ⚠️ H-174: lifetime primitives + native ops + isInst are backend-injected
	-- AFTER New(), so they must be read LATE off module — capturing them as
	-- Init-time locals would freeze the base error stubs forever.
	local function bindLifetime(inst: any, v: any) module.bindLifetime(inst, v) end
	local function unbindLifetime(v: any) module.unbindLifetime(v) end
	local function isInst(v: any): boolean return module.isInst(v) end

	-- element(Slot | mountable value) -> ownerKey(inst | Slot). All weak — the
	-- real strong ref is slot._elements / SlotHandler's bindLifetime. Shared by
	-- top-level SlotHandler and nested rawAdd (the gap H fixed by unifying).
	local elementOwner = module.Relate()
	local OWNER, OWNER_POS = "__owner", "__ownerPos"

	local function claimOwner(element: any, ownerKey: any, fromDetached: boolean?)
		local cur = elementOwner:GetWeak(element, OWNER)
		if cur ~= nil then
			if not (fromDetached and cur == ownerKey) then
				Err.errorBeforeNearest("Slot: this element is already mounted — multiple mounts are not allowed", SURFACE)
			end
			return
		end
		elementOwner:SetWeak(element, OWNER, ownerKey)
	end

	local function claimOwnerAt(element: any, inst: any, k: any): boolean
		local current = elementOwner:GetWeak(element, OWNER)
		if current == inst and elementOwner:GetWeak(element, OWNER_POS) == k then
			return false -- exactly this position already holds it — re-confirm, no-op
		end
		if current ~= nil then
			Err.errorBeforeNearest("Slot: this element is already mounted elsewhere — multiple mounts are not allowed", SURFACE)
		end
		elementOwner:SetWeak(element, OWNER, inst)
		elementOwner:SetWeak(element, OWNER_POS, k)
		return true
	end

	local function releaseOwner(element: any, ownerKey: any)
		local current = elementOwner:GetWeak(element, OWNER)
		if current ~= ownerKey then
			error("releaseOwner: this element is not owned by this ownerKey — ownership tracking is broken", 1)
		end
		elementOwner:SetWeak(element, OWNER, nil)
		elementOwner:SetWeak(element, OWNER_POS, nil)
	end

	local function isSlot(v: any): boolean
		return Brand.SlotBrand:is(v)
	end

	-- forward decls (mutual recursion)
	local Slot, materializeSlotTree, mountSlotTree, attachSlot, destroySlotTree, unmountSlotTree

	-- wrap: element-type whitelist gate (H-40) + State→wrapper-Slot. raw* only
	-- ever see already-wrapped physical elements.
	local function wrapElement(v: any): any
		if isSlot(v) then
			-- round15 `H6-19`: a destroyed Slot must fail HERE (pre-pass), not
			-- inside attachSlot after the array/ownership mutation — otherwise
			-- Splice's batch gate is left On by the raise (통합 리뷰 재현).
			if v._destroyed then
				Err.errorBeforeNearest("Slot: destroyed Slot cannot be an element", SURFACE)
			end
			return v
		end
		if not isState(v) then
			if module.isRef(v) or module.isPreRef(v) or module.isPostRef(v)
				or module.isObserver(v) or module.isEffect(v) or module.isModifier(v) then
				Err.errorBeforeNearest("Slot: handler-layer values (Ref/PreRef/PostRef/Observer/Effect/Modifier) cannot be elements", SURFACE)
			end
			if v == nil or v == None then
				Err.errorBeforeNearest("Slot: nil/None cannot be an element — only actually mountable values", SURFACE)
			end
			if not isInst(v) then
				Err.errorBeforeNearest("Slot: this backend cannot mount this value", SURFACE)
			end
			return v
		end
		local sub = Slot()
		sub:Single(v, nil, { Owned = false })
		sub._wrapped = v
		return sub
	end

	local function unwrapElement(el: any): any
		if el == nil then return nil end
		if isSlot(el) then return el._wrapped or el end
		return el
	end

	-- collectLeaves(slot, out?) — flatten the physical leaves a nested Slot
	-- occupies, in order (`H-29`). The native* layer requires "the elements
	-- that leave/move are passed as an array"; a nested-Slot element has no
	-- such array of its own, so reposition/extract paths build it here.
	local function collectLeaves(slot: any, out: { any }?): { any }
		local acc: { any } = out or {}
		for _, element in ipairs(slot._elements) do
			if isSlot(element) then collectLeaves(element, acc)
			else table.insert(acc, element) end
		end
		return acc
	end

	-- leavesOf(element): the array a native* op receives for ONE _elements
	-- entry — the element itself, or its flattened leaves if it is a Slot.
	local function leavesOf(element: any): { any }
		return if isSlot(element) then collectLeaves(element) else { element }
	end

	-- reindexFrom: rewrite bk.indexOfElement from `from` to end. Every place
	-- that shifts _elements calls this — regardless of materialization.
	local function reindexFrom(self: any, from: number)
		local bk = BK.getBookkeeping(self)
		for i = from, #self._elements do
			bk.indexOfElement[self._elements[i]] = i
		end
	end

	local function spliceArraysUp(self: any, index: number)
		local bk = BK.getBookkeeping(self)
		local n = bk.N or 0
		for i = n, index, -1 do
			bk.lengthList[i + 1] = bk.lengthList[i]
			bk.sourceList[i + 1] = bk.sourceList[i]
			bk.observers[i + 1] = bk.observers[i]
		end
		bk.lengthList[index] = 0 -- placeholder (H-5) — filled by setLength
		bk.sourceList[index] = None
		bk.observers[index] = nil
		bk.N = n + 1
		bk.offsetCacheValidUpTo = math.min(bk.offsetCacheValidUpTo, index - 1)
		bk.offsetSetUpTo = math.min(bk.offsetSetUpTo, index - 1)
	end

	local function spliceArraysDown(self: any, index: number)
		local bk = BK.getBookkeeping(self)
		local n = bk.N or 0
		for i = index, n - 1 do
			bk.lengthList[i] = bk.lengthList[i + 1]
			bk.sourceList[i] = bk.sourceList[i + 1]
			bk.observers[i] = bk.observers[i + 1]
		end
		bk.lengthList[n] = nil
		bk.sourceList[n] = nil
		bk.observers[n] = nil
		bk.N = if n > 0 then n - 1 else 0
		bk.offsetCacheValidUpTo = math.min(bk.offsetCacheValidUpTo, index - 1)
		bk.offsetSetUpTo = math.min(bk.offsetSetUpTo, index - 1)
	end

	-- maybeRecompute — THE recompute gate for explicit calls (`H-119`): the
	-- owner's batch Blocker and the reentry blocker are both honored; whatever
	-- a skipped call would have done is recovered by the outer pass's rewind
	-- through the cursors the caller already pulled (`dispatch-core-plan.md`).
	-- Extracted 2026-09-03 (user-approved) — it was copy-pasted at every
	-- raw* tail and the reconcile/List tails.
	local function maybeRecompute(self: any, bk: any)
		if BK.getBlocker(self):IsOn() or bk.recomputeBlocker:IsOn() then return end
		BK.recompute(self, bk)
	end

	-- unbindObserverAt — a position's length observer (State-length slots
	-- only; constants have none) goes with the position.
	local function unbindObserverAt(bk: any, index: number)
		local observer = bk.observers[index]
		if observer then unbindLifetime(observer) end
	end

	-- vacate — the shared tail of the raw 3-family (rawRemove/rawUnmount/
	-- rawDetach; extraction user-approved 2026-09-03, `slot-plan.md` "raw
	-- 3형제"). The three differ ONLY in what happens before this call
	-- (destroy? release ownership?); what is identical is that the position
	-- ceases to exist: array + reverse map always, bookkeeping splice + gated
	-- recompute only once materialized (`H-12`: bookkeeping is unconditional
	-- after materialization, physical ops are what `_mounted` gates).
	local function vacate(self: any, index: number, element: any, bk: any)
		table.remove(self._elements, index)
		reindexFrom(self, index)
		bk.indexOfElement[element] = nil
		if self._physicalTarget ~= nil then
			spliceArraysDown(self, index)
			maybeRecompute(self, bk)
		end
	end

	-- ── attach 3-family ────────────────────────────────────────────────
	local function makeBaseObserver(slot: any): any
		return slot.Offset:Observer(function()
			if slot._physicalTarget == nil then return end -- unmaterialized: swallow the install fire
			local bk = BK.getBookkeeping(slot)
			bk.offsetCacheValidUpTo, bk.offsetSetUpTo = 0, 0 -- base changed → all
			maybeRecompute(slot, bk)
		end)
	end

	function materializeSlotTree(slot: any, physicalTarget: any, ownerKey: any, position: number)
		if slot._destroyed then Err.errorBeforeNearest("Slot: destroyed Slot cannot be mounted", SURFACE) end
		slot._physicalTarget = physicalTarget

		local blocker = BK.getBlocker(slot)
		blocker:On()
		slot._baseObserver._rerunRequired = false
		bindLifetime(physicalTarget, slot._baseObserver)
		BK.setOffsetSource(ownerKey, position, slot.Offset)

		local remountingList = slot._listed and slot._listActivated
		if slot._listed and not slot._listActivated then
			slot:_activateList(physicalTarget) -- initial population — rawAdd registers each slot
		else
			if slot._listed then
				slot:_activateList(physicalTarget) -- remount: anchor only
			end
			for i, element in ipairs(slot._elements) do
				if isSlot(element) then
					materializeSlotTree(element, physicalTarget, slot, i)
				else
					BK.setOffsetSource(slot, i, None)
					BK.setLength(slot, i, 1, physicalTarget, element)
				end
			end
		end
		blocker:OffWithoutEmit()
		maybeRecompute(slot, BK.getBookkeeping(slot)) -- the batch gate just opened; only the reentry gate can still hold
		if remountingList and slot._listObserver then
			bindLifetime(physicalTarget, slot._listObserver)
		end
		BK.setLength(ownerKey, position, slot.Length, physicalTarget, slot)
	end

	function mountSlotTree(slot: any, physicalTarget: any)
		slot._mounted = true
		slot._mountedInst = physicalTarget
		local acc = slot.Offset:Get()
		for _, element in ipairs(slot._elements) do
			if isSlot(element) then
				mountSlotTree(element, physicalTarget)
				acc += element.Length:Get()
			else
				module.nativeInsert(physicalTarget, acc, { element })
				acc += 1
			end
		end
	end

	function attachSlot(slot: any, physicalTarget: any, ownerKey: any, position: number, mount: boolean?)
		materializeSlotTree(slot, physicalTarget, ownerKey, position)
		if mount ~= false then
			mountSlotTree(slot, physicalTarget)
		end
	end

	-- ── raw layer ──────────────────────────────────────────────────────
	local function rawAdd(self: any, element: any, index: number?, fromDetached: boolean?): number
		claimOwner(element, self, fromDetached)
		index = index or (#self._elements + 1)
		table.insert(self._elements, index, element)
		reindexFrom(self, index)

		if self._physicalTarget == nil then
			return index -- unmaterialized: _elements + reverse-map only
		end

		spliceArraysUp(self, index)
		if isSlot(element) then
			attachSlot(element, self._physicalTarget, self, index, self._mounted)
		else
			BK.setOffsetSource(self, index, None)
			if self._mounted then
				module.nativeInsert(self._mountedInst, BK.getOffsetAt(self, index), { element })
			end
			BK.setLength(self, index, 1, self._physicalTarget, element)
		end
		return index
	end

	-- raw 3-family — two axes decide the head (destroy? / release ownership?),
	-- the tail is `vacate` for all three (`slot-plan.md` "raw 3형제"):
	--   rawRemove : release + DESTROY
	--   rawUnmount: release + keep alive   ← the element leaves, reusable elsewhere
	--   rawDetach : KEEP ownership + alive ← this Slot still holds it (_detached)
	local function rawRemove(self: any, index: number)
		local element = self._elements[index]
		local bk = BK.getBookkeeping(self)
		unbindObserverAt(bk, index)
		releaseOwner(element, self)
		if isSlot(element) then destroySlotTree(element)
		elseif self._mounted then
			module.nativeRemove(self._mountedInst, BK.getOffsetAt(self, index), { element })
		else
			module.nativeDispose(element)
		end
		vacate(self, index, element, bk)
	end

	local function rawUnmount(self: any, index: number)
		local element = self._elements[index]
		local bk = BK.getBookkeeping(self)
		unbindObserverAt(bk, index)
		releaseOwner(element, self)
		if isSlot(element) then unmountSlotTree(element)
		elseif self._mounted then
			module.nativeExtract(self._mountedInst, BK.getOffsetAt(self, index), { element })
		end
		vacate(self, index, element, bk)
	end

	local function rawDetach(self: any, index: number)
		local element = self._elements[index]
		local bk = BK.getBookkeeping(self)
		unbindObserverAt(bk, index)
		-- releaseOwner NOT called — the one difference from rawUnmount: releasing
		-- would let someone else claim what slot._detached still holds.
		if isSlot(element) then unmountSlotTree(element)
		elseif self._mounted then
			module.nativeExtract(self._mountedInst, BK.getOffsetAt(self, index), { element })
		end
		vacate(self, index, element, bk)
	end

	-- rawReplace: keep the array position, swap the occupant (H-1/B-5).
	local function rawReplace(self: any, index: number, newElement: any, destroyOld: boolean)
		local oldElement = self._elements[index]
		claimOwner(newElement, self)
		releaseOwner(oldElement, self)
		self._elements[index] = newElement
		local bk = BK.getBookkeeping(self)
		bk.indexOfElement[oldElement] = nil
		bk.indexOfElement[newElement] = index

		if not self._mounted then
			if destroyOld then
				if isSlot(oldElement) then destroySlotTree(oldElement) else module.nativeDispose(oldElement) end
			end
			if self._physicalTarget ~= nil then
				if isSlot(newElement) then
					attachSlot(newElement, self._physicalTarget, self, index, false)
				else
					BK.setOffsetSource(self, index, None)
					BK.setLength(self, index, 1, self._physicalTarget, newElement)
				end
			end
			return
		end

		local offset = BK.getOffsetAt(self, index)
		if isSlot(oldElement) or isSlot(newElement) then
			if isSlot(oldElement) then
				if destroyOld then destroySlotTree(oldElement) else unmountSlotTree(oldElement) end
			else
				local op = if destroyOld then module.nativeRemove else module.nativeExtract
				op(self._mountedInst, offset, { oldElement })
			end
			if isSlot(newElement) then
				attachSlot(newElement, self._physicalTarget, self, index, self._mounted)
				return
			end
			BK.setOffsetSource(self, index, None)
			module.nativeInsert(self._mountedInst, offset, { newElement })
		else
			local op = if destroyOld then module.nativeRemove else module.nativeExtract
			op(self._mountedInst, offset, { oldElement }, { newElement })
		end
		BK.setLength(self, index, 1, self._physicalTarget, newElement)
	end

	-- rawMove: reorder within _elements (no Parent op on Roblox — LayoutOrder-
	-- based). Bookkeeping arrays move with the permutation; recompute re-runs
	-- the affected positions' setLength so offsets follow (H-19).
	-- rotate one array's [from..to] span exactly as table.remove(from)+insert(to)
	-- does — but by index assignment so nil holes (bk.observers is sparse)
	-- survive. `#`-based table.remove/insert would corrupt a hole-laden array.
	local function rotateInPlace(arr: any, from: number, to: number)
		local v = arr[from]
		if from < to then
			for i = from, to - 1 do arr[i] = arr[i + 1] end
		else
			for i = from, to + 1, -1 do arr[i] = arr[i - 1] end
		end
		arr[to] = v
	end

	-- invalidateFrom — raw* regulation 3 (`H-3`/`H-113`): after a permutation,
	-- pull BOTH cursors to one before the lowest touched position — `math.min`
	-- with the position itself is exactly the formula `H-113` disproved.
	local function invalidateFrom(bk: any, lowest: number)
		bk.offsetCacheValidUpTo = math.min(bk.offsetCacheValidUpTo, lowest - 1)
		bk.offsetSetUpTo = math.min(bk.offsetSetUpTo, lowest - 1)
	end

	local function rawMove(self: any, fromIndex: number, toIndex: number)
		if fromIndex == toIndex then return end
		local els = self._elements
		if self._mounted then
			-- raw* regulation 5·6: the physical op gets the flattened leaves and
			-- runs only when mounted. Offsets are read BEFORE the permutation
			-- (the cache describes the current layout). `toOffset` = the absolute
			-- offset the block's first leaf has AFTER the move — the leaf array
			-- is spliced like `_elements` is (remove at from, insert at to), so
			-- moving down past `to` lands after `to`'s leaves minus our own.
			local moving = leavesOf(els[fromIndex])
			local fromOffset = BK.getOffsetAt(self, fromIndex)
			local toOffset = BK.getOffsetAt(self, toIndex)
			if fromIndex < toIndex then
				toOffset += #leavesOf(els[toIndex]) - #moving
			end
			module.nativeMove(self._mountedInst, fromOffset, moving, toOffset)
		end
		rotateInPlace(els, fromIndex, toIndex)
		local lo = math.min(fromIndex, toIndex)
		reindexFrom(self, lo)
		if self._physicalTarget == nil then return end
		-- H6-6: raw* regulation 1 — lengthList/sourceList/observers move with the
		-- SAME permutation as _elements. sourceList especially is ELEMENT-bound
		-- (a nested Slot's own .Offset), not position-bound; permuting only
		-- _elements + indexOfElement leaves recompute writing offsets to the old
		-- occupant's Source. (Roblox nativeMove is a no-op — correctness is
		-- entirely this bookkeeping permutation + recompute.)
		local bk = BK.getBookkeeping(self)
		rotateInPlace(bk.lengthList, fromIndex, toIndex)
		rotateInPlace(bk.sourceList, fromIndex, toIndex)
		rotateInPlace(bk.observers, fromIndex, toIndex)
		invalidateFrom(bk, lo)
		maybeRecompute(self, bk)
	end

	-- rawSwap: the O(1) pair exchange — the middle stays put (that is why
	-- nativeSwap exists apart from nativeMove). Same regulations as rawMove.
	local function rawSwap(self: any, indexA: number, indexB: number)
		if indexA == indexB then return end
		local els = self._elements
		local lo, hi = math.min(indexA, indexB), math.max(indexA, indexB)
		if self._mounted then
			module.nativeSwap(
				self._mountedInst,
				BK.getOffsetAt(self, lo), leavesOf(els[lo]),
				BK.getOffsetAt(self, hi), leavesOf(els[hi])
			)
		end
		els[lo], els[hi] = els[hi], els[lo]
		local bk = BK.getBookkeeping(self)
		bk.indexOfElement[els[lo]], bk.indexOfElement[els[hi]] = lo, hi
		if self._physicalTarget == nil then return end
		for _, arr in { bk.lengthList, bk.sourceList, bk.observers } :: { any } do
			arr[lo], arr[hi] = arr[hi], arr[lo]
		end
		invalidateFrom(bk, lo)
		maybeRecompute(self, bk)
	end

	-- rawSplice: remove `removeCount` positions at `index` (alive — returned)
	-- and insert `newElements` there. Composition of rawUnmount + rawAdd under
	-- this Slot's batch Blocker, so the bookkeeping recompute runs ONCE at the
	-- end (the CRUD table's "shift+recompute 1회" is the recompute half; the
	-- physical ops stay per element — see round15 `H6-9`). Elements are
	-- already wrapped/validated by the caller (`H-30`/`H-31` pre-pass).
	local function rawSplice(self: any, index: number, removeCount: number, newElements: { any }): { any }
		local removed = {}
		local gate = if self._physicalTarget ~= nil then BK.getBlocker(self) else nil
		local ownsGate = gate ~= nil and not gate:IsOn()
		if ownsGate then gate:On() end
		for i = index + removeCount - 1, index, -1 do
			table.insert(removed, 1, self._elements[i])
			rawUnmount(self, i)
		end
		for k, element in ipairs(newElements) do
			rawAdd(self, element, index + k - 1)
		end
		if ownsGate then
			gate:OffWithoutEmit()
			maybeRecompute(self, BK.getBookkeeping(self))
		end
		return removed
	end

	-- releaseElement: disposition of a pushed-out/removed element — Owned decides.
	local function releaseElement(self: any, index: number?, element: any, wasDetached: boolean)
		if wasDetached then
			if self._owned ~= false then
				if isSlot(element) then destroySlotTree(element) else module.nativeDispose(element) end
			end
			return
		end
		if self._owned ~= false then rawRemove(self, index :: number)
		else rawUnmount(self, index :: number) end
	end

	local function indexOfRaw(self: any, element: any): number?
		return BK.getBookkeeping(self).indexOfElement[element]
	end

	local function getDetached(self: any): any
		local d = self._detached
		if d == nil then
			d = {}
			self._detached = d
		end
		return d
	end

	-- ── destroy / unmount trees ────────────────────────────────────────
	function unmountSlotTree(slot: any)
		local physicalTarget = slot._mountedInst
		for i = #slot._elements, 1, -1 do
			local element = slot._elements[i]
			if isSlot(element) then unmountSlotTree(element)
			elseif physicalTarget then
				module.nativeExtract(physicalTarget, BK.getOffsetAt(slot, i), { element })
			end
		end
		local bk = BK.getBookkeeping(slot)
		for _, observer in pairs(bk.observers) do
			unbindLifetime(observer)
		end
		if slot._listObserver then unbindLifetime(slot._listObserver) end
		if slot._detachCleanup then unbindLifetime(slot._detachCleanup) end
		unbindLifetime(slot._baseObserver)
		slot._mounted, slot._mountedInst = false, nil
		slot._physicalTarget = nil
		-- round15 `H6-19` (통합 리뷰 재현): restore the UNMATERIALIZED invariant.
		-- Position bookkeeping (lengthList/sourceList/observers/N + offset cache)
		-- is rebuilt from scratch by the next materializeSlotTree, and CRUD while
		-- unmounted maintains only _elements/indexOfElement — a stale `N` from the
		-- old mount would make the next recompute walk positions that no longer
		-- exist (inflated Length, wrong sibling offsets). `bk` itself, its
		-- indexOfElement and recomputeBlocker survive (`H-232` remount contract).
		bk.lengthList, bk.sourceList, bk.observers, bk.N = {}, {}, {}, nil
		bk.offsetCache = {}
		bk.offsetCacheValidUpTo, bk.offsetSetUpTo = 0, 0
	end

	function destroySlotTree(slot: any)
		if slot._destroyed then return end
		if slot._owned == false then
			unmountSlotTree(slot)
			return
		end
		for _, element in ipairs(slot._elements) do
			if isSlot(element) then destroySlotTree(element)
			else module.nativeDispose(element) end
		end
		if slot._detached then
			for key, element in pairs(slot._detached) do
				if isSlot(element) then destroySlotTree(element) else module.nativeDispose(element) end
				slot._detached[key] = nil
			end
		end
		if slot._detachCleanup then
			unbindLifetime(slot._detachCleanup)
			slot._detachCleanup = nil
		end
		if slot._listObserver then unbindLifetime(slot._listObserver) end
		unbindLifetime(slot._baseObserver)
		local bk = BK.getBookkeeping(slot)
		for _, observer in pairs(bk.observers) do
			unbindLifetime(observer)
		end
		slot._mounted, slot._mountedInst = false, nil
		slot._physicalTarget = nil
		slot._destroyed = true
	end

	-- ── public CRUD (guard + raw* delegation) ──────────────────────────
	local function assertLive(self: any)
		if self._destroyed then Err.errorBeforeNearest("Slot: destroyed Slot cannot be reused", SURFACE) end
	end
	local function assertManual(self: any)
		if self._listed then Err.errorBeforeNearest("Slot: manual CRUD is not allowed after :List/:Single", SURFACE) end
		self._crudUsed = true
	end

	-- checkIndex: fail-fast, no clamping (CRUD table "에러 조건"). `allowEnd`
	-- admits n+1 (an insertion position — Add/Splice); otherwise 1..n.
	local function checkIndex(self: any, index: any, surface: string, allowEnd: boolean?)
		local n = #self._elements
		local limit = if allowEnd then n + 1 else n
		if type(index) ~= "number" or index < 1 or index > limit or index % 1 ~= 0 then
			Err.errorBeforeNearest(surface .. ": index out of range", SURFACE)
		end
	end

	-- prepareElements: the validation PRE-PASS for CRUD that takes new
	-- elements (`H-30`/`H-31`) — wrap (type gate) + "already mounted" + no
	-- duplicates within the batch, all BEFORE any raw* mutates. The wrapped
	-- results are what raw* receives (never wrapped twice).
	-- ⚠️ The checks run on the RAW values (round15 `H6-19`, 통합 리뷰): a State
	-- element is wrapped into a fresh Slot, so checking the wrapper would be
	-- vacuous — the same State twice, or a State whose current value is
	-- already mounted, would pass here and raise from reconcile depth
	-- mid-mutation. For a State the occupant to check is its current value.
	local function prepareElements(surface: string, count: number, ...: any): { any }
		local prepared, seen = table.create(count), {}
		for i = 1, count do
			local raw = (select(i, ...))
			if raw ~= nil and seen[raw] then
				Err.errorBeforeNearest(surface .. ": the same element appears twice", SURFACE)
			end
			local element = wrapElement(raw) -- type gate (nil/None/handler-layer/isInst)
			seen[raw] = true
			local occupant = if element ~= raw then raw:Get() else raw
			if occupant ~= nil and elementOwner:GetWeak(occupant, OWNER) ~= nil then
				Err.errorBeforeNearest(surface .. ": this element is already mounted — multiple mounts are not allowed", SURFACE)
			end
			prepared[i] = element
		end
		return prepared
	end

	function Slot_mt.Add(self: any, element: any, index: number?): number
		assertLive(self); assertManual(self)
		if index ~= nil then checkIndex(self, index, "Slot:Add", true) end
		return rawAdd(self, prepareElements("Slot:Add", 1, element)[1], index)
	end

	function Slot_mt.Remove(self: any, index: number)
		assertLive(self); assertManual(self)
		checkIndex(self, index, "Slot:Remove")
		rawRemove(self, index)
	end

	-- Replace: same position, new occupant, old one DESTROYED — Extract's
	-- destroy twin (`B-5`). Public Replace always destroys (`destroyOld = true`).
	function Slot_mt.Replace(self: any, index: number, newElement: any)
		assertLive(self); assertManual(self)
		checkIndex(self, index, "Slot:Replace")
		local prepared = prepareElements("Slot:Replace", 1, newElement)
		rawReplace(self, index, prepared[1], true)
	end

	-- Extract(index, newElement?): alive removal. Without `newElement` the
	-- tail is pulled in (O(n)); with it the position is swapped in place
	-- (O(1)). Returns the previous element, unwrapped.
	function Slot_mt.Extract(self: any, index: number, newElement: any?): any
		assertLive(self); assertManual(self)
		checkIndex(self, index, "Slot:Extract")
		local old = self._elements[index]
		if newElement ~= nil then
			local prepared = prepareElements("Slot:Extract", 1, newElement)
			rawReplace(self, index, prepared[1], false)
		else
			rawUnmount(self, index)
		end
		return unwrapElement(old)
	end

	-- Splice(index, removeCount, ...newElements): alive removal of a span +
	-- insertion in its place, one recompute. `index` ranges like Add (1..n+1);
	-- `removeCount` must fit what is actually there — no clamping.
	function Slot_mt.Splice(self: any, index: number, removeCount: number, ...: any): { any }
		assertLive(self); assertManual(self)
		checkIndex(self, index, "Slot:Splice", true)
		if type(removeCount) ~= "number" or removeCount < 0 or removeCount % 1 ~= 0
			or index + removeCount - 1 > #self._elements then
			Err.errorBeforeNearest("Slot:Splice: removeCount out of range", SURFACE)
		end
		local prepared = prepareElements("Slot:Splice", select("#", ...), ...)
		local removed = rawSplice(self, index, removeCount, prepared)
		for i, element in ipairs(removed) do
			removed[i] = unwrapElement(element)
		end
		return removed
	end

	-- Move/Swap: reposition only — no ownership change, no Parent op on
	-- Roblox (`nativeMove`/`nativeSwap` are no-ops there). void by design:
	-- the caller already knows the positions.
	function Slot_mt.Move(self: any, oldIndex: number, newIndex: number)
		assertLive(self); assertManual(self)
		checkIndex(self, oldIndex, "Slot:Move")
		checkIndex(self, newIndex, "Slot:Move")
		rawMove(self, oldIndex, newIndex)
	end

	function Slot_mt.Swap(self: any, indexA: number, indexB: number)
		assertLive(self); assertManual(self)
		checkIndex(self, indexA, "Slot:Swap")
		checkIndex(self, indexB, "Slot:Swap")
		rawSwap(self, indexA, indexB) -- Swap(i, i) is a no-op inside
	end

	function Slot_mt.Get(self: any, index: number): any
		return unwrapElement(self._elements[index])
	end

	function Slot_mt.IndexOf(self: any, element: any): number?
		for i, el in ipairs(self._elements) do
			if unwrapElement(el) == element then return i end
		end
		return nil
	end

	function Slot_mt.Clear(self: any)
		assertLive(self); assertManual(self)
		for i = #self._elements, 1, -1 do
			rawRemove(self, i)
		end
	end

	function Slot_mt.ExtractAll(self: any): { any }
		assertLive(self); assertManual(self)
		local out = {}
		for i = #self._elements, 1, -1 do
			table.insert(out, 1, unwrapElement(self._elements[i]))
			rawUnmount(self, i)
		end
		return out
	end

	-- ── :List / :Single (slice 4) ──────────────────────────────────────
	local function identityUpdateFn(item: any): any
		if item == KeyGone then return nil end
		return item
	end

	-- _activateList — called by materializeSlotTree at mount. Fresh path builds
	-- the reconcile closure (mounted/userdata/prevKeys upvalues) + subscribes;
	-- remount path re-anchors only (idempotent guard).
	function Slot_mt._activateList(self: any, physicalTarget: any)
		if self._listActivated then
			-- remount: keep closure state, move the detachCleanup anchor only.
			-- (_listObserver re-bind is materializeSlotTree's tail — H-163.)
			bindLifetime(physicalTarget, self._detachCleanup)
			return
		end
		self._listActivated = true

		local keyFn, updateFn = self._keyFn, self._updateFn
		local offset = self.Offset
		local mounted, userdata, prevKeys = {}, {}, {}

		local function settle(key: any, result: any, detach: boolean, slotPos: number)
			local wasMounted = mounted[key]
			local detached = self._detached
			local wasDetached = detached and detached[key]
			local prev = wasMounted or wasDetached

			if detach then
				if wasMounted ~= nil then
					local idx = indexOfRaw(self, wasMounted) :: number
					if self._owned == false then
						rawUnmount(self, idx)
						mounted[key] = nil
					else
						rawDetach(self, idx)
						getDetached(self)[key], mounted[key] = wasMounted, nil
					end
				end
			elseif result == nil then
				if prev ~= nil then
					local idx = if wasDetached ~= nil then nil else indexOfRaw(self, wasMounted)
					releaseElement(self, idx, prev, wasDetached ~= nil)
				end
				mounted[key] = nil
				if detached then detached[key] = nil end
			elseif result == unwrapElement(prev) then
				if wasDetached ~= nil then
					detached[key] = nil
					rawAdd(self, prev, slotPos, true)
					mounted[key] = prev
				else
					local idx = indexOfRaw(self, wasMounted) :: number
					if idx ~= slotPos then rawMove(self, idx, slotPos) end
				end
			else
				local element = wrapElement(result)
				if wasDetached ~= nil then
					releaseElement(self, nil, prev, true)
					detached[key] = nil
					rawAdd(self, element, slotPos)
				elseif wasMounted ~= nil then
					local idx = indexOfRaw(self, wasMounted) :: number
					rawReplace(self, idx, element, self._owned ~= false)
					if idx ~= slotPos then rawMove(self, idx, slotPos) end
				else
					rawAdd(self, element, slotPos)
				end
				mounted[key] = element
			end
		end

		local function reconcile(items: any)
			local keys, seen = table.create(#items), {}
			for i, item in ipairs(items) do
				local key = keyFn(item, i)
				if key == nil then
					-- fail-fast domain error instead of Luau's raw "table index is nil"
					-- at seen[key] (통합 리뷰 발견). errorBefore (outermost), not
					-- Nearest: reconcile runs at dispatch/emission depth (mount or
					-- data:Set), never as a direct user call — `H10-2` reasoning,
					-- same for the duplicate-key raise below
					Err.errorBefore("Slot:List — keyFn returned nil for item #" .. tostring(i), SURFACE)
				end
				if seen[key] then
					Err.errorBefore("Slot:List — duplicate key: " .. tostring(key), SURFACE)
				end
				seen[key] = true
				keys[i] = key
			end

			local blocker = BK.getBlocker(self)
			local ownsGate = not blocker:IsOn()
			if ownsGate then blocker:On() end

			local slotPos = 0
			for i, item in ipairs(items) do
				local key = keys[i]
				local prev = unwrapElement(mounted[key] or (self._detached and self._detached[key]))
				local candidateSlot = slotPos + 1
				local physIndex = BK.getOffsetAt(self, candidateSlot) - offset:Get() + 1
				local result, ud = updateFn(item, physIndex, offset, prev, userdata[key])
				if result == None then result = nil end
				local detach = (result == Detach)
				if detach then result = nil end
				if result ~= nil then slotPos = candidateSlot end
				prevKeys[key] = true
				settle(key, result, detach, slotPos)
				userdata[key] = ud
			end

			for key in pairs(table.clone(prevKeys)) do
				if not seen[key] then
					local prev = unwrapElement(mounted[key] or (self._detached and self._detached[key]))
					local result, ud = updateFn(KeyGone, 0, offset, prev, userdata[key])
					if result == None then result = nil end
					local detach = (result == Detach)
					if detach then result = nil end
					if result ~= nil then
						Err.errorBeforeNearest("Slot:List — KeyGone accepts only nil/None (destroy) or Detach (hold)", SURFACE)
					end
					settle(key, result, detach, 0)
					userdata[key] = ud
					prevKeys[key] = nil
				end
			end

			if ownsGate then
				blocker:OffWithoutEmit()
				maybeRecompute(self, BK.getBookkeeping(self))
			end
		end

		self._detachCleanup = module.Effect(function()
			return function()
				if not self._detached then return end
				for key, element in pairs(self._detached) do
					releaseOwner(element, self)
					if isSlot(element) then destroySlotTree(element) else module.nativeDispose(element) end
					self._detached[key] = nil
				end
			end
		end)
		bindLifetime(physicalTarget, self._detachCleanup)

		local data = self._listData
		if isState(data) then
			local observer = data:Observer(function() reconcile(data:Get()) end)
			self._listObserver = observer
			bindLifetime(physicalTarget, observer)
		else
			reconcile(data)
		end
	end

	function Slot_mt.List(self: any, data: any, updateFn: any, keyFn: any?, opts: any?): any
		assertLive(self)
		if self._listed then Err.errorBeforeNearest("Slot: already has :List installed", SURFACE) end
		if self._crudUsed then Err.errorBeforeNearest("Slot: cannot install :List after manual CRUD was used", SURFACE) end
		self._listed = true
		self._listData = data
		self._updateFn = updateFn
		self._keyFn = keyFn or function(_item: any, index: number) return index end
		if opts and opts.Owned == false then self._owned = false end
		-- if already materialized, activate now (mount is a one-shot event)
		if self._physicalTarget then
			self:_activateList(self._physicalTarget)
			maybeRecompute(self, BK.getBookkeeping(self))
		end
		return self
	end

	function Slot_mt.Single(self: any, state: any, updateFn: any?, opts: any?): any
		local uf = updateFn or identityUpdateFn
		local data = if isState(state)
			then state:Compute(function(v: any) local g = v:Get(); return (if g == nil then {} else { g }) end)
			else (if state == nil then {} else { state })
		return self:List(data, function(item: any, _index: number, off: any, prev: any, ud: any)
			return (uf :: any)(item, off, prev, ud)
		end, function() return true end, opts)
	end

	-- ── constructor ────────────────────────────────────────────────────
	function Slot(initial: { any }?): any
		local self = setmetatable({
			_elements = {},
			_bk = nil,
			Length = module.Source(0),
			Offset = module.Source(0),
			_mounted = false,
		}, Slot_mt)
		Brand.SlotBrand:register(self)
		self._baseObserver = makeBaseObserver(self)
		if initial ~= nil then
			self._crudUsed = true
			-- Not `self:Add(v)` — the tagged Add would then be the nearest tagged
			-- frame and blame THIS line instead of the user's `Slot{…}` (round15
			-- `H6-19`). Same pre-pass + raw* as Add, called directly.
			for _, v in ipairs(initial) do
				rawAdd(self, prepareElements("Slot", 1, v)[1])
			end
		end
		return self
	end

	-- dispose(value) — the one safe path to destroy a quad-managed value.
	local function dispose(value: any)
		if elementOwner:GetWeak(value, OWNER) ~= nil then
			Err.errorBeforeNearest("dispose: this value still requires its tree to be alive — Remove/Extract it first", SURFACE)
		end
		if isSlot(value) then destroySlotTree(value)
		elseif isInst(value) then module.nativeDispose(value)
		else Err.errorBeforeNearest("dispose: this backend cannot dispose this value", SURFACE) end
	end

	-- Expose to module + the SlotHandler (Dispatch/Slot.luau reaches these
	-- through module).
	module.Slot = Slot
	module.Detach = Detach
	module.KeyGone = KeyGone
	module.dispose = dispose
	module.isSlot = isSlot
	-- internal surface the SlotHandler needs
	module._slotInternal = {
		claimOwnerAt = claimOwnerAt,
		releaseOwner = releaseOwner,
		attachSlot = attachSlot,
		unmountSlotTree = unmountSlotTree,
		isSlot = isSlot,
	}

	-- Register the top-level SlotHandler here (H-278: the owning module
	-- registers its own handler). Dispatch is already installed (Slot.Init
	-- runs after InitDispatch), and _slotInternal above is ready.
	require("./Dispatch/Slot").register(Dispatch, module)

	-- `H-238`: public surface tagged so argument-validation raises (Nearest)
	-- blame the user's line, not this file. All are table-stored (module field
	-- / metatable methods) — the spike-27 inlining rule holds. (round15
	-- `H6-10`: the fork tagged only `dispose`; the same gap `H10-7` closed
	-- for Tag/Attribute.)
	for _, fn in
		{
			Slot, dispose,
			Slot_mt.Add, Slot_mt.Remove, Slot_mt.Replace, Slot_mt.Extract, Slot_mt.ExtractAll,
			Slot_mt.Splice, Slot_mt.Clear, Slot_mt.Move, Slot_mt.Swap,
			Slot_mt.List, Slot_mt.Single,
		} :: { any }
	do
		Err.setFuncLevel(fn, SURFACE)
	end
end

return Init
