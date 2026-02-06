local L = LibStub("AceLocale-3.0"):NewLocale("PassLoot", "ruRU", false);
if not L then return end
L["Active Filters"] = "Активные фильтры" -- Needs review
L["Active Filters_Desc"] = [=[Выберите фильтр для редактирования, или нажмите shift-правый-клик чтобы удалить его
(Каждый фильтр должен иметь по крайней мере одино совпадение)]=] -- Needs review
L["Add"] = "Добавить" -- Needs review
L["Add a new rule."] = "Добавить новое правило." -- Needs review
L["Add this filter."] = "Добавить данный фильтр." -- Needs review
-- L["Allow Multiple Confirm Popups"] = "Allow Multiple Confirm Popups"
L["Available Filters"] = "Опции фильтра" -- Needs review
L["Available Filters_Desc"] = [=[Выберите фильтр для использования.
(Каждый фильтр должен иметь по крайней мере одино совпадение)]=] -- Needs review
-- L["Change the exception status of this filter."] = "Change the exception status of this filter."
-- L["Checking this will disable the exclusive bit to allow multiple confirmation of loot roll popups"] = "Checking this will disable the exclusive bit to allow multiple confirmation of loot roll popups"
L["Checking this will prevent extra details from being displayed."] = "Предотвращает отображение дополнительных деталей." -- Needs review
L["Click to select and edit this rule."] = "Кликните для выбора и редактирования этого правила." -- Needs review
L["Default"] = "Профиль по умолчанию"
L["Description"] = "Описание" -- Needs review
L["Description_Desc"] = [=[Описание этого правила.
(Сохранится при нажатии Enter)]=] -- Needs review
-- L["Disenchant"] = "DE"
-- L["Disenchant_Desc"] = "If an enchanter is present, will roll disenchant on all loot matching this rule."
L["Down"] = "Вниз" -- Needs review
-- L["EXCEPTION_PREFIX"] = "! "
L["Enable / Disable this module."] = "Включить / отключить этот модуль." -- Needs review
L["Enable Mod"] = "Включить мод." -- Needs review
L["Enable or disable this mod."] = "Включить или отключить данный мод." -- Needs review
-- L["Enabled"] = "Enabled"
--[==[ L["Enter the text displayed when rolling."] = [=[Enter the text displayed when rolling.
Use '%item%' for item being rolled on.
Use '%rule%' for rule that was matched.
]=] ]==]
-- L["Exception"] = "Exception"
L["General Options"] = "Основные настройки"
L["Greed"] = "Не откажусь" -- Needs review
L["Ignoring %item% (%rule%)"] = "Игнорирование %item% (%rule%)" -- Needs review
L["Menu"] = "Меню"
-- L["Messages"] = "Messages"
L["Module"] = "Модуль" -- Needs review
L["Modules"] = "Модули" -- Needs review
L["Move selected rule down in priority."] = "Переместить выбранное правило вниз по приоритету." -- Needs review
L["Move selected rule up in priority."] = "Переместить выбранное правило вверх по приоритету." -- Needs review
L["Need"] = "Нужно" -- Needs review
-- L["No rules matched."] = "No rules matched."
L["Opens the PassLoot Menu."] = "Открывает меню PassLoot."
L["Options"] = "Настройки"
L["Output"] = "Вывод"
L["PASSLOOT_SLASH_COMMAND"] = "passloot"
L["Pass"] = "Отказаться" -- Needs review
L["PassLoot"] = "PassLoot"
L["Profiles"] = "Профили"
L["Quiet"] = "Тихий" -- Needs review
L["Remove"] = "Удалить" -- Needs review
L["Remove selected rule."] = "удалить выбранное правило." -- Needs review
L["Remove this filter."] = "Удалить данный фильтр." -- Needs review
L["Rolling disenchant on %item% (%rule%)"] = "Разыгрывается распыление %item% (%rule%)"
-- L["Rolling greed on %item% (%rule%)"] = "Rolling greed on %item% (%rule%)"
-- L["Rolling is tried from left to right"] = "Rolling is tried from left to right"
-- L["Rolling need on %item% (%rule%)"] = "Rolling need on %item% (%rule%)"
-- L["Rolling pass on %item% (%rule%)"] = "Rolling pass on %item% (%rule%)"
L["Rule List"] = "Список правил" -- Needs review
L["Temp Description"] = "Временное описание"
-- L["Test"] = "Test"
-- L["Test an item link to see how we would roll"] = "Test an item link to see how we would roll"
L["Up"] = "Вверх" -- Needs review
L["Will pass on all loot matching this rule."] = "Отказаться от всей добычи соответствующей этому правилу." -- Needs review
L["Will roll greed on all loot matching this rule."] = "Выбирать \\\"Не откажусь\\\" на всю добычу соответствующию этому правилу." -- Needs review
L["Will roll need on all loot matching this rule."] = "Выбирать \\\"Нужно\\\" на всю добычу соответствующию этому правилу." -- Needs review

local LM = LibStub("AceLocale-3.0"):NewLocale("PassLoot_Modules", "ruRU", false);
-- LM["%class% - %spec%"] = "%class% - %spec%"
-- LM["%type% - %subtype%"] = "%type% - %subtype%"
-- LM["%zonetype% - %instancedifficulty%"] = "%zonetype% - %instancedifficulty%"
LM["10 Man Raid"] = "Рейд 10"
LM["25 Man Raid"] = "Рейд 25"
LM["Accessories"] = "Аксессуары" -- Needs review
LM["Account"] = "Учетная запись" -- Needs review
LM["Any"] = "Любой"
LM["Armor"] = "Доспехи"
LM["Bind On"] = "Персональным при" -- Needs review
LM["Binds On"] = "Персональным при" -- Needs review
-- LM["By adding the Confirm DE filter you will not get any confirmations when rolling disenchant.  This might get you into trouble with your group, are you sure?"] = "By adding the Confirm DE filter you will not get any confirmations when rolling disenchant.  This might get you into trouble with your group, are you sure?"
-- LM["Can I Roll"] = "Can I Roll"
-- LM["Class Spec"] = "Class Spec"
-- LM["Confirm BoP"] = "Confirm BoP"
-- LM["Confirm DE"] = "Confirm DE"
-- LM["Current Spec: %spec%"] = "Current Spec: %spec%"
LM["Equal to"] = "Равное:"
LM["Equal to %num%"] = "Равное: %num%"
LM["Equip"] = "Персональное при надевании" -- Needs review
LM["Equip Slot"] = "Ячейка на персонаже" -- Needs review
-- LM["Equipable"] = "Equipable"
-- LM["Exact"] = "Exact"
--[==[ LM["Exact_Desc"] = [=[Checked: Item must match exactly.
Unchecked: Item must have this phrase.]=] ]==]
LM["Greater than"] = "Больше чем:"
LM["Greater than %num%"] = "Больше чем: %num%"
LM["Group"] = "Группа"
LM["Group / Raid"] = "Группа / Рейд" -- Needs review
-- LM["Guild Group"] = "Guild Group"
-- LM["Guild Group_Desc"] = "Selected rule will match when the group has this percentage of guild mates."
LM["Heroic"] = "Героик"
-- LM["Hybrid"] = "Hybrid"
-- LM["Inventory"] = "Inventory"
LM["Item Level"] = "Уровень предмета" -- Needs review
LM["Item Name"] = "Название предмета" -- Needs review
LM["Item Price"] = "Цена предмета" -- Needs review
--[==[ LM["ItemLevel_DropDownTooltipDesc"] = [=[Selected rule will only match items when comparing the item level to this.
(use 'current' for your currently equipped item level)]=] ]==]
-- LM["Later"] = "Later"
-- LM["Learned"] = "Learned"
-- LM["Learned Item"] = "Learned Item"
LM["Less than"] = "Меньше чем:"
LM["Less than %num%"] = "Меньше чем: %num%"
LM["Loot Won"] = "Добычу выиграл" -- Needs review
-- LM["Loot Won Comparison"] = "Loot Won Comparison"
-- LM["Loot Won Counter"] = "Loot Won Counter"
--[==[ LM["Loot Won Counter_Desc"] = [=[Set how many times we have won loot on this rule
(Saves when you press enter)]=] ]==]
LM["None"] = "Нету"
LM["Normal"] = "Обычное"
LM["Not"] = "Не" -- Needs review
LM["Not Equal to"] = "Не равен:"
LM["Not Equal to %num%"] = "Не равен: %num%"
-- LM["Now"] = "Now"
LM["Outside"] = "Внешний мир" -- Needs review
LM["Pickup"] = "Персональное при получении" -- Needs review
-- LM["Player Name"] = "Player Name"
LM["Quality"] = "Качество" -- Needs review
LM["Raid"] = "Рейд"
LM["Required Level"] = "Требуемый уровень" -- Needs review
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
-- LM["Selected rule will only match items with this equip slot."] = "Selected rule will only match items with this equip slot."
-- LM["Selected rule will only match items with this type and subtype."] = "Selected rule will only match items with this type and subtype."
LM["Selected rule will only match these items."] = "Только выбранные правила будут соответствовать этим предметам." -- Needs review
-- LM["Selected rule will only match this quality of items."] = "Selected rule will only match this quality of items."
-- LM["Selected rule will only match usable items."] = "Selected rule will only match usable items."
LM["Temp Item Name"] = "Временное название предмета"
-- LM["Temp Name"] = "Temp Name"
LM["Temp Zone Name"] = "Временное название зоны"
LM["Type / SubType"] = "Тип / Gодтип" -- Needs review
LM["Unique"] = "Уникальный"
--[==[ LM["Unique_Desc"] = [=[Selected rule will only match items that are unique.
This includes items which have a unique stack higher than 1, such as battleground tokens, as well as items which are Unique-Equip.]=] ]==]
-- LM["Unlearned"] = "Unlearned"
-- LM["Unusable"] = "Unusable"
-- LM["Usable"] = "Usable"
LM["Use"] = "Персональное при использовании" -- Needs review
LM["Weapons"] = "Оружие"
-- LM["Will click yes on BoP dialogues."] = "Will click yes on BoP dialogues."
-- LM["Will click yes on Disenchant dialogues."] = "Will click yes on Disenchant dialogues."
-- LM["Will confirm bind!"] = "Will confirm bind!"
-- LM["Will confirm disenchant!"] = "Will confirm disenchant!"
LM["Zone Name"] = "Название зоны" -- Needs review
--[==[ LM["Zone Name_Desc"] = [=[Zone name to match selected rule to, leave empty to match any zone.
(Saves when you press enter)
Shift-right-click to fill with current zone name]=] ]==]
LM["Zone Type"] = "Тип зоны" -- Needs review
-- LM["current"] = "current"
-- LM["level"] = "level"

