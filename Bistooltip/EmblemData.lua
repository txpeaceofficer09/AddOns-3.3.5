-- ============================================================
-- EmblemData.lua - Emblem vendor item database
-- ============================================================
-- This file contains mappings of items that can be purchased with emblems.
-- For custom servers, add your emblem vendor items here.

-- Initialize the emblem items table
Bistooltip_emblem_items = Bistooltip_emblem_items or {}

-- ============================================================
-- Helper function to register items
-- ============================================================

local function RegisterEmblemItems(currency, items)
    for itemId, cost in pairs(items) do
        Bistooltip_emblem_items[itemId] = {
            currency = currency,
            cost = cost,
        }
        
        -- Also register in Constants if available
        if BistooltipConstants and BistooltipConstants.RegisterEmblemItem then
            BistooltipConstants.RegisterEmblemItem(itemId, currency, cost)
        end
    end
end

-- ============================================================
-- Emblem of Ascension Items (Custom Server)
-- Format: [itemId] = cost
-- 
-- To find item IDs:
-- 1. Use /script print(GetItemInfo("item:ITEMID"))
-- 2. Or check wowhead.com URL: wowhead.com/wotlk/item=ITEMID
-- 
-- Example: Sanctified T10 gear typically costs 60-95 emblems
-- ============================================================

local ASCENSION_ITEMS = {
    -- ==================
    -- Tier 10 Sanctified (264 -> 277)
    -- These are example items - uncomment and adjust for your server
    -- ==================
    
    -- Death Knight
    [51312] = 95,  -- Sanctified Scourgelord Helmet
    [51314] = 60,  -- Sanctified Scourgelord Shoulderplates
    [51310] = 95,  -- Sanctified Scourgelord Battleplate
    [51313] = 60,  -- Sanctified Scourgelord Gauntlets
    [51311] = 95,  -- Sanctified Scourgelord Legplates
    
    -- Druid
    [51147] = 95,  -- Sanctified Lasherweave Helmet
    [51149] = 60,  -- Sanctified Lasherweave Pauldrons
    [51145] = 95,  -- Sanctified Lasherweave Robes
    [51148] = 60,  -- Sanctified Lasherweave Gloves
    [51146] = 95,  -- Sanctified Lasherweave Legplates
    
    -- Hunter
    [51286] = 95,  -- Sanctified Ahn'Kahar Blood Hunter's Headpiece
    [51288] = 60,  -- Sanctified Ahn'Kahar Blood Hunter's Spaulders
    [51289] = 95,  -- Sanctified Ahn'Kahar Blood Hunter's Tunic
    [51287] = 60,  -- Sanctified Ahn'Kahar Blood Hunter's Handguards
    [51285] = 95,  -- Sanctified Ahn'Kahar Blood Hunter's Legguards
    
    -- Mage
    [51281] = 95,  -- Sanctified Bloodmage Hood
    [51284] = 60,  -- Sanctified Bloodmage Shoulderpads
    [51282] = 95,  -- Sanctified Bloodmage Robe
    [51280] = 60,  -- Sanctified Bloodmage Gloves
    [51283] = 95,  -- Sanctified Bloodmage Leggings
    
    -- Paladin
    [51167] = 95,  -- Sanctified Lightsworn Faceguard (Tank)
    [51161] = 95,  -- Sanctified Lightsworn Headpiece (Holy)
    [51277] = 95,  -- Sanctified Lightsworn Helmet (Ret)
    [51169] = 60,  -- Sanctified Lightsworn Shoulderguards (Tank)
    [51163] = 60,  -- Sanctified Lightsworn Spaulders (Holy)
    [51279] = 60,  -- Sanctified Lightsworn Shoulderplates (Ret)
    
    -- Priest
    [51261] = 95,  -- Sanctified Crimson Acolyte Hood (Shadow)
    [51178] = 95,  -- Sanctified Crimson Acolyte Cowl (Heal)
    [51264] = 60,  -- Sanctified Crimson Acolyte Shoulderpads (Shadow)
    [51181] = 60,  -- Sanctified Crimson Acolyte Mantle (Heal)
    
    -- Rogue
    [51252] = 95,  -- Sanctified Shadowblade Helmet
    [51254] = 60,  -- Sanctified Shadowblade Pauldrons
    [51253] = 95,  -- Sanctified Shadowblade Breastplate
    [51251] = 60,  -- Sanctified Shadowblade Gauntlets
    [51250] = 95,  -- Sanctified Shadowblade Legplates
    
    -- Shaman
    [51242] = 95,  -- Sanctified Frost Witch's Headpiece (Ele)
    [51202] = 95,  -- Sanctified Frost Witch's Faceguard (Enh)
    [51192] = 95,  -- Sanctified Frost Witch's Helm (Resto)
    [51244] = 60,  -- Sanctified Frost Witch's Shoulderpads (Ele)
    [51204] = 60,  -- Sanctified Frost Witch's Shoulderguards (Enh)
    [51194] = 60,  -- Sanctified Frost Witch's Spaulders (Resto)
    
    -- Warlock
    [51232] = 95,  -- Sanctified Dark Coven Hood
    [51234] = 60,  -- Sanctified Dark Coven Shoulderpads
    [51231] = 95,  -- Sanctified Dark Coven Robe
    [51233] = 60,  -- Sanctified Dark Coven Gloves
    [51230] = 95,  -- Sanctified Dark Coven Leggings
    
    -- Warrior
    [51227] = 95,  -- Sanctified Ymirjar Lord's Helmet (DPS)
    [51217] = 95,  -- Sanctified Ymirjar Lord's Greathelm (Tank)
    [51229] = 60,  -- Sanctified Ymirjar Lord's Pauldrons (DPS)
    [51219] = 60,  -- Sanctified Ymirjar Lord's Shoulderplates (Tank)
    
    -- ==================
    -- Trinkets & Misc (if available on your server)
    -- ==================
    [50356] = 60,  -- Corroded Skeleton Key
    [50355] = 60,  -- Herkuml War Token
    [50357] = 60,  -- Maghia's Misguided Quill
    [50358] = 60,  -- Purified Lunar Dust
    
    -- ==================
    -- Add your server's specific items below:
    -- Format: [itemId] = cost,
    -- ==================
    
}

-- Register Emblem of Ascension items
RegisterEmblemItems("Emblem of Ascension", ASCENSION_ITEMS)

-- ============================================================
-- Emblem of Frost Items (Retail WotLK 3.3.5)
-- ============================================================

local FROST_ITEMS = {
    -- Primordial Saronite
    [49908] = 23,  -- Primordial Saronite
    
    -- Cloaks (ilvl 264)
    [50466] = 50,  -- Sentinel's Winter Cloak (Agi)
    [50467] = 50,  -- Might of the Ocean Serpent (Str)
    [50468] = 50,  -- Drape of the Violet Tower (SP Heal)
    [50469] = 50,  -- Volde's Cloak of the Night Sky (SP Hit)
    [50470] = 50,  -- Recovered Scarlet Onslaught Cape (Tank)
    
    -- Belts (ilvl 264)
    [50991] = 60,  -- Belt of Omission (Cloth SP)
    [50989] = 60,  -- Waistband of Despair (Leather SP)
    [50987] = 60,  -- Verdigris Chain Belt (Mail SP)
    [50985] = 60,  -- Vengeful Noose (Cloth SP Hit)
    [50983] = 60,  -- Malevolent Girdle (Plate DPS)
    [50980] = 60,  -- Meteor Chaser's Raiment (Mail Agi)
    [50978] = 60,  -- Belt of the Night Sky (Cloth Heal)
    
    -- Trinkets (ilvl 264)
    [50356] = 60,  -- Corroded Skeleton Key (Tank)
    [50355] = 60,  -- Herkuml War Token (Melee DPS)
    [50357] = 60,  -- Maghia's Misguided Quill (SP)
    [50358] = 60,  -- Purified Lunar Dust (Heal MP5)
    [50359] = 60,  -- Bizuri's Totem of Shattered Ice (Ele Shaman)
    
    -- Tier 10 (ilvl 251)
    -- Death Knight
    [50096] = 95,  -- Scourgelord Helmet
    [50098] = 60,  -- Scourgelord Shoulderplates
    [50094] = 95,  -- Scourgelord Battleplate
    [50095] = 60,  -- Scourgelord Gauntlets
    [50097] = 95,  -- Scourgelord Legplates
    
    -- Druid
    [50107] = 95,  -- Lasherweave Helmet
    [50109] = 60,  -- Lasherweave Pauldrons
    [50106] = 95,  -- Lasherweave Robes
    [50108] = 60,  -- Lasherweave Gloves
    [50105] = 95,  -- Lasherweave Legplates
    
    -- Mage
    [50276] = 95,  -- Bloodmage Hood
    [50279] = 60,  -- Bloodmage Shoulderpads
    [50277] = 95,  -- Bloodmage Robe
    [50275] = 60,  -- Bloodmage Gloves
    [50278] = 95,  -- Bloodmage Leggings
    
    -- Priest (Shadow)
    [50392] = 95,  -- Crimson Acolyte Hood
    [50396] = 60,  -- Crimson Acolyte Shoulderpads
    [50394] = 95,  -- Crimson Acolyte Robe
    [50391] = 60,  -- Crimson Acolyte Gloves
    [50393] = 95,  -- Crimson Acolyte Pants
    
    -- Rogue
    [50088] = 95,  -- Shadowblade Helmet
    [50090] = 60,  -- Shadowblade Pauldrons
    [50089] = 95,  -- Shadowblade Breastplate
    [50087] = 60,  -- Shadowblade Gauntlets
    [50086] = 95,  -- Shadowblade Legplates
    
    -- Warlock
    [50241] = 95,  -- Dark Coven Hood
    [50244] = 60,  -- Dark Coven Shoulderpads
    [50242] = 95,  -- Dark Coven Robe
    [50240] = 60,  -- Dark Coven Gloves
    [50243] = 95,  -- Dark Coven Leggings
    
    -- Warrior
    [50080] = 95,  -- Ymirjar Lord's Helmet
    [50082] = 60,  -- Ymirjar Lord's Pauldrons
    [50078] = 95,  -- Ymirjar Lord's Battleplate
    [50079] = 60,  -- Ymirjar Lord's Gauntlets
    [50081] = 95,  -- Ymirjar Lord's Legplates
}

RegisterEmblemItems("Emblem of Frost", FROST_ITEMS)

-- ============================================================
-- Emblem of Triumph Items
-- ============================================================

local TRIUMPH_ITEMS = {
    -- Trophy of the Crusade
    [47242] = 75,  -- Trophy of the Crusade
    
    -- Rings (ilvl 245)
    [46044] = 35,  -- Band of the Invoker
    [46046] = 35,  -- Ring of Invincibility
    [46048] = 35,  -- Clutch of Fortification
    [47223] = 35,  -- Heartmender Circle
    [47224] = 35,  -- Bloodshed Band
    
    -- Trinkets (ilvl 245)
    [47213] = 50,  -- Abyssal Rune
    [47214] = 50,  -- Banner of Victory
    [47215] = 50,  -- Binding Stone (was Binding Light)
    [47216] = 50,  -- The Black Heart
    [47217] = 50,  -- Talisman of Resurgence
    
    -- Tier 9 (ilvl 232)
    -- Various classes...
}

RegisterEmblemItems("Emblem of Triumph", TRIUMPH_ITEMS)

-- ============================================================
-- Emblem of Conquest Items
-- ============================================================

local CONQUEST_ITEMS = {
    -- Tier 8.5 and misc items
}

RegisterEmblemItems("Emblem of Conquest", CONQUEST_ITEMS)


-- ============================================================
-- Emblem of Ascension Items
-- ============================================================

local ASCENSION_ITEMS = {
    -- Emblem of Ascension x12
    [40322] = 12, [40321] = 12, [40268] = 12, [40267] = 12, [40207] = 12, [40191] = 12, [39757] = 12, [40239] = 12, [39728] = 12,

    -- Emblem of Ascension x15
    [40433] = 15, [40375] = 15, [40370] = 15, [40108] = 15, [40107] = 15, [40080] = 15, [40075] = 15, [40074] = 15, [40378] = 15, 
    [40374] = 15, [40369] = 15, [40071] = 15, [40069] = 15, [40065] = 15, [40064] = 15, [40244] = 15, [40254] = 15, [40253] = 15, 
    [40252] = 15, [40251] = 15, [40250] = 15, [40332] = 15, [40325] = 15, [40324] = 15, [40323] = 15, [40306] = 15, [40282] = 15, 
    [40274] = 15, [40209] = 15, [40198] = 15, [40186] = 15, [39765] = 15, [39764] = 15, [39731] = 15, [39729] = 15, [39722] = 15, 
    [39702] = 15, [40330] = 15,

    -- Emblem of Ascension x19
    [40638] = 19, [40439] = 19, [40438] = 19, [40437] = 19, [40377] = 19, [40351] = 19, [40315] = 19, [40305] = 19, [40299] = 19, 
    [40289] = 19, [40288] = 19, [40286] = 19, [40185] = 19, [40063] = 19, [39725] = 19, [39719] = 19, [39704] = 19, [40334] = 19, 
    [44003] = 19, [40629] = 19, [40380] = 19, [40362] = 19, [40349] = 19, [40347] = 19, [40316] = 19, [40303] = 19, [40302] = 19, 
    [40262] = 19, [40261] = 19, [40242] = 19, [40238] = 19, [40197] = 19, [40188] = 19, [39733] = 19, [39727] = 19, [39726] = 19, 
    [39718] = 19, [39703] = 19, [44004] = 19, [40327] = 19, [40317] = 19, [40301] = 19, [40278] = 19, [40275] = 19, [40272] = 19, 
    [40271] = 19, [40263] = 19, [40260] = 19, [40259] = 19, [40241] = 19, [40205] = 19, [40200] = 19, [39762] = 19, [39759] = 19, 
    [39735] = 19, [39721] = 19, [40243] = 19, [40236] = 19, [40237] = 19, [40270] = 19, [40206] = 19, [40367] = 19, [40326] = 19, 
    [40320] = 19, [40297] = 19, [40269] = 19, [39701] = 19, [40187] = 19, [39706] = 19, [39734] = 19, [40246] = 19, [39717] = 19, 
    [40184] = 19,

    -- Emblem of Ascension x25
    [40451] = 25, [40366] = 25, [40344] = 25, [40304] = 25, [40298] = 25, [40296] = 25, [40287] = 25, [40247] = 25, [40235] = 25, 
    [39768] = 25, [39760] = 25, [39732] = 25, [39723] = 25, [40329] = 25, [40626] = 25, [40602] = 25, [40381] = 25, [40234] = 25, 
    [40062] = 25, [40453] = 25, [40365] = 25, [40319] = 25, [40283] = 25, [40279] = 25, [40277] = 25, [40249] = 25, [40210] = 25, 
    [40203] = 25, [40193] = 25, [40061] = 25, [39767] = 25, [39756] = 25, [39724] = 25, [40363] = 25, [40240] = 25, [39720] = 25, 
    [40379] = 25, [40294] = 25, [40196] = 25, [40635] = 25, [40318] = 25, [40352] = 25, [40398] = 25, [40560] = 25, [40589] = 25, 
    [40204] = 25, [39761] = 25,

    -- Emblem of Ascension x38
    [40532] = 38, [40531] = 38, [40432] = 38, [40431] = 38, [40382] = 38, [40373] = 38, [40372] = 38, [40371] = 38, [40258] = 38, 
    [40257] = 38, [40256] = 38, [40255] = 38, [40399] = 38, [40387] = 38, [40402] = 38, [40401] = 38, [40400] = 38, [40396] = 38, 
    [40395] = 38, [40388] = 38, [40386] = 38, [40385] = 38, [40384] = 38, [40383] = 38, [44007] = 38, [44006] = 38, [40562] = 38, 
    [40543] = 38, [40632] = 38, [40594] = 38, [40590] = 38, [40555] = 38, [44005] = 38, [40405] = 38, [40403] = 38, [40588] = 38, 
    [40539] = 38, [40194] = 38, [44008] = 38, [40541] = 38, [40564] = 38, [40566] = 38, [40561] = 38, [44011] = 38, [40201] = 38, 
    [40376] = 38, [40446] = 38, [40592] = 38, [40591] = 38, [40558] = 38, [40549] = 38,

    -- Emblem of Ascension x80
    [15000] = 80, [130023] = 80, [130031] = 80,
}

RegisterEmblemItems("Emblem of Ascension", ASCENSION_ITEMS)


-- ============================================================
-- Utility Functions
-- ============================================================

-- Check if an item is available from emblems
function Bistooltip_GetEmblemSource(itemId)
    if not itemId then return nil end
    return Bistooltip_emblem_items[itemId]
end

-- Calculate total emblems needed for a list of item IDs
function Bistooltip_CalculateEmblemsNeeded(itemIds)
    local totals = {}  -- currency -> { total = n, items = {} }
    
    for _, itemId in ipairs(itemIds) do
        local emblem = Bistooltip_emblem_items[itemId]
        if emblem then
            local currency = emblem.currency
            if not totals[currency] then
                totals[currency] = { total = 0, items = {} }
            end
            totals[currency].total = totals[currency].total + (emblem.cost or 0)
            table.insert(totals[currency].items, {
                id = itemId,
                cost = emblem.cost or 0,
            })
        end
    end
    
    return totals
end

-- Print emblem info for an item (useful for debugging)
function Bistooltip_PrintEmblemInfo(itemIdOrLink)
    local itemId = itemIdOrLink
    if type(itemIdOrLink) == "string" then
        itemId = tonumber(itemIdOrLink:match("item:(%d+)"))
    end
    
    if not itemId then
        print("|cffff0000Invalid item ID or link|r")
        return
    end
    
    local name = GetItemInfo(itemId)
    local emblem = Bistooltip_emblem_items[itemId]
    
    if emblem then
        print(string.format("|cffffd000%s|r (ID: %d): |cff00ff00%s x%d|r", 
            name or "Unknown", itemId, emblem.currency, emblem.cost or 0))
    else
        print(string.format("|cffffd000%s|r (ID: %d): |cffff0000Not available from emblems|r",
            name or "Unknown", itemId))
    end
end

-- Slash command to check emblem info
SLASH_BISEMBLEM1 = "/bisemblem"
SlashCmdList["BISEMBLEM"] = function(msg)
    if msg == "" then
        print("|cffffd000Bis-Tooltip Emblem Info:|r")
        print("Usage: /bisemblem [itemId or item link]")
        print("Example: /bisemblem 50356")
        return
    end
    
    Bistooltip_PrintEmblemInfo(msg)
end
