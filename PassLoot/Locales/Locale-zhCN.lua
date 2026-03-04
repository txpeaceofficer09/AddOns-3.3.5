local L = LibStub("AceLocale-3.0"):NewLocale("PassLoot", "zhCN", false);
if not L then return end
-- L["Active Filters"] = "Active Filters"
--[==[ L["Active Filters_Desc"] = [=[Select a filter to modify, or shift-right-click to remove this filter
(Each filter must have at least one match)]=] ]==]
L["Add"] = "新增" -- Needs review
L["Add a new rule."] = "新增一个规则组" -- Needs review
-- L["Add this filter."] = "Add this filter."
-- L["Allow Multiple Confirm Popups"] = "Allow Multiple Confirm Popups"
-- L["Available Filters"] = "Available Filters"
--[==[ L["Available Filters_Desc"] = [=[Select a filter to use.
(Each filter must have at least one match)]=] ]==]
-- L["Change the exception status of this filter."] = "Change the exception status of this filter."
-- L["Checking this will disable the exclusive bit to allow multiple confirmation of loot roll popups"] = "Checking this will disable the exclusive bit to allow multiple confirmation of loot roll popups"
L["Checking this will prevent extra details from being displayed."] = "选择该项可以阻止额外的细节信息显示。" -- Needs review
L["Click to select and edit this rule."] = "点击选择并编辑这条规则" -- Needs review
L["Default"] = "默认" -- Needs review
L["Description"] = "描述" -- Needs review
L["Description_Desc"] = [=[规则的描述
(只有按下回车后才会保存)]=] -- Needs review
-- L["Disenchant"] = "DE"
-- L["Disenchant_Desc"] = "If an enchanter is present, will roll disenchant on all loot matching this rule."
L["Down"] = "下移" -- Needs review
-- L["EXCEPTION_PREFIX"] = "! "
-- L["Enable / Disable this module."] = "Enable / Disable this module."
L["Enable Mod"] = "启用插件" -- Needs review
L["Enable or disable this mod."] = "开启或者关闭本插件" -- Needs review
-- L["Enabled"] = "Enabled"
--[==[ L["Enter the text displayed when rolling."] = [=[Enter the text displayed when rolling.
Use '%item%' for item being rolled on.
Use '%rule%' for rule that was matched.
]=] ]==]
-- L["Exception"] = "Exception"
-- L["General Options"] = "General Options"
L["Greed"] = "贪婪" -- Needs review
L["Ignoring %item% (%rule%)"] = "忽略 %item% (%rule%)"
-- L["Menu"] = "Menu"
-- L["Messages"] = "Messages"
-- L["Module"] = "Module"
-- L["Modules"] = "Modules"
L["Move selected rule down in priority."] = "降低选定的规则优先权" -- Needs review
L["Move selected rule up in priority."] = "提高选定的规则优先权" -- Needs review
L["Need"] = "需求" -- Needs review
-- L["No rules matched."] = "No rules matched."
L["Opens the PassLoot Menu."] = "打开PassLoot菜单"
L["Options"] = "选项"
-- L["Output"] = "Output"
-- L["PASSLOOT_SLASH_COMMAND"] = "passloot"
L["Pass"] = "放弃"
-- L["PassLoot"] = "PassLoot"
L["Profiles"] = "档案"
L["Quiet"] = "安静" -- Needs review
L["Remove"] = "移除" -- Needs review
L["Remove selected rule."] = "移除选定的规则组" -- Needs review
L["Remove this filter."] = "移除这个过滤配置"
-- L["Rolling disenchant on %item% (%rule%)"] = "Rolling disenchant on %item% (%rule%)"
-- L["Rolling greed on %item% (%rule%)"] = "Rolling greed on %item% (%rule%)"
-- L["Rolling is tried from left to right"] = "Rolling is tried from left to right"
-- L["Rolling need on %item% (%rule%)"] = "Rolling need on %item% (%rule%)"
-- L["Rolling pass on %item% (%rule%)"] = "Rolling pass on %item% (%rule%)"
L["Rule List"] = "规则列表" -- Needs review
L["Temp Description"] = "临时描述"
-- L["Test"] = "Test"
-- L["Test an item link to see how we would roll"] = "Test an item link to see how we would roll"
L["Up"] = "上移" -- Needs review
L["Will pass on all loot matching this rule."] = "放弃所有符合本规则的掉落"
L["Will roll greed on all loot matching this rule."] = "贪婪所有符合本规则的掉落"
L["Will roll need on all loot matching this rule."] = "所有符合本规则的Loot都需求" -- Needs review

local LM = LibStub("AceLocale-3.0"):NewLocale("PassLoot_Modules", "zhCN", false);
-- LM["%class% - %spec%"] = "%class% - %spec%"
LM["%type% - %subtype%"] = "%type% - %subtype%" -- Needs review
LM["%zonetype% - %instancedifficulty%"] = "%zonetype% - %instancedifficulty%" -- Needs review
-- LM["10 Man Raid"] = "10 Man Raid"
-- LM["25 Man Raid"] = "25 Man Raid"
LM["Accessories"] = "附件" -- Needs review
-- LM["Account"] = "Account"
LM["Any"] = "任何" -- Needs review
LM["Armor"] = "护甲" -- Needs review
LM["Bind On"] = "绑定于" -- Needs review
-- LM["Binds On"] = "Binds On"
-- LM["By adding the Confirm DE filter you will not get any confirmations when rolling disenchant.  This might get you into trouble with your group, are you sure?"] = "By adding the Confirm DE filter you will not get any confirmations when rolling disenchant.  This might get you into trouble with your group, are you sure?"
-- LM["Can I Roll"] = "Can I Roll"
-- LM["Class Spec"] = "Class Spec"
-- LM["Confirm BoP"] = "Confirm BoP"
-- LM["Confirm DE"] = "Confirm DE"
-- LM["Current Spec: %spec%"] = "Current Spec: %spec%"
-- LM["Equal to"] = "Equal to"
-- LM["Equal to %num%"] = "Equal to %num%"
LM["Equip"] = "装备" -- Needs review
LM["Equip Slot"] = "装备位置" -- Needs review
-- LM["Equipable"] = "Equipable"
LM["Exact"] = "精确" -- Needs review
LM["Exact_Desc"] = [=[勾选: 物品必须完全符合
不选: 物品必须包含这个文字]=] -- Needs review
-- LM["Greater than"] = "Greater than"
-- LM["Greater than %num%"] = "Greater than %num%"
-- LM["Group"] = "Group"
-- LM["Group / Raid"] = "Group / Raid"
-- LM["Guild Group"] = "Guild Group"
-- LM["Guild Group_Desc"] = "Selected rule will match when the group has this percentage of guild mates."
-- LM["Heroic"] = "Heroic"
-- LM["Hybrid"] = "Hybrid"
-- LM["Inventory"] = "Inventory"
-- LM["Item Level"] = "Item Level"
-- LM["Item Name"] = "Item Name"
-- LM["Item Price"] = "Item Price"
--[==[ LM["ItemLevel_DropDownTooltipDesc"] = [=[Selected rule will only match items when comparing the item level to this.
(use 'current' for your currently equipped item level)]=] ]==]
-- LM["Later"] = "Later"
-- LM["Learned"] = "Learned"
-- LM["Learned Item"] = "Learned Item"
-- LM["Less than"] = "Less than"
-- LM["Less than %num%"] = "Less than %num%"
-- LM["Loot Won"] = "Loot Won"
-- LM["Loot Won Comparison"] = "Loot Won Comparison"
-- LM["Loot Won Counter"] = "Loot Won Counter"
--[==[ LM["Loot Won Counter_Desc"] = [=[Set how many times we have won loot on this rule
(Saves when you press enter)]=] ]==]
LM["None"] = "无" -- Needs review
-- LM["Normal"] = "Normal"
LM["Not"] = "非" -- Needs review
-- LM["Not Equal to"] = "Not Equal to"
-- LM["Not Equal to %num%"] = "Not Equal to %num%"
-- LM["Now"] = "Now"
-- LM["Outside"] = "Outside"
LM["Pickup"] = "拾取" -- Needs review
LM["Player Name"] = "玩家姓名"
LM["Quality"] = "质量" -- Needs review
-- LM["Raid"] = "Raid"
LM["Required Level"] = "需要等级"
--[==[ LM["RequiredLevel_DropDownTooltipDesc"] = [=[Selected rule will only match items when comparing the required level to this.
(Use 'level' for your current level)]=] ]==]
-- LM["Reset Counters On Join"] = "Reset Counters On Join"
--[==[ LM["Reset Counters On Join_Desc"] = [=[Checking this will reset counters on joining a group or raid.
Shift-click to reset all current counters.]=] ]==]
-- LM["Selected rule will match on item names."] = "Selected rule will match on item names."
-- LM["Selected rule will match on player names."] = "Selected rule will match on player names."
-- LM["Selected rule will only match if you are in a group or raid."] = "Selected rule will only match if you are in a group or raid."
-- LM["Selected rule will only match if you can roll this."] = "Selected rule will only match if you can roll this."
-- LM["Selected rule will only match items that are equipable."] = "Selected rule will only match items that are equipable."
-- LM["Selected rule will only match items when compared to vendor value."] = "Selected rule will only match items when compared to vendor value."
-- LM["Selected rule will only match items when comparing already aquired inventory to this."] = "Selected rule will only match items when comparing already aquired inventory to this."
-- LM["Selected rule will only match items when comparing the item level to this."] = "Selected rule will only match items when comparing the item level to this."
-- LM["Selected rule will only match items when comparing the loot won counter to this."] = "Selected rule will only match items when comparing the loot won counter to this."
-- LM["Selected rule will only match items when comparing the required level to this."] = "Selected rule will only match items when comparing the required level to this."
-- LM["Selected rule will only match items when you are in this type of zone."] = "Selected rule will only match items when you are in this type of zone."
-- LM["Selected rule will only match items when you are this class and spec."] = "Selected rule will only match items when you are this class and spec."
LM["Selected rule will only match items with this equip slot."] = "选定的规则将只匹配符合这个装备位置的物品。" -- Needs review
LM["Selected rule will only match items with this type and subtype."] = "选定的规则将只匹配符合这个类型的物品。" -- Needs review
LM["Selected rule will only match these items."] = "选定的规则将只匹配于这些物品" -- Needs review
LM["Selected rule will only match this quality of items."] = "选定的规则将只匹配符合该质量的物品" -- Needs review
-- LM["Selected rule will only match usable items."] = "Selected rule will only match usable items."
LM["Temp Item Name"] = "临时物品名"
-- LM["Temp Name"] = "Temp Name"
-- LM["Temp Zone Name"] = "Temp Zone Name"
LM["Type / SubType"] = "类型" -- Needs review
LM["Unique"] = "唯一" -- Needs review
LM["Unique_Desc"] = [=[选定的规则将只匹配标有唯一的物品。
这也包含了唯一数量大于1的物品，例如战场奖章，还包括了装备唯一的物品。]=] -- Needs review
-- LM["Unlearned"] = "Unlearned"
-- LM["Unusable"] = "Unusable"
-- LM["Usable"] = "Usable"
LM["Use"] = "使用" -- Needs review
LM["Weapons"] = "武器" -- Needs review
LM["Will click yes on BoP dialogues."] = "将在拾取绑定对话框中点击是"
LM["Will click yes on Disenchant dialogues."] = "将在分解对话框中点击是"
LM["Will confirm bind!"] = "将确认绑定！"
LM["Will confirm disenchant!"] = "将确认分解！"
LM["Zone Name"] = "区域" -- Needs review
LM["Zone Name_Desc"] = [=[选定规则所匹配的区域，留空将匹配所有区域
(只有按下回车后才会保存)]=] -- Needs review
-- LM["Zone Type"] = "Zone Type"
-- LM["current"] = "current"
-- LM["level"] = "level"

