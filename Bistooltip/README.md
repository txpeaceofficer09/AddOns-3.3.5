# BiS-Tooltip (WotLK 3.3.5a Backport + Stormforge:Frostmourne)
Backport of **BiS-Tooltip** for **Wrath of the Lich King 3.3.5a**, extended with:
- a **BiS Checklist UI**,
- **multi-source item support** (boss drops + vendor/emblems),
- and custom-server additions (including **Ascension 5M Emblems** and custom item IDs).

Original addon (retail clients): https://www.curseforge.com/wow/addons/bis-tooltip

---
## Features

### Tooltip (BiS info on items)

- **BiS / ALT ranking and phase information** displayed directly in item tooltips.
- **Class-based layout**: results are grouped under class headers, with specs listed below.
- **Improved sorting**:
  - classes are sorted by their *best* availability (BIS > BIS² > ALT1 > ALT2 > ALT3 ...), then by the earliest phase,
  - specs inside each class are sorted by rank and phase.
- **Multi-source “Source” section**: when available, the tooltip can show more than one source (e.g. raid boss + emblem vendor).
- **Owned info** (bags + equipped). Bank/alt inventory requires optional DataStore.

#### Modifier key views

- **Hold SHIFT** → compact *Summary* view:
  - grouped into **BIS / BIS² / ALTn / NO BIS**,
  - shows class colors + spec icons + a compact phase range tag (e.g. `[T8–T9]` or `[PR–RS]`),
  - wraps to multiple lines (up to 3 entries per line).

- **Hold CTRL** → *Focus* view:
  - filters results to **BIS / BIS² / ALT1 / ALT2** only,
  - useful for quick “is it relevant?” checks without the full list.

#### Dual-slot handling

- For dual-slot items (rings/trinkets) and Fury DW weapons, **ALT2 is promoted to BIS²** to make the tooltip output clearer.

---

### BiS Checklist UI

- Dedicated checklist panel for tracking missing BiS items for the selected **class/spec/phase**.
- **Owned markers**:
  - checkmark overlays for owned items (equipped vs bags),
  - stack count overlay for bag duplicates.
- **BOE marker**: Bind-on-Equip items are marked in the checklist grid (coin icon), making “buyable/AH” items easy to spot.
- **Gems and enchants**:
  - gems are displayed as **stat abbreviations** (e.g. `20STR`, `12SP/10SPI`) instead of long gem names,
  - recommended enchants can be shown per slot.

#### Emblem shopping mode

- **“Emblems only”** checkbox filters the checklist to items purchasable with emblems.
- Shows **emblem totals** needed for missing items (per currency), and can list emblem-purchasable items grouped by currency.

---

### Custom server support

- **Ascension 5M Emblem vendor** support (**Emblem of Ascension**):
  - costs are supported for tiers such as `x12`, `x15`, `x19`, `x25`, `x38`, `x80`.
- Supports server-specific custom item IDs (including newly added legendary weapons if your realm uses custom IDs).

---

### Performance / stability

- Tooltip refresh is throttled when modifier keys change (prevents rapid re-build spam).
- Tooltip results caching (short TTL) + source caching.
- Safer cleanup of UI overlays to avoid “leftover” frame coloring when closing/reopening windows.

---
## Installation

1. Download / clone this repository.
2. Copy the folder to:
   - `World of Warcraft 3.3.5a/Interface/AddOns/Bistooltip/`
3. Ensure the bundled **Ace3** libraries are present (they are included in this repo).
4. Launch the game and enable the addon in the AddOns menu.

### Optional dependencies

- **DataStore** + **DataStore_Inventory** (optional): enables broader ownership checks (e.g. bank items / characters tracked by DataStore).

---

## Commands

- `/bis` or `/bistooltip` — toggle the main window
- `/bis config` — open settings
- `/bis reload` — reload data
- `/bis help` — show help

---

## Notes for custom servers

- Loot/source data lives in `Loot_Sources.lua`.
- Emblem costs are defined via `EmblemData.lua` / `Constants.lua` (currency meta such as icon/short name).
- If your realm adds new custom items (including legendaries), add their item IDs to the appropriate tables so the addon can display sources and costs.

---

## License

MIT License (see `LICENSE`).

