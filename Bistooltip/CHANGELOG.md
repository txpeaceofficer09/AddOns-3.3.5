# BisTooltip Changelog

This changelog describes the **3.3.5a backport** and the main differences compared to the original BiS-Tooltip.

## Version 1.2.0-3.3.5a

### New Features

- **Ascension 5M emblem vendor support (Emblem of Ascension)**
  - Emblem items are shown as an additional source.
  - Checklist can group items by emblem cost and show section totals + a grand total.
  - Includes support for server custom items (including newly added legendary weapons).

- **BOE information in tooltip**
  - Items that are *Bind on Equip* are clearly labeled.

- **Improved multi-source display**
  - If an item is available from multiple sources (e.g., raid drop + emblem vendor), the addon can show both.

### Improvements

- **Checklist readability**
  - Gem suggestions are displayed as stat abbreviations instead of long names.
  - Enchant suggestions can be displayed per slot.

- **Stability & UI cleanup**
  - Better cleanup of frame decorations and overlays to avoid leftover highlights after closing/reopening panels.

### Performance

- Faster source lookups via caching.
- Reduced redundant tooltip recomputation during rapid updates.

---

## Version 1.1.0-3.3.5a

### Bug Fixes

- **Fixed Config.lua dropdown bug**
  - The `data_source` select widget was using incorrect callback signatures.

- **Removed global table pollution**
  - Replaced global `table.contains` with `BistooltipUtils.TableContains`.

- **Added nil checks for spec icons**
  - Prevented edge-case nil errors when icon tables were missing.

- **Fixed TOC metadata**
  - Consolidated duplicate Author fields.

### Performance Improvements

- Tooltip computation caching (short TTL).
- Source lookup caching.
- Basic cooldown/throttling to prevent excessive tooltip refresh work.

### New Features

- Expanded slash commands:
  - `/bistooltip` or `/bis` — toggle BiS window
  - `/bistooltip config` or `/bis c` — open settings
  - `/bistooltip reload` or `/bis r` — reload data
  - `/bistooltip help` — show help

- Gem stat abbreviations in checklist.
- Instance difficulty tags on boss sources where available.
- Enchant display in checklist.
- Multi-source support (raid boss + emblem vendor).

### Code Quality

- Added `Utils.lua` (shared helpers) and `Constants.lua` (central configuration).
- Introduced module-level state organization in `Bislist.lua`.
- Improved error handling and code organization.
