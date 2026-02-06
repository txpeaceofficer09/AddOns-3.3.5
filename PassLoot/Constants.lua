local L = LibStub("AceLocale-3.0"):GetLocale("PassLoot");
local PassLoot = LibStub("AceAddon-3.0"):GetAddon("PassLoot");

PassLoot.DefaultTemplate = {
  { "Desc", L["Temp Description"] },
  { "Loot", {  -- Choices: "de", "pass", "greed", "need", disabled is an empty table
    -- [1] = "de",
    -- [2] = "need",
    -- [3] = "greed",
  } },
};
PassLoot.FontGold = "|cffffcc00";
PassLoot.FontWhite = "|cffffffff";
PassLoot.FontRed = "|cffff0000";
PassLoot.NumRuleListLines = 6;
PassLoot.NumItemListLines = 5;
PassLoot.RuleListLineHeight = 16;
PassLoot.ItemListLineHeight = 16;
PassLoot.DebugVar = false;
PassLoot.NumFilterLines = 8;
PassLoot.FilterLineHeight = 16;
PassLoot.RollOrder = { "need", "de", "greed", "pass" };
PassLoot.RollOrderToIndex = {};
for Key, Value in pairs(PassLoot.RollOrder) do
  PassLoot.RollOrderToIndex[Value] = Key;
end
-- PassLoot.RollMsg = {
  -- ["need"] = L["Rolling need on %item% (%rule%)"],
  -- ["greed"] = L["Rolling greed on %item% (%rule%)"],
  -- ["de"] = L["Rolling disenchant on %item% (%rule%)"],
  -- ["pass"] = L["Rolling pass on %item% (%rule%)"],
  -- ["ignore"] = L["Ignoring %item% (%rule%)"],
-- };
PassLoot.RollMethod = {
  ["need"] = 1,
  ["greed"] = 2,
  ["de"] = 3,
  ["pass"] = 0,
};
