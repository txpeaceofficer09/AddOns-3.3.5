local IsInRaid = IsInRaid
local IsInGroup = IsInGroup
local UnitExists = UnitExists
local InCombatLockdown = InCombatLockdown
local UnitFrame_Initialize = UnitFrame_Initialize
local PartyMemberBackground = PartyMemberBackground
local PartyMemberFrame_OnLoad = PartyMemberFrame_OnLoad
local SecureUnitButton_OnLoad = SecureUnitButton_OnLoad
local IsActiveBattlefieldArena = IsActiveBattlefieldArena

local PARTY_FRAME_DISABLED
local PARTY_FRAME_DISPLAY = "party"

function GetDisplayedAllyFrames()
	local UseCompact = CUF_CVar:GetCVarBool("useCompactPartyFrames")

	if ( not UseCompact and IsActiveBattlefieldArena() ) then
		return "party"
	else
		local Grouped = IsInGroup()
		if ( Grouped ) then
			if ( UseCompact or IsInRaid() ) then
				return "raid"
			end
			return "party"
		end
	end
end

function RaidOptionsFrame_UpdatePartyFrames()
	if ( not InCombatLockdown() ) then
		local Display = GetDisplayedAllyFrames()

		if ( Display and PARTY_FRAME_DISPLAY ~= Display ) then
			local DisplayRaid = Display == "raid"

			PartyMemberBackground:SetAlpha(DisplayRaid and 0 or 1)

			if ( DisplayRaid and CUF_CVar:GetCVarBool("useCompactPartyFrames") ) then
				if ( not PARTY_FRAME_DISABLED ) then
					for i=1,4 do
						local Frame = _G["PartyMemberFrame"..i]
						Frame:UnregisterAllEvents()
						Frame.healthbar:UnregisterAllEvents()
						Frame.manabar:UnregisterAllEvents()
						Frame:Hide()

						local Frame = _G["PartyMemberFrame"..i.."PetFrame"]
						Frame:UnregisterAllEvents()
						Frame.healthbar:UnregisterAllEvents()
					end

					PARTY_FRAME_DISABLED = true
				end
			else
				for i=1,4 do
					local Frame = _G["PartyMemberFrame"..i]

					if ( DisplayRaid ) then
						Frame:SetAlpha(0)
						Frame:Hide()
						Frame:UnregisterAllEvents()
					else
						if ( PARTY_FRAME_DISABLED ) then
							UnitFrame_Initialize(Frame, Frame.unit,  Frame.name, Frame.portrait, Frame.healthbar, Frame.healthbar.TextString, Frame.manabar, Frame.manabar.TextString, Frame.threatIndicator)

							local Frame = _G["PartyMemberFrame"..i.."PetFrame"]
							UnitFrame_Initialize(Frame, Frame.unit,  Frame.name, Frame.portrait, Frame.healthbar, Frame.healthbar.TextString, nil, nil, Frame.threatIndicator)
							SecureUnitButton_OnLoad(Frame, Frame.unit)
						end
						PartyMemberFrame_OnLoad(Frame)
						Frame:SetAlpha(1)
					end
				end

				PARTY_FRAME_DISABLED = nil
			end

			PARTY_FRAME_DISPLAY = Display
		end
	end
end