-- ============================================================
-- Config.lua - Settings and configuration for BisTooltip
-- ============================================================

local AceConfigDialog = LibStub("AceConfigDialog-3.0")
local AceGUI = LibStub("AceGUI-3.0")
local LDB = LibStub("LibDataBroker-1.1", true)
local LDBIcon = LDB and LibStub("LibDBIcon-1.0", true)

-- ============================================================
-- Local State
-- ============================================================

local icon_loaded = false
local icon_name = "BisTooltipIcon"
local config_shown = false

-- ============================================================
-- Data Sources
-- ============================================================

local sources = {
    wowtbc = "wowtbc"
}

Bistooltip_source_to_url = {
    ["wowtbc"] = "wowtbc.gg/wotlk"
}

-- ============================================================
-- Database Defaults
-- ============================================================

local db_defaults = {
    char = {
        -- Selection state
        class_index = 1,
        spec_index = 1,
        phase_index = 1,
        
        -- Filtering
        filter_specs = {},
        highlight_spec = {},
        filter_class_names = false,
        
        -- Data source
        data_source = "wowtbc",
        
        -- UI preferences
        minimap_icon = true,
        tooltip_with_ctrl = false,
        bis_checklist = false,
        
        -- Version for migrations
        version = nil,
        
        -- Debug mode
        debug_mode = false,
    }
}

-- ============================================================
-- Configuration Table
-- ============================================================

local configTable = {
    type = "group",
    name = "Bis-Tooltip",
    args = {
        header_general = {
            name = "General Settings",
            order = 0,
            type = "header",
        },
        minimap_icon = {
            name = "Show minimap icon",
            order = 1,
            desc = "Shows/hides minimap icon",
            type = "toggle",
            width = "full",
            set = function(info, val)
                BistooltipAddon.db.char.minimap_icon = val
                if val == true then
                    if icon_loaded == true then
                        LDBIcon:Show(icon_name)
                    else
                        BistooltipAddon:addMapIcon()
                    end
                else
                    if LDBIcon then
                        LDBIcon:Hide(icon_name)
                    end
                end
            end,
            get = function(info)
                return BistooltipAddon.db.char.minimap_icon
            end
        },
        filter_class_names = {
            name = "Hide class names in tooltips",
            order = 2,
            desc = "Removes class name separators from item tooltips",
            type = "toggle",
            width = "full",
            set = function(info, val)
                BistooltipAddon.db.char.filter_class_names = val
            end,
            get = function(info)
                return BistooltipAddon.db.char.filter_class_names
            end
        },
        tooltip_with_ctrl = {
            name = "Show BIS info only with Ctrl",
            order = 3,
            desc = "Show BIS information in item tooltips only when holding Ctrl key",
            type = "toggle",
            width = "full",
            set = function(info, val)
                BistooltipAddon.db.char.tooltip_with_ctrl = val
            end,
            get = function(info)
                return BistooltipAddon.db.char.tooltip_with_ctrl
            end
        },
        header_data = {
            name = "Data Source",
            order = 10,
            type = "header",
        },
        data_source = {
            name = "Data source",
            order = 11,
            desc = "Changes BIS data source",
            type = "select",
            style = "dropdown",
            width = "double",
            values = Bistooltip_source_to_url,
            -- FIXED: select type uses (info, value) not (info, key, val)
            set = function(info, value)
                BistooltipAddon.db.char.data_source = value
                BistooltipAddon:changeSpec(value)
            end,
            -- FIXED: select type uses (info) not (info, key)
            get = function(info)
                return BistooltipAddon.db.char.data_source
            end
        },
        header_filter = {
            name = "Spec Filtering",
            order = 20,
            type = "header",
        },
        filter_specs = {
            name = "Show specs in tooltips",
            order = 21,
            desc = "Select which specs to show in item tooltips (unchecked = hidden)",
            type = "multiselect",
            values = {}, -- Populated dynamically
            set = function(info, key, val)
                local ci, si = strsplit(":", key)
                ci = tonumber(ci)
                si = tonumber(si)
                
                if not Bistooltip_classes or not Bistooltip_classes[ci] then return end
                
                local class_name = Bistooltip_classes[ci].name
                local spec_name = Bistooltip_classes[ci].specs[si]
                
                if not class_name or not spec_name then return end
                
                if not BistooltipAddon.db.char.filter_specs[class_name] then
                    BistooltipAddon.db.char.filter_specs[class_name] = {}
                end
                BistooltipAddon.db.char.filter_specs[class_name][spec_name] = val
            end,
            get = function(info, key)
                local ci, si = strsplit(":", key)
                ci = tonumber(ci)
                si = tonumber(si)
                
                if not Bistooltip_classes or not Bistooltip_classes[ci] then return true end
                
                local class_name = Bistooltip_classes[ci].name
                local spec_name = Bistooltip_classes[ci].specs and Bistooltip_classes[ci].specs[si]
                
                if not class_name or not spec_name then return true end
                
                if not BistooltipAddon.db.char.filter_specs[class_name] then
                    BistooltipAddon.db.char.filter_specs[class_name] = {}
                end
                if BistooltipAddon.db.char.filter_specs[class_name][spec_name] == nil then
                    BistooltipAddon.db.char.filter_specs[class_name][spec_name] = true
                end
                return BistooltipAddon.db.char.filter_specs[class_name][spec_name]
            end
        },
        header_highlight = {
            name = "Spec Highlighting",
            order = 30,
            type = "header",
        },
        highlight_spec = {
            name = "Highlight spec",
            order = 31,
            desc = "Highlights selected spec in item tooltips (select only one)",
            type = "multiselect",
            values = {}, -- Populated dynamically
            set = function(info, key, val)
                if val then
                    local ci, si = strsplit(":", key)
                    ci = tonumber(ci)
                    si = tonumber(si)
                    
                    if not Bistooltip_classes or not Bistooltip_classes[ci] then return end
                    
                    local class_name = Bistooltip_classes[ci].name
                    local spec_name = Bistooltip_classes[ci].specs and Bistooltip_classes[ci].specs[si]
                    
                    if class_name and spec_name then
                        BistooltipAddon.db.char.highlight_spec = {
                            key = key,
                            class_name = class_name,
                            spec_name = spec_name
                        }
                    end
                else
                    BistooltipAddon.db.char.highlight_spec = {}
                end
            end,
            get = function(info, key)
                return BistooltipAddon.db.char.highlight_spec.key == key
            end
        }
    }
}

-- ============================================================
-- Build Filter/Highlight Options
-- ============================================================

local function BuildFilterSpecOptions()
    local filter_specs_options = {}
    
    if not Bistooltip_classes or type(Bistooltip_classes) ~= "table" then
        return
    end
    
    for ci, class in ipairs(Bistooltip_classes) do
        if class and class.name and class.specs then
            for si, spec in ipairs(class.specs) do
                -- Get spec icon if available
                local icon = nil
                if Bistooltip_spec_icons and Bistooltip_spec_icons[class.name] then
                    icon = Bistooltip_spec_icons[class.name][spec]
                end
                
                local option_val
                if icon then
                    option_val = "|T" .. icon .. ":16|t " .. class.name .. " " .. spec
                else
                    option_val = class.name .. " " .. spec
                end
                
                local option_key = ci .. ":" .. si
                filter_specs_options[option_key] = option_val
            end
        end
    end
    
    configTable.args.filter_specs.values = filter_specs_options
    configTable.args.highlight_spec.values = filter_specs_options
end

-- ============================================================
-- Source Selection Dialog (first-time setup)
-- ============================================================

local function OpenSourceSelectDialog()
    local frame = AceGUI:Create("Window")
    frame:SetWidth(300)
    frame:SetHeight(150)
    frame:EnableResize(false)
    frame:SetCallback("OnClose", function(widget)
        AceGUI:Release(widget)
    end)
    frame:SetLayout("List")
    frame:SetTitle(BistooltipAddon.AddonNameAndVersion)

    local labelEmpty = AceGUI:Create("Label")
    labelEmpty:SetFont("Fonts\\FRIZQT__.TTF", 14, "")
    labelEmpty:SetText(" ")
    frame:AddChild(labelEmpty)

    local label = AceGUI:Create("Label")
    label:SetText("Please select a BIS data source to be used for this addon:")
    label:SetFont("Fonts\\FRIZQT__.TTF", 14, "")
    label:SetRelativeWidth(1)
    frame:AddChild(label)

    local labelEmpty2 = AceGUI:Create("Label")
    labelEmpty2:SetFont("Fonts\\FRIZQT__.TTF", 14, "")
    labelEmpty2:SetText(" ")
    frame:AddChild(labelEmpty2)

    local sourceDropdown = AceGUI:Create("Dropdown")
    sourceDropdown:SetCallback("OnValueChanged", function(_, _, key)
        BistooltipAddon.db.char.data_source = key
        BistooltipAddon:changeSpec(key)
    end)
    sourceDropdown:SetRelativeWidth(1)
    sourceDropdown:SetList(Bistooltip_source_to_url)
    sourceDropdown:SetValue(BistooltipAddon.db.char.data_source)
    frame:AddChild(sourceDropdown)
end

-- ============================================================
-- Database Migration
-- ============================================================

local function MigrateAddonDB()
    local db = BistooltipAddon.db.char
    
    -- Initial migration
    if not db.version then
        db.version = 6.1
        db.highlight_spec = {}
        db.filter_specs = {}
        db.class_index = 1
        db.spec_index = 1
        db.phase_index = 1
    end

    -- Set default data source if not set
    if db.data_source == nil then
        db.data_source = "wowtbc"
    end

    -- Version 6.1 -> 6.2 migration
    if db.version == 6.1 then
        db.version = 6.2
        if db.filter_specs["Death knight"] and
           db.filter_specs["Death knight"]["Blood dps"] == nil then
            db.filter_specs["Death knight"]["Blood dps"] = true
        end
    end
    
    -- Version 6.2 -> 6.3 migration (new features)
    if db.version == 6.2 then
        db.version = 6.3
        if db.bis_checklist == nil then
            db.bis_checklist = false
        end
    end
end

-- ============================================================
-- Enable Data Source
-- ============================================================

local function EnableSpec(spec_name)
    if spec_name == sources.wowtbc then
        Bistooltip_bislists = Bistooltip_wowtbc_bislists
        Bistooltip_items = Bistooltip_wowtbc_items
        Bistooltip_classes = Bistooltip_wowtbc_classes
        Bistooltip_phases = Bistooltip_wowtbc_phases
    else
        -- Handle unexpected spec_name - fall back to wowtbc
        Bistooltip_bislists = Bistooltip_wowtbc_bislists
        Bistooltip_items = Bistooltip_wowtbc_items
        Bistooltip_classes = Bistooltip_wowtbc_classes
        Bistooltip_phases = Bistooltip_wowtbc_phases
    end

    -- Check if Bistooltip_phases is nil or not a table
    if type(Bistooltip_phases) ~= "table" then
        DEFAULT_CHAT_FRAME:AddMessage("|cffff0000Bis-Tooltip:|r Phase data not loaded. Check addon files.")
        return
    end

    -- Build phases string
    Bistooltip_phases_string = ""
    for i, phase in ipairs(Bistooltip_phases) do
        if i ~= 1 then
            Bistooltip_phases_string = Bistooltip_phases_string .. "/"
        end
        Bistooltip_phases_string = Bistooltip_phases_string .. phase
    end

    BuildFilterSpecOptions()
end

-- ============================================================
-- Config Dialog
-- ============================================================

function BistooltipAddon:openConfigDialog()
    if config_shown then
        InterfaceOptionsFrame_Show()
    else
        InterfaceOptionsFrame_OpenToCategory(self.AceAddonName)
    end
    config_shown = not config_shown
end

-- ============================================================
-- Minimap Icon
-- ============================================================

function BistooltipAddon:addMapIcon()
    if not self.db.char.minimap_icon then return end
    if icon_loaded then return end
    
    icon_loaded = true
    
    local LDB = LibStub("LibDataBroker-1.1", true)
    local LDBIcon = LDB and LibStub("LibDBIcon-1.0", true)
    
    if not LDB then return end
    
    local PC_MinimapBtn = LDB:NewDataObject(icon_name, {
        type = "launcher",
        text = icon_name,
        icon = "interface/icons/inv_weapon_glave_01.blp",
        OnClick = function(_, button)
            if button == "LeftButton" then
                BistooltipAddon:createMainFrame()
            elseif button == "RightButton" then
                BistooltipAddon:openConfigDialog()
            end
        end,
        OnTooltipShow = function(tt)
            tt:AddLine(BistooltipAddon.AddonNameAndVersion)
            tt:AddLine("|cffffff00Left click|r to open the BiS lists window")
            tt:AddLine("|cffffff00Right click|r to open addon configuration window")
        end
    })
    
    if LDBIcon then
        LDBIcon:Register(icon_name, PC_MinimapBtn, self.db.char)
    end
end

-- ============================================================
-- Change Data Source
-- ============================================================

function BistooltipAddon:changeSpec(spec_name)
    -- Reset selection indices
    self.db.char.class_index = 1
    self.db.char.spec_index = 1
    self.db.char.phase_index = 1
    
    -- Enable new data source
    EnableSpec(spec_name)
    
    -- Clear caches
    if self.ClearSourceCache then
        self:ClearSourceCache()
    end
    if self.ClearTooltipCache then
        self:ClearTooltipCache()
    end

    -- Reinitialize
    if self.initBislists then
        self:initBislists()
    end
    if self.reloadData then
        self:reloadData()
    end
end

-- ============================================================
-- Initialize Configuration
-- ============================================================

function BistooltipAddon:initConfig()
    -- Initialize database
    self.db = LibStub("AceDB-3.0"):New("BisTooltipDB", db_defaults, "Default")

    -- Run migrations
    MigrateAddonDB()

    -- Enable current data source
    EnableSpec(self.db.char.data_source)

    -- Build filter options
    BuildFilterSpecOptions()

    -- Register with Ace3 config
    LibStub("AceConfig-3.0"):RegisterOptionsTable(self.AceAddonName, configTable)
    AceConfigDialog:AddToBlizOptions(self.AceAddonName, self.AceAddonName)
end
