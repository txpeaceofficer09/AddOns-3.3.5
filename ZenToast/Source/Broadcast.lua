local GetFriendInfo, GetNumFriends = GetFriendInfo, GetNumFriends
local SendChatMessage = SendChatMessage
local DEFAULT_CHAT_FRAME = DEFAULT_CHAT_FRAME

function ZenToast.InitBroadcast()
    -- Broadcast Functionality (Mass Whisper)
    local BROADCAST_PLACEHOLDER = "Broadcast to friends..."

    local function Broadcast_OnEnterPressed(self)
        local text = self:GetText()
        if not text or text == "" or text == BROADCAST_PLACEHOLDER then return end

        local count = GetNumFriends()
        if count < 1 then return end

        local sentCount = 0

        for i = 1, count do
            local name, _, _, _, connected = GetFriendInfo(i)
            if connected then
                SendChatMessage(text, "WHISPER", nil, name)
                sentCount = sentCount + 1
            end
        end

        DEFAULT_CHAT_FRAME:AddMessage("|cff0099ffZenToast:|r Broadcast sent to " .. sentCount .. " friends.")
        self:SetText("")
        self:ClearFocus()

        -- Reset to placeholder
        self:SetText(BROADCAST_PLACEHOLDER)
        self:SetTextColor(0.5, 0.5, 0.5)
    end

    local function Broadcast_OnEditFocusGained(self)
        if self:GetText() == BROADCAST_PLACEHOLDER then
            self:SetText("")
            self:SetTextColor(1, 1, 1)
        end
    end

    local function Broadcast_OnEditFocusLost(self)
        if self:GetText() == "" then
            self:SetText(BROADCAST_PLACEHOLDER)
            self:SetTextColor(0.5, 0.5, 0.5)
        end
    end

    -- Hook into the frame existing in 3.3.5a
    if FriendsFrameBroadcastInput then
        FriendsFrameBroadcastInput:SetScript("OnEnterPressed", Broadcast_OnEnterPressed)
        FriendsFrameBroadcastInput:SetScript("OnEditFocusGained", Broadcast_OnEditFocusGained)
        FriendsFrameBroadcastInput:SetScript("OnEditFocusLost", Broadcast_OnEditFocusLost)

        FriendsFrameBroadcastInput:Show()
        -- Prevent the default UI from hiding it (Original addon logic)
        FriendsFrameBroadcastInput.Hide = function() end

        -- Initialize
        FriendsFrameBroadcastInput:SetText(BROADCAST_PLACEHOLDER)
        FriendsFrameBroadcastInput:SetTextColor(0.5, 0.5, 0.5)

        -- Optional: Style the input box to fit the theme
        local bg = _G["FriendsFrameBroadcastInputLeft"]:GetParent()
        if bg then
           -- You could strip textures here if you wanted it fully minimalist
        end
    end
end
print("ZenToast: Broadcast loaded")
