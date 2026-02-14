-- =============================================================================
-- OmniInventory Flow View
-- =============================================================================
-- Purpose: Category-sectioned view (AdiBags-style).
-- Items grouped by category with headers.
-- =============================================================================

local addonName, Omni = ...

Omni.FlowView = {}
local FlowView = Omni.FlowView

-- =============================================================================
-- Constants
-- =============================================================================

local ITEM_SIZE = 37
local ITEM_SPACING = 4
local HEADER_HEIGHT = 20
local SECTION_SPACING = 8

-- =============================================================================
-- Layout Calculation
-- =============================================================================

function FlowView:CalculateSectionLayout(containerWidth, itemCount)
    local columns = math.floor(containerWidth / (ITEM_SIZE + ITEM_SPACING))
    columns = math.max(columns, 1)

    local rows = math.ceil(itemCount / columns)
    local height = rows * (ITEM_SIZE + ITEM_SPACING)

    return {
        columns = columns,
        rows = rows,
        height = height + HEADER_HEIGHT + SECTION_SPACING,
    }
end

function FlowView:GetCategoryOrder(categorizedItems)
    local order = {}

    for catName, _ in pairs(categorizedItems) do
        table.insert(order, catName)
    end

    -- Sort by category priority
    if Omni.Categorizer then
        table.sort(order, function(a, b)
            local infoA = Omni.Categorizer:GetCategoryInfo(a)
            local infoB = Omni.Categorizer:GetCategoryInfo(b)
            return (infoA.priority or 99) < (infoB.priority or 99)
        end)
    else
        table.sort(order)
    end

    return order
end

print("|cFF00FF00OmniInventory|r: FlowView loaded")
