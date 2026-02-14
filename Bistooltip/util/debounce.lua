-- ============================================================
-- util/debounce.lua - Debounce and Throttle Utilities
-- WoW 3.3.5a compatible (Lua 5.1, no C_Timer)
-- ============================================================

local ADDON_NAME = "Bis-Tooltip"

-- Create namespace
BistooltipDebounce = BistooltipDebounce or {}

-- ============================================================
-- OnUpdate-based Timer (3.3.5 compatible)
-- Uses a hidden frame's OnUpdate for timing
-- ============================================================

local timerFrame = CreateFrame("Frame", "BistooltipTimerFrame", UIParent)
timerFrame:Hide()

local activeTimers = {}
local timerIdCounter = 0

timerFrame:SetScript("OnUpdate", function(self, elapsed)
    local now = GetTime()
    local hasActive = false

    -- Collect expired timer IDs first (avoid modifying table during iteration)
    local expiredIds = {}

    for id, timer in pairs(activeTimers) do
        if timer.endTime and now >= timer.endTime then
            table.insert(expiredIds, id)
        else
            hasActive = true
        end
    end

    -- Process expired timers after iteration is complete
    for _, id in ipairs(expiredIds) do
        local timer = activeTimers[id]
        activeTimers[id] = nil
        if timer and timer.callback then
            pcall(timer.callback)
        end
    end

    -- Hide frame when no active timers (save CPU)
    if not hasActive and #expiredIds == 0 then
        self:Hide()
    end
end)

-- ============================================================
-- SetTimeout - Execute callback after delay
-- Returns timer ID for cancellation
-- ============================================================

function BistooltipDebounce.SetTimeout(callback, delaySeconds)
    if not callback then return nil end

    timerIdCounter = timerIdCounter + 1
    local id = timerIdCounter

    activeTimers[id] = {
        callback = callback,
        endTime = GetTime() + (delaySeconds or 0.2),
    }

    timerFrame:Show()
    return id
end

-- ============================================================
-- ClearTimeout - Cancel a pending timer
-- ============================================================

function BistooltipDebounce.ClearTimeout(id)
    if id and activeTimers[id] then
        activeTimers[id] = nil
    end
end

-- ============================================================
-- Debounce - Create a debounced function
-- Only executes after delay since last call
-- ============================================================

function BistooltipDebounce.Create(callback, delaySeconds)
    if not callback then return function() end end

    local timerId = nil
    local delay = delaySeconds or 0.2

    return function(...)
        -- Cancel previous pending call
        if timerId then
            BistooltipDebounce.ClearTimeout(timerId)
            timerId = nil
        end

        -- Capture arguments for delayed execution
        local args = {...}

        -- Schedule new call
        timerId = BistooltipDebounce.SetTimeout(function()
            timerId = nil
            callback(unpack(args))
        end, delay)
    end
end

-- ============================================================
-- Throttle - Create a throttled function
-- Executes at most once per interval
-- ============================================================

function BistooltipDebounce.CreateThrottle(callback, intervalSeconds)
    if not callback then return function() end end

    local lastCallTime = 0
    local interval = intervalSeconds or 0.2

    return function(...)
        local now = GetTime()
        if now - lastCallTime >= interval then
            lastCallTime = now
            callback(...)
        end
    end
end

-- ============================================================
-- Leading Edge Debounce - Execute immediately, then wait
-- Useful for actions that should feel responsive
-- ============================================================

function BistooltipDebounce.CreateLeading(callback, delaySeconds)
    if not callback then return function() end end

    local isWaiting = false
    local delay = delaySeconds or 0.2

    return function(...)
        if not isWaiting then
            isWaiting = true
            callback(...)

            BistooltipDebounce.SetTimeout(function()
                isWaiting = false
            end, delay)
        end
    end
end

-- ============================================================
-- Search-specific Debounce
-- Optimized for search input: 200ms default, cancels on clear
-- ============================================================

local searchTimerId = nil

function BistooltipDebounce.Search(searchText, callback, delayMs)
    -- Cancel previous search timer
    if searchTimerId then
        BistooltipDebounce.ClearTimeout(searchTimerId)
        searchTimerId = nil
    end

    -- If search is empty, execute immediately (clear filter)
    if not searchText or searchText == "" then
        if callback then callback("") end
        return
    end

    -- Otherwise debounce the search
    local delaySeconds = (delayMs or 200) / 1000

    searchTimerId = BistooltipDebounce.SetTimeout(function()
        searchTimerId = nil
        if callback then callback(searchText) end
    end, delaySeconds)
end

-- ============================================================
-- Cancel all pending timers (for cleanup)
-- ============================================================

function BistooltipDebounce.CancelAll()
    wipe(activeTimers)
    timerFrame:Hide()
    searchTimerId = nil
end

-- ============================================================
-- Debug: Get active timer count
-- ============================================================

function BistooltipDebounce.GetActiveCount()
    local count = 0
    for _ in pairs(activeTimers) do count = count + 1 end
    return count
end

-- Uncomment for debug:
-- DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00Bistooltip:|r Debounce module loaded")
