local f = CreateFrame("Frame")

local function OnEvent(self, event, ...)
	if InCombatLockdown() then return end

	for i=1,4 do
		local frame = _G["PartyMemberFrame"..i]

		if frame then
			frame:Hide()
			frame:HookScript("OnShow", function(self)
				self:UnregisterAllEvents()
				self:ClearAllPoints()
				self:SetParent(UIParent)
				self:SetPoint("RIGHT", UIParent, "LEFT", -500, 0)
				self:Hide()
				self:SetScript("OnShow", nil)
			end)
		end
		
		local petFrame = _G["PartyMember"..i.."PetFrame"]
		
		if petFrame then
			petFrame:Hide()
			petFrame:HookScript("OnShow", function(self)
				self:UnregisterAllEvents()
				self:ClearAllPoints()
				self:SetParent(UIParent)
				self:SetPoint("RIGHT", UIParent, "LEFT", -500, 0)
				self:Hide()
				self:SetScript("OnShow", nil)
			end)
		end
	end
end

f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:RegisterEvent("RAID_ROSTER_UPDATE")
f:RegisterEvent("PARTY_MEMBERS_CHANGED")

f:SetScript("OnEvent", OnEvent)
