-- =============================================================================
-- OmniInventory Grid View
-- =============================================================================
-- Purpose: Simple unified container view (Bagnon-style).
-- Items displayed in a fixed grid, no category grouping.
-- =============================================================================

local addonName, Omni = ...

Omni.GridView = {}
local GridView = Omni.GridView

-- =============================================================================
-- Constants
-- =============================================================================

local ITEM_SIZE = 37
local ITEM_SPACING = 4

-- =============================================================================
-- Layout Calculation
-- =============================================================================

function GridView:CalculateLayout(containerWidth, itemCount)
    local columns = math.floor(containerWidth / (ITEM_SIZE + ITEM_SPACING))
    columns = math.max(columns, 1)

    local rows = math.ceil(itemCount / columns)
    local height = rows * (ITEM_SIZE + ITEM_SPACING) + ITEM_SPACING

    return {
        columns = columns,
        rows = rows,
        height = height,
        itemSize = ITEM_SIZE,
        spacing = ITEM_SPACING,
    }
end

function GridView:GetItemPosition(index, layout)
    local col = ((index - 1) % layout.columns)
    local row = math.floor((index - 1) / layout.columns)

    local x = ITEM_SPACING + col * (ITEM_SIZE + ITEM_SPACING)
    local y = -(ITEM_SPACING + row * (ITEM_SIZE + ITEM_SPACING))

    return x, y
end

print("|cFF00FF00OmniInventory|r: GridView loaded")
