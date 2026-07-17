local L = LibStub("AceLocale-3.0"):NewLocale("PassLoot", "enUS", true);
if not L then return end
L["Active Filters"] = true
L["Active Filters_Desc"] = [=[Select a filter to modify, or shift-right-click to remove this filter
(Each filter must have at least one match)]=]
L["Add"] = true
L["Add a new rule."] = true
L["Add this filter."] = true
L["Allow Multiple Confirm Popups"] = true
L["Available Filters"] = true
L["Available Filters_Desc"] = [=[Select a filter to use.
(Each filter must have at least one match)]=]
L["Change the exception status of this filter."] = true
L["Checking this will disable the exclusive bit to allow multiple confirmation of loot roll popups"] = true
L["Checking this will prevent extra details from being displayed."] = true
L["Click to select and edit this rule."] = true
L["Default"] = true
L["Description"] = true
L["Description_Desc"] = [=[Description of this rule.
(Saves when you press enter)]=]
L["Disenchant"] = "DE"
L["Disenchant_Desc"] = "If an enchanter is present, will roll disenchant on all loot matching this rule."
L["Down"] = true
L["EXCEPTION_PREFIX"] = "! "
L["Enable / Disable this module."] = true
L["Enable Mod"] = true
L["Enable or disable this mod."] = true
L["Enabled"] = true
L["Enter the text displayed when rolling."] = [=[Enter the text displayed when rolling.
Use '%item%' for item being rolled on.
Use '%rule%' for rule that was matched.
]=]
L["Exception"] = true
L["General Options"] = true
L["Greed"] = true
L["Ignoring %item% (%rule%)"] = true
L["Menu"] = true
L["Messages"] = true
L["Module"] = true
L["Modules"] = true
L["Move selected rule down in priority."] = true
L["Move selected rule up in priority."] = true
L["Need"] = true
L["No rules matched."] = true
L["Opens the PassLoot Menu."] = true
L["Options"] = true
L["Output"] = true
L["PASSLOOT_SLASH_COMMAND"] = "passloot"
L["Pass"] = true
L["PassLoot"] = true
L["Profiles"] = true
L["Quiet"] = true
L["Remove"] = true
L["Remove selected rule."] = true
L["Remove this filter."] = true
L["Rolling disenchant on %item% (%rule%)"] = true
L["Rolling greed on %item% (%rule%)"] = true
L["Rolling is tried from left to right"] = true
L["Rolling need on %item% (%rule%)"] = true
L["Rolling pass on %item% (%rule%)"] = true
L["Rule List"] = true
L["Temp Description"] = true
L["Test"] = true
L["Test an item link to see how we would roll"] = true
L["Up"] = true
L["Will pass on all loot matching this rule."] = true
L["Will roll greed on all loot matching this rule."] = true
L["Will roll need on all loot matching this rule."] = true

local LM = LibStub("AceLocale-3.0"):NewLocale("PassLoot_Modules", "enUS", true);
LM["%class% - %spec%"] = true
LM["%type% - %subtype%"] = true
LM["%zonetype% - %instancedifficulty%"] = true
LM["10 Man Raid"] = true
LM["25 Man Raid"] = true
LM["Accessories"] = true
LM["Account"] = true
LM["Any"] = true
LM["Armor"] = true
LM["Bind On"] = true
LM["Binds On"] = true
LM["By adding the Confirm DE filter you will not get any confirmations when rolling disenchant.  This might get you into trouble with your group, are you sure?"] = true
LM["Can I Roll"] = true
LM["Class Spec"] = true
LM["Confirm BoP"] = true
LM["Confirm DE"] = true
LM["Current Spec: %spec%"] = true
LM["Equal to"] = true
LM["Equal to %num%"] = true
LM["Equip"] = true
LM["Equip Slot"] = true
LM["Equipable"] = true
LM["Exact"] = true
LM["Exact_Desc"] = [=[Checked: Item must match exactly.
Unchecked: Item must have this phrase.]=]
LM["Greater than"] = true
LM["Greater than %num%"] = true
LM["Group"] = true
LM["Group / Raid"] = true
LM["Guild Group"] = true
LM["Guild Group_Desc"] = "Selected rule will match when the group has this percentage of guild mates."
LM["Heroic"] = true
LM["Hybrid"] = true
LM["Inventory"] = true
LM["Item Level"] = true
LM["Item Name"] = true
LM["Item Price"] = true
LM["ItemLevel_DropDownTooltipDesc"] = [=[Selected rule will only match items when comparing the item level to this.
(use 'current' for your currently equipped item level)]=]
LM["Later"] = true
LM["Learned"] = true
LM["Learned Item"] = true
LM["Less than"] = true
LM["Less than %num%"] = true
LM["Loot Won"] = true
LM["Loot Won Comparison"] = true
LM["Loot Won Counter"] = true
LM["Loot Won Counter_Desc"] = [=[Set how many times we have won loot on this rule
(Saves when you press enter)]=]
LM["None"] = true
LM["Normal"] = true
LM["Not"] = true
LM["Not Equal to"] = true
LM["Not Equal to %num%"] = true
LM["Now"] = true
LM["Outside"] = true
LM["Pickup"] = true
LM["Player Name"] = true
LM["Quality"] = true
LM["Raid"] = true
LM["Required Level"] = true
LM["RequiredLevel_DropDownTooltipDesc"] = [=[Selected rule will only match items when comparing the required level to this.
(Use 'level' for your current level)]=]
LM["Reset Counters On Join"] = true
LM["Reset Counters On Join_Desc"] = [=[Checking this will reset counters on joining a group or raid.
Shift-click to reset all current counters.]=]
LM["Selected rule will match on item names."] = true
LM["Selected rule will match on player names."] = true
LM["Selected rule will only match if you are in a group or raid."] = true
LM["Selected rule will only match if you can roll this."] = true
LM["Selected rule will only match items that are equipable."] = true
LM["Selected rule will only match items when compared to vendor value."] = true
LM["Selected rule will only match items when comparing already aquired inventory to this."] = true
LM["Selected rule will only match items when comparing the item level to this."] = true
LM["Selected rule will only match items when comparing the loot won counter to this."] = true
LM["Selected rule will only match items when comparing the required level to this."] = true
LM["Selected rule will only match items when you are in this type of zone."] = true
LM["Selected rule will only match items when you are this class and spec."] = true
LM["Selected rule will only match items with this equip slot."] = true
LM["Selected rule will only match items with this type and subtype."] = true
LM["Selected rule will only match these items."] = true
LM["Selected rule will only match this quality of items."] = true
LM["Selected rule will only match usable items."] = true
LM["Temp Item Name"] = true
LM["Temp Name"] = true
LM["Temp Zone Name"] = true
LM["Type / SubType"] = true
LM["Unique"] = true
LM["Unique_Desc"] = [=[Selected rule will only match items that are unique.
This includes items which have a unique stack higher than 1, such as battleground tokens, as well as items which are Unique-Equip.]=]
LM["Unlearned"] = true
LM["Unusable"] = true
LM["Usable"] = true
LM["Use"] = true
LM["Weapons"] = true
LM["Will click yes on BoP dialogues."] = true
LM["Will click yes on Disenchant dialogues."] = true
LM["Will confirm bind!"] = true
LM["Will confirm disenchant!"] = true
LM["Zone Name"] = true
LM["Zone Name_Desc"] = [=[Zone name to match selected rule to, leave empty to match any zone.
(Saves when you press enter)
Shift-right-click to fill with current zone name]=]
LM["Zone Type"] = true
LM["current"] = true
LM["level"] = true

