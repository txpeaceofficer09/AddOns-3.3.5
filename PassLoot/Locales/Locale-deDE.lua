local L = LibStub("AceLocale-3.0"):NewLocale("PassLoot", "deDE", false);
if not L then return end
L["Active Filters"] = "Aktive Filter" -- Needs review
L["Active Filters_Desc"] = "Wähle einen Filter aus, um ihn zu bearbeiten oder Schift-Rechtsklick, um ihn zu löschen"
L["Add"] = "Hinzufügen" -- Needs review
L["Add a new rule."] = "Hinzufügen einer neuen Regel." -- Needs review
L["Add this filter."] = "Füge diesen Filter hinzu." -- Needs review
L["Allow Multiple Confirm Popups"] = "Erlaube mehrere Bestätigungsfenster"
L["Available Filters"] = "Verfügbare Filter" -- Needs review
--[==[ L["Available Filters_Desc"] = [=[Select a filter to use.
(Each filter must have at least one match)]=] ]==]
-- L["Change the exception status of this filter."] = "Change the exception status of this filter."
-- L["Checking this will disable the exclusive bit to allow multiple confirmation of loot roll popups"] = "Checking this will disable the exclusive bit to allow multiple confirmation of loot roll popups"
L["Checking this will prevent extra details from being displayed."] = "Durch das Aktivieren werden zusätzliche Details zu verhindern angezeigt." -- Needs review
L["Click to select and edit this rule."] = "Klicken Sie auf die Auswahl und Bearbeitung dieser Regel." -- Needs review
L["Default"] = "Standart" -- Needs review
L["Description"] = "Beschreibung" -- Needs review
L["Description_Desc"] = "Beschreibung für diese Regel"
L["Disenchant"] = "DE"
-- L["Disenchant_Desc"] = "If an enchanter is present, will roll disenchant on all loot matching this rule."
L["Down"] = "Abwärts" -- Needs review
-- L["EXCEPTION_PREFIX"] = "! "
L["Enable / Disable this module."] = "Aktiviere / Deaktiviere diesen Modul."
L["Enable Mod"] = "Aktiviere Mod" -- Needs review
L["Enable or disable this mod."] = "Aktiviere oder deaktiviere Mod." -- Needs review
L["Enabled"] = "Eingeschaltet"
--[==[ L["Enter the text displayed when rolling."] = [=[Enter the text displayed when rolling.
Use '%item%' for item being rolled on.
Use '%rule%' for rule that was matched.
]=] ]==]
-- L["Exception"] = "Exception"
L["General Options"] = "Hauptoptionen"
L["Greed"] = "Gier"
L["Ignoring %item% (%rule%)"] = "Ignoriere %item% (%rule%)"
L["Menu"] = "Menu"
-- L["Messages"] = "Messages"
L["Module"] = "Modul" -- Needs review
L["Modules"] = "Module" -- Needs review
L["Move selected rule down in priority."] = "Bewegen des ausgewählten Vorschrift des Priorität." -- Needs review
L["Move selected rule up in priority."] = "Bewegen des ausgewählten Regel in der Rangfolge auf." -- Needs review
L["Need"] = "Bedarf"
L["No rules matched."] = "Keine Regel passt."
-- L["Opens the PassLoot Menu."] = "Opens the PassLoot Menu."
L["Options"] = "Optionen"
L["Output"] = "Ausgabe"
L["PASSLOOT_SLASH_COMMAND"] = "passloot"
L["Pass"] = "Passen"
L["PassLoot"] = "PassLoot"
L["Profiles"] = "Profile"
L["Quiet"] = "Still" -- Needs review
L["Remove"] = "Entfernen" -- Needs review
L["Remove selected rule."] = "Entfernt die ausgewählte Regel." -- Needs review
L["Remove this filter."] = "Entferne diesen Filter." -- Needs review
L["Rolling disenchant on %item% (%rule%)"] = "Würfel entzaubern auf %item% (%rule%)"
L["Rolling greed on %item% (%rule%)"] = "Würfel Gier auf %item% (%rule%)"
-- L["Rolling is tried from left to right"] = "Rolling is tried from left to right"
L["Rolling need on %item% (%rule%)"] = "Würfel Bedarf auf %item% (%rule%)"
L["Rolling pass on %item% (%rule%)"] = "Passe auf %item% (%rule%)"
L["Rule List"] = "Regelliste" -- Needs review
L["Temp Description"] = "Temp Beschreibung" -- Needs review
L["Test"] = "Test"
L["Test an item link to see how we would roll"] = "Teste einen Gegenstandslink, um zu prüfen, wie gewürfelt wird."
L["Up"] = "Nach oben" -- Needs review
L["Will pass on all loot matching this rule."] = "Will leitet alle Beute für diese Regel." -- Needs review
L["Will roll greed on all loot matching this rule."] = "Will Roll-Gier auf allen Beute für diese Regel." -- Needs review
L["Will roll need on all loot matching this rule."] = "Es wird Bedarf auf jeden Gegenstand gewürfelt, der dieser Regel entspricht."

local LM = LibStub("AceLocale-3.0"):NewLocale("PassLoot_Modules", "deDE", false);
LM["%class% - %spec%"] = "%class% - %spec%"
LM["%type% - %subtype%"] = "%type% - %subtype%"
LM["%zonetype% - %instancedifficulty%"] = "%zonetype% - %instancedifficulty%"
LM["10 Man Raid"] = "10 Mann Schlachtzug"
LM["25 Man Raid"] = "25 Mann Schlachtzug"
LM["Accessories"] = "Zubehör" -- Needs review
LM["Account"] = "Konto" -- Needs review
LM["Any"] = "Jeder"
LM["Armor"] = "Armor" -- Needs review
LM["Bind On"] = "Gebunden beim"
LM["Binds On"] = "Bindet"
-- LM["By adding the Confirm DE filter you will not get any confirmations when rolling disenchant.  This might get you into trouble with your group, are you sure?"] = "By adding the Confirm DE filter you will not get any confirmations when rolling disenchant.  This might get you into trouble with your group, are you sure?"
-- LM["Can I Roll"] = "Can I Roll"
-- LM["Class Spec"] = "Class Spec"
LM["Confirm BoP"] = "Bestätige BoP"
-- LM["Confirm DE"] = "Confirm DE"
-- LM["Current Spec: %spec%"] = "Current Spec: %spec%"
LM["Equal to"] = "Gleich" -- Needs review
LM["Equal to %num%"] = "gleich zu %num%"
LM["Equip"] = "Anlegen" -- Needs review
-- LM["Equip Slot"] = "Equip Slot"
-- LM["Equipable"] = "Equipable"
LM["Exact"] = "Genau"
LM["Exact_Desc"] = [=[Ausgewählt: Gegenstand muss genau Passen.
Abgewählt: Gegenstand muss diesen Teil besitzen.]=]
LM["Greater than"] = "Größer als" -- Needs review
LM["Greater than %num%"] = "Größer als %num%"
LM["Group"] = "Gruppe" -- Needs review
-- LM["Group / Raid"] = "Group / Raid"
-- LM["Guild Group"] = "Guild Group"
-- LM["Guild Group_Desc"] = "Selected rule will match when the group has this percentage of guild mates."
LM["Heroic"] = "Heroisch"
-- LM["Hybrid"] = "Hybrid"
LM["Inventory"] = "Inventar"
-- LM["Item Level"] = "Item Level"
-- LM["Item Name"] = "Item Name"
-- LM["Item Price"] = "Item Price"
--[==[ LM["ItemLevel_DropDownTooltipDesc"] = [=[Selected rule will only match items when comparing the item level to this.
(use 'current' for your currently equipped item level)]=] ]==]
-- LM["Later"] = "Later"
-- LM["Learned"] = "Learned"
-- LM["Learned Item"] = "Learned Item"
LM["Less than"] = "Kleiner als"
LM["Less than %num%"] = "Kleiner als %num%"
-- LM["Loot Won"] = "Loot Won"
-- LM["Loot Won Comparison"] = "Loot Won Comparison"
-- LM["Loot Won Counter"] = "Loot Won Counter"
--[==[ LM["Loot Won Counter_Desc"] = [=[Set how many times we have won loot on this rule
(Saves when you press enter)]=] ]==]
-- LM["None"] = "None"
-- LM["Normal"] = "Normal"
-- LM["Not"] = "Not"
LM["Not Equal to"] = "Ungleich" -- Needs review
-- LM["Not Equal to %num%"] = "Not Equal to %num%"
-- LM["Now"] = "Now"
LM["Outside"] = "Außen" -- Needs review
LM["Pickup"] = "Aufheben"
-- LM["Player Name"] = "Player Name"
LM["Quality"] = "Qualität"
LM["Raid"] = "Schlachtzug"
-- LM["Required Level"] = "Required Level"
--[==[ LM["RequiredLevel_DropDownTooltipDesc"] = [=[Selected rule will only match items when comparing the required level to this.
(Use 'level' for your current level)]=] ]==]
-- LM["Reset Counters On Join"] = "Reset Counters On Join"
--[==[ LM["Reset Counters On Join_Desc"] = [=[Checking this will reset counters on joining a group or raid.
Shift-click to reset all current counters.]=] ]==]
LM["Selected rule will match on item names."] = "Die ausgewählte Regel gilt nur für Gegenstände mit diesen Namen."
-- LM["Selected rule will match on player names."] = "Selected rule will match on player names."
LM["Selected rule will only match if you are in a group or raid."] = "Die ausgewählte Regel gilt nur für für die aktive Gruppe oder Schlachtzug."
-- LM["Selected rule will only match if you can roll this."] = "Selected rule will only match if you can roll this."
-- LM["Selected rule will only match items that are equipable."] = "Selected rule will only match items that are equipable."
-- LM["Selected rule will only match items when compared to vendor value."] = "Selected rule will only match items when compared to vendor value."
-- LM["Selected rule will only match items when comparing already aquired inventory to this."] = "Selected rule will only match items when comparing already aquired inventory to this."
-- LM["Selected rule will only match items when comparing the item level to this."] = "Selected rule will only match items when comparing the item level to this."
-- LM["Selected rule will only match items when comparing the loot won counter to this."] = "Selected rule will only match items when comparing the loot won counter to this."
-- LM["Selected rule will only match items when comparing the required level to this."] = "Selected rule will only match items when comparing the required level to this."
-- LM["Selected rule will only match items when you are in this type of zone."] = "Selected rule will only match items when you are in this type of zone."
-- LM["Selected rule will only match items when you are this class and spec."] = "Selected rule will only match items when you are this class and spec."
LM["Selected rule will only match items with this equip slot."] = "Die ausgewählte Regel gilt nur für diesen Aurüstungsplatz."
-- LM["Selected rule will only match items with this type and subtype."] = "Selected rule will only match items with this type and subtype."
LM["Selected rule will only match these items."] = "Die ausgewähle Regel gilt nur für diese Items."
-- LM["Selected rule will only match this quality of items."] = "Selected rule will only match this quality of items."
-- LM["Selected rule will only match usable items."] = "Selected rule will only match usable items."
LM["Temp Item Name"] = "Temporärer Gegenstandsname"
-- LM["Temp Name"] = "Temp Name"
LM["Temp Zone Name"] = "Temporärer Zonenname"
LM["Type / SubType"] = "Gruppe / Untergruppe"
LM["Unique"] = "Einzigartig"
--[==[ LM["Unique_Desc"] = [=[Selected rule will only match items that are unique.
This includes items which have a unique stack higher than 1, such as battleground tokens, as well as items which are Unique-Equip.]=] ]==]
-- LM["Unlearned"] = "Unlearned"
LM["Unusable"] = "Unbenutzbar"
LM["Usable"] = "Benutzbar"
LM["Use"] = "Benutzen"
LM["Weapons"] = "Waffen"
-- LM["Will click yes on BoP dialogues."] = "Will click yes on BoP dialogues."
-- LM["Will click yes on Disenchant dialogues."] = "Will click yes on Disenchant dialogues."
-- LM["Will confirm bind!"] = "Will confirm bind!"
-- LM["Will confirm disenchant!"] = "Will confirm disenchant!"
LM["Zone Name"] = "Zonenname"
--[==[ LM["Zone Name_Desc"] = [=[Zone name to match selected rule to, leave empty to match any zone.
(Saves when you press enter)
Shift-right-click to fill with current zone name]=] ]==]
LM["Zone Type"] = "Zonentyp"
-- LM["current"] = "current"
LM["level"] = "level"

