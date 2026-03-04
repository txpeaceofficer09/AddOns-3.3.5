# Hikili (WoTLK 3.3.5a)

`Hikili` is a lightweight priority helper inspired by Hekili, adapted for WoW 3.3.5a API.

## Installation

- The addon folder name must be exactly `Hikili` (it must match `Hikili.toc`).
- Correct path example:
  `World of Warcraft Wrath of the Lich King 3.3.5 enUS\Interface\AddOns\Hikili\Hikili.toc`
- If you unzip this repo as `WOTLK-hikili`, rename the folder to `Hikili` before launching the client.

## What it does

- Dynamic next-action recommendations (default queue: 1).
- Optional preview queue up to 3 actions.
- Optional second cooldown window for major CDs (`/hikili cdwindow on|off`).
- ST/Cleave/AOE profile switching based on tracked enemy count.
- Cast-awareness (keeps current cast as next action while casting/channeling).
- Spell suggestions filtered to learned spells from spellbook.
- Glyph-aware behavior (e.g. Glyph of Life Tap handling).
- Cooldown sync toggle for major CDs.
- Saved frame position/size/alpha/scale/lock state.
- Priority profiles for all Wrath classes and all 3 talent trees:
  - Death Knight (`DEATHKNIGHT:1/2/3`)
  - Druid (`DRUID:1/2/3`)
  - Hunter (`HUNTER:1/2/3`)
  - Mage (`MAGE:1/2/3`)
  - Paladin (`PALADIN:1/2/3`)
  - Priest (`PRIEST:1/2/3`)
  - Rogue (`ROGUE:1/2/3`)
  - Shaman (`SHAMAN:1/2/3`)
  - Warlock (`WARLOCK:1/2/3`)
  - Warrior (`WARRIOR:1/2/3`)

Fallback mode remains as a safety net if a profile returns no castable action.

## Slash commands

- `/hikili` or `/hk` - help
- `/hikili lock | unlock`
- `/hikili show | hide | toggle`
- `/hikili scale <0.5-2>`
- `/hikili alpha <0.2-1>`
- `/hikili size <30-96>`
- `/hikili spacing <0-20>`
- `/hikili queue <1-3>`
- `/hikili cleave <1-10>`
- `/hikili aoe <1-10>`
- `/hikili cdsync on|off`
- `/hikili cdwindow on|off`
- `/hikili rescan`
- `/hikili reset`
- `/hikili debug`

## Defaults

- Queue length: `1` (next action only).
- Cleave threshold: `2`.
- AOE threshold: `3`.
- Cooldown sync: `on`.
- Cooldown window: `on`.

## File layout

- `Hikili.toc`
- `Core.lua`
- `PriorityEngine.lua`
- `UI.lua`

## Notes

This is a practical baseline implementation for WoTLK private-server/client workflows.  
To expand class coverage, add more profile handlers in `PriorityEngine.lua` with the key format `CLASS:TREE_INDEX`.
