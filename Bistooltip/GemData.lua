-- ============================================================
-- GemData.lua - Hardcoded gem stat display mappings
-- ============================================================
-- Maps gem names (lowercase) to stat display strings

Bistooltip_gem_stats = {

    -- ============================================================
    -- META GEMS
    -- ============================================================
    ["chaotic skyflare diamond"] = "21 Crit / 3% Crit Dmg",
    ["relentless earthsiege diamond"] = "21 AGI / 3% Crit Dmg",
    ["austere earthsiege diamond"] = "32 STAM / 2% Armor",
    ["insightful earthsiege diamond"] = "21 INT / Mana Proc",
    ["revitalizing skyflare diamond"] = "11 MP5 / 3% Crit Heal",
    ["ember skyflare diamond"] = "25 SP / 2% INT",
    ["eternal earthsiege diamond"] = "21 Def / 5% Block Val",
    ["trenchant earthsiege diamond"] = "25 SP / -10% Stun",
    ["forlorn skyflare diamond"] = "25 SP / -10% Silence",
    ["enigmatic skyflare diamond"] = "21 Crit / -10% Snare",
    ["destructive skyflare diamond"] = "25 Crit / 1% Reflect",
    ["thundering skyflare diamond"] = "Haste Proc",
    ["beaming earthsiege diamond"] = "21 Crit / 2% Mana",
    ["bracing earthsiege diamond"] = "25 SP / 2% Threat",
    ["tireless skyflare diamond"] = "25 SP / -10% Snare",
    ["persistent earthsiege diamond"] = "21 Crit / -10% Stun",
    ["powerful earthsiege diamond"] = "32 STAM / -10% Stun",
    ["swift skyflare diamond"] = "21 Crit / 10% Mount",
    ["impassive skyflare diamond"] = "21 Crit / -10% Fear",
    ["effulgent skyflare diamond"] = "32 STAM / 2% Spell Dmg",

    -- ============================================================
    -- RED GEMS (Strength, Agility, Spell Power, Attack Power, Armor Pen, Expertise, Parry)
    -- ============================================================
    
    -- Bold (Strength)
    ["bold scarlet ruby"] = "16 STR",
    ["bold cardinal ruby"] = "20 STR",
    ["bold bloodstone"] = "12 STR",
    ["bold living ruby"] = "8 STR",
    
    -- Delicate (Agility)
    ["delicate scarlet ruby"] = "16 AGI",
    ["delicate cardinal ruby"] = "20 AGI",
    ["delicate bloodstone"] = "12 AGI",
    ["delicate living ruby"] = "8 AGI",
    
    -- Runed (Spell Power)
    ["runed scarlet ruby"] = "19 SP",
    ["runed cardinal ruby"] = "23 SP",
    ["runed bloodstone"] = "14 SP",
    ["runed living ruby"] = "9 SP",
    
    -- Bright (Attack Power)
    ["bright scarlet ruby"] = "32 AP",
    ["bright cardinal ruby"] = "40 AP",
    ["bright bloodstone"] = "24 AP",
    ["bright living ruby"] = "16 AP",
    
    -- Fractured (Armor Penetration)
    ["fractured scarlet ruby"] = "16 ArP",
    ["fractured cardinal ruby"] = "20 ArP",
    ["fractured bloodstone"] = "12 ArP",
    
    -- Precise (Expertise)
    ["precise scarlet ruby"] = "16 Exp",
    ["precise cardinal ruby"] = "20 Exp",
    ["precise bloodstone"] = "12 Exp",
    
    -- Flashing (Parry)
    ["flashing scarlet ruby"] = "16 Parry",
    ["flashing cardinal ruby"] = "20 Parry",
    ["flashing bloodstone"] = "12 Parry",

    -- ============================================================
    -- YELLOW GEMS (Intellect, Hit, Crit, Haste, Defense, Resilience)
    -- ============================================================
    
    -- Brilliant (Intellect)
    ["brilliant autumn's glow"] = "16 INT",
    ["brilliant king's amber"] = "20 INT",
    ["brilliant sun crystal"] = "12 INT",
    ["brilliant dawnstone"] = "8 INT",
    
    -- Rigid (Hit)
    ["rigid autumn's glow"] = "16 Hit",
    ["rigid king's amber"] = "20 Hit",
    ["rigid sun crystal"] = "12 Hit",
    ["rigid dawnstone"] = "8 Hit",
    
    -- Smooth (Crit)
    ["smooth autumn's glow"] = "16 Crit",
    ["smooth king's amber"] = "20 Crit",
    ["smooth sun crystal"] = "12 Crit",
    ["smooth dawnstone"] = "8 Crit",
    
    -- Quick (Haste)
    ["quick autumn's glow"] = "16 Haste",
    ["quick king's amber"] = "20 Haste",
    ["quick sun crystal"] = "12 Haste",
    ["quick dawnstone"] = "8 Haste",
    
    -- Thick (Defense)
    ["thick autumn's glow"] = "16 Def",
    ["thick king's amber"] = "20 Def",
    ["thick sun crystal"] = "12 Def",
    ["thick dawnstone"] = "8 Def",
    
    -- Mystic (Resilience)
    ["mystic autumn's glow"] = "16 Resi",
    ["mystic king's amber"] = "20 Resi",
    ["mystic sun crystal"] = "12 Resi",
    ["mystic dawnstone"] = "8 Resi",

    -- ============================================================
    -- BLUE GEMS (Stamina, Spirit, Spell Penetration)
    -- ============================================================
    
    -- Solid (Stamina)
    ["solid sky sapphire"] = "24 STAM",
    ["solid majestic zircon"] = "30 STAM",
    ["solid chalcedony"] = "18 STAM",
    ["solid star of elune"] = "12 STAM",
    
    -- Sparkling (Spirit)
    ["sparkling sky sapphire"] = "16 SPI",
    ["sparkling majestic zircon"] = "20 SPI",
    ["sparkling chalcedony"] = "12 SPI",
    ["sparkling star of elune"] = "8 SPI",
    
    -- Stormy (Spell Penetration)
    ["stormy sky sapphire"] = "20 SpPen",
    ["stormy majestic zircon"] = "25 SpPen",
    ["stormy chalcedony"] = "15 SpPen",

    -- ============================================================
    -- ORANGE GEMS (Red + Yellow)
    -- ============================================================
    
    -- Inscribed (STR + Crit)
    ["inscribed monarch topaz"] = "8 STR / 8 Crit",
    ["inscribed ametrine"] = "10 STR / 10 Crit",
    ["inscribed huge citrine"] = "6 STR / 6 Crit",
    
    -- Etched (STR + Hit)
    ["etched monarch topaz"] = "8 STR / 8 Hit",
    ["etched ametrine"] = "10 STR / 10 Hit",
    ["etched huge citrine"] = "6 STR / 6 Hit",
    
    -- Champion's (STR + Def)
    ["champion's monarch topaz"] = "8 STR / 8 Def",
    ["champion's ametrine"] = "10 STR / 10 Def",
    ["champion's huge citrine"] = "6 STR / 6 Def",
    
    -- Fierce (STR + Haste)
    ["fierce monarch topaz"] = "8 STR / 8 Haste",
    ["fierce ametrine"] = "10 STR / 10 Haste",
    ["fierce huge citrine"] = "6 STR / 6 Haste",
    
    -- Deadly (AGI + Crit)
    ["deadly monarch topaz"] = "8 AGI / 8 Crit",
    ["deadly ametrine"] = "10 AGI / 10 Crit",
    ["deadly huge citrine"] = "6 AGI / 6 Crit",
    
    -- Deft (AGI + Haste)
    ["deft monarch topaz"] = "8 AGI / 8 Haste",
    ["deft ametrine"] = "10 AGI / 10 Haste",
    ["deft huge citrine"] = "6 AGI / 6 Haste",
    
    -- Glinting (AGI + Hit)
    ["glinting monarch topaz"] = "8 AGI / 8 Hit",
    ["glinting ametrine"] = "10 AGI / 10 Hit",
    ["glinting huge citrine"] = "6 AGI / 6 Hit",
    
    -- Potent (SP + Crit)
    ["potent monarch topaz"] = "9 SP / 8 Crit",
    ["potent ametrine"] = "12 SP / 10 Crit",
    ["potent huge citrine"] = "7 SP / 6 Crit",
    
    -- Reckless (SP + Haste)
    ["reckless monarch topaz"] = "9 SP / 8 Haste",
    ["reckless ametrine"] = "12 SP / 10 Haste",
    ["reckless huge citrine"] = "7 SP / 6 Haste",
    
    -- Veiled (SP + Hit)
    ["veiled monarch topaz"] = "9 SP / 8 Hit",
    ["veiled ametrine"] = "12 SP / 10 Hit",
    ["veiled huge citrine"] = "7 SP / 6 Hit",
    
    -- Luminous (SP + INT)
    ["luminous monarch topaz"] = "9 SP / 8 INT",
    ["luminous ametrine"] = "12 SP / 10 INT",
    ["luminous huge citrine"] = "7 SP / 6 INT",
    
    -- Resplendent (STR + Resi) - PvP
    ["resplendent monarch topaz"] = "8 STR / 8 Resi",
    ["resplendent ametrine"] = "10 STR / 10 Resi",
    
    -- Lucent (AGI + Resi) - PvP
    ["lucent monarch topaz"] = "8 AGI / 8 Resi",
    ["lucent ametrine"] = "10 AGI / 10 Resi",
    
    -- Durable (SP + Resi) - PvP
    ["durable monarch topaz"] = "9 SP / 8 Resi",
    ["durable ametrine"] = "12 SP / 10 Resi",
    
    -- Wicked (AP + Crit)
    ["wicked monarch topaz"] = "16 AP / 8 Crit",
    ["wicked ametrine"] = "20 AP / 10 Crit",
    
    -- Stark (AP + Hit) - Legacy name
    ["stark monarch topaz"] = "16 AP / 8 Hit",
    ["stark ametrine"] = "20 AP / 10 Hit",
    
    -- Accurate (Exp + Hit)
    ["accurate monarch topaz"] = "8 Exp / 8 Hit",
    ["accurate ametrine"] = "10 Exp / 10 Hit",

    -- ============================================================
    -- PURPLE GEMS (Red + Blue)
    -- ============================================================
    
    -- Sovereign (STR + STAM)
    ["sovereign twilight opal"] = "8 STR / 12 STAM",
    ["sovereign dreadstone"] = "10 STR / 15 STAM",
    ["sovereign shadow crystal"] = "6 STR / 9 STAM",
    
    -- Shifting (AGI + STAM)
    ["shifting twilight opal"] = "8 AGI / 12 STAM",
    ["shifting dreadstone"] = "10 AGI / 15 STAM",
    ["shifting shadow crystal"] = "6 AGI / 9 STAM",
    
    -- Glowing (SP + STAM)
    ["glowing twilight opal"] = "9 SP / 12 STAM",
    ["glowing dreadstone"] = "12 SP / 15 STAM",
    ["glowing shadow crystal"] = "7 SP / 9 STAM",
    
    -- Purified (SP + SPI)
    ["purified twilight opal"] = "9 SP / 8 SPI",
    ["purified dreadstone"] = "12 SP / 10 SPI",
    ["purified shadow crystal"] = "7 SP / 6 SPI",
    
    -- Royal (SP + MP5)
    ["royal twilight opal"] = "9 SP / 4 MP5",
    ["royal dreadstone"] = "12 SP / 5 MP5",
    ["royal shadow crystal"] = "7 SP / 3 MP5",
    
    -- Guardian's (Exp + STAM)
    ["guardian's twilight opal"] = "8 Exp / 12 STAM",
    ["guardian's dreadstone"] = "10 Exp / 15 STAM",
    ["guardian's shadow crystal"] = "6 Exp / 9 STAM",
    
    -- Defender's (Parry + STAM)
    ["defender's twilight opal"] = "8 Parry / 12 STAM",
    ["defender's dreadstone"] = "10 Parry / 15 STAM",
    ["defender's shadow crystal"] = "6 Parry / 9 STAM",
    
    -- Infused (AP + MP5)
    ["infused twilight opal"] = "16 AP / 4 MP5",
    ["infused dreadstone"] = "20 AP / 5 MP5",
    
    -- Balanced (AP + STAM)
    ["balanced twilight opal"] = "16 AP / 12 STAM",
    ["balanced dreadstone"] = "20 AP / 15 STAM",
    
    -- Mysterious (SP + SpPen)
    ["mysterious twilight opal"] = "9 SP / 10 SpPen",
    ["mysterious dreadstone"] = "12 SP / 13 SpPen",
    
    -- Puissant (ArP + STAM)
    ["puissant twilight opal"] = "8 ArP / 12 STAM",
    ["puissant dreadstone"] = "10 ArP / 15 STAM",

    -- ============================================================
    -- GREEN GEMS (Yellow + Blue)
    -- ============================================================
    
    -- Jagged (Crit + STAM)
    ["jagged forest emerald"] = "8 Crit / 12 STAM",
    ["jagged eye of zul"] = "10 Crit / 15 STAM",
    ["jagged dark jade"] = "6 Crit / 9 STAM",
    
    -- Vivid (Hit + STAM)
    ["vivid forest emerald"] = "8 Hit / 12 STAM",
    ["vivid eye of zul"] = "10 Hit / 15 STAM",
    ["vivid dark jade"] = "6 Hit / 9 STAM",
    
    -- Enduring (Def + STAM)
    ["enduring forest emerald"] = "8 Def / 12 STAM",
    ["enduring eye of zul"] = "10 Def / 15 STAM",
    ["enduring dark jade"] = "6 Def / 9 STAM",
    
    -- Steady (Resi + STAM)
    ["steady forest emerald"] = "8 Resi / 12 STAM",
    ["steady eye of zul"] = "10 Resi / 15 STAM",
    ["steady dark jade"] = "6 Resi / 9 STAM",
    
    -- Seer's (INT + SPI)
    ["seer's forest emerald"] = "8 INT / 8 SPI",
    ["seer's eye of zul"] = "10 INT / 10 SPI",
    ["seer's dark jade"] = "6 INT / 6 SPI",
    
    -- Dazzling (INT + MP5)
    ["dazzling forest emerald"] = "8 INT / 4 MP5",
    ["dazzling eye of zul"] = "10 INT / 5 MP5",
    ["dazzling dark jade"] = "6 INT / 3 MP5",
    
    -- Forceful (Haste + STAM)
    ["forceful forest emerald"] = "8 Haste / 12 STAM",
    ["forceful eye of zul"] = "10 Haste / 15 STAM",
    ["forceful dark jade"] = "6 Haste / 9 STAM",
    
    -- Lightning (Haste + INT)
    ["lightning forest emerald"] = "8 Haste / 8 INT",
    ["lightning eye of zul"] = "10 Haste / 10 INT",
    
    -- Energized (Haste + MP5)
    ["energized forest emerald"] = "8 Haste / 4 MP5",
    ["energized eye of zul"] = "10 Haste / 5 MP5",
    
    -- Turbid (Resi + SPI)
    ["turbid forest emerald"] = "8 Resi / 8 SPI",
    ["turbid eye of zul"] = "10 Resi / 10 SPI",
    
    -- Misty (Crit + SPI)
    ["misty forest emerald"] = "8 Crit / 8 SPI",
    ["misty eye of zul"] = "10 Crit / 10 SPI",
    
    -- Radiant (Crit + SpPen)
    ["radiant forest emerald"] = "8 Crit / 10 SpPen",
    ["radiant eye of zul"] = "10 Crit / 13 SpPen",
    
    -- Shattered (Haste + SpPen)
    ["shattered forest emerald"] = "8 Haste / 10 SpPen",
    ["shattered eye of zul"] = "10 Haste / 13 SpPen",
    
    -- Sundered (Crit + MP5)
    ["sundered forest emerald"] = "8 Crit / 4 MP5",
    ["sundered eye of zul"] = "10 Crit / 5 MP5",

    -- ============================================================
    -- PRISMATIC / SPECIAL
    -- ============================================================
    ["nightmare tear"] = "10 All Stats",
    ["enchanted tear"] = "6 All Stats",
    ["enchanted pearl"] = "4 All Stats",
}

-- ============================================================
-- Lookup function
-- ============================================================

function Bistooltip_GetGemStats(gemName)
    if not gemName then return nil end
    local key = string.lower(gemName)
    return Bistooltip_gem_stats[key]
end

-- ============================================================
-- Get gem display for an item ID
-- ============================================================

function Bistooltip_GetGemStatsByItemId(itemId)
    if not itemId or itemId <= 0 then return nil end
    local name = GetItemInfo(itemId)
    if not name then return nil end
    return Bistooltip_GetGemStats(name)
end
