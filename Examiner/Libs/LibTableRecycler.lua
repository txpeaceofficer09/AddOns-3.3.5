local REVISION = 1;
if (type(LibTableRecycler) == "table") and (LibTableRecycler.revision >= REVISION) then
	return;
end

LibTableRecycler = LibTableRecycler or {};
LibTableRecycler.revision = REVISION;
LibTableRecycler.storage = LibTableRecycler.storage or {};
LibTableRecycler.__index = LibTableRecycler;

local storage = LibTableRecycler.storage;
local MAX_STORAGE = 50;

local function Recycle(tbl,recursive)
	for k, v in next, tbl do
		if (type(v) == "table") then
			if (recursive) then
				Recycle(v,1);
			else
				wipe(v);
			end
			if (#storage < MAX_STORAGE) then
				storage[#storage + 1] = v;
			end
		end
		tbl[k] = nil;
	end
end

function LibTableRecycler:Recycle(recursive)
	Recycle(self,recursive);
	return self;
end

function LibTableRecycler:RecycleIndex(index,recursive)
	local tbl = tremove(self,index);
	if (tbl) then
		wipe(tbl);
		if (#storage < MAX_STORAGE) then
			storage[#storage + 1] = tbl;
		end
	end
end

function LibTableRecycler:Fetch()
	local tbl = #storage > 0 and tremove(storage,#storage) or {};
	self[#self + 1] = tbl;
	return tbl;
end

function LibTableRecycler:New()
	return setmetatable({},self);
end