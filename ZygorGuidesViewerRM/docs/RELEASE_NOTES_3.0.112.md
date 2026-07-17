# Zygor Guides Viewer Remastered 3.0.112

## Summary

This release focuses on post-`3.0.111` action-targeting, progress, and action bar reliability fixes.

It improves quest-bound progress reporting, action bar usability, and kill-target handling for generic and `.from`-driven rows without reopening the earlier remaster viewer regressions.

## Included

- quest-bound item progress now prefers higher live bag counts when the quest log under-reports objective totals
- slightly larger default action bar buttons
- action bar item cooldowns now render across the full button and show countdown text more cleanly
- fixed stale inline cooldown overlays carrying onto non-item actionable rows like `talk`
- improved secure `talk` / `kill` raid-marker application in combat through macro targeting
- fixed stale combat action bar state when the current step no longer has needed bar actions
- suppressed generic no-ID `kill` rows from action bar and target preview when they are not reliably targetable
- added `.from` mob support for kill targeting:
  - generic `kill` rows can borrow adjacent `.from` mobs as actionable targets
  - `.from` rows themselves can now produce `kill` action specs for inline buttons, action bar, and target preview

## Known Issue

- Some authored generic kill objectives may still need guide-side cleanup if they mix broad quest-objective text with ambiguous source targeting beyond what `.from` can safely describe.

## Deferred Work

- additional pass on kill-target heuristics if more mixed-source Wrath quest rows surface during play
- any follow-up action bar polish found during broader questing coverage

## Release Validation Checklist

1. Confirm quest-bound item collection steps show live bag progress instead of sticking at `0/x`.
2. Confirm action bar item cooldown text fills the button correctly and inline talk rows do not inherit stale cooldown timers.
3. Confirm `talk` and `kill` action clicks can still apply their raid markers in combat.
4. Confirm stale action bars do not remain visible when combat step changes land on non-actionable rows.
5. Confirm generic no-ID kill rows like `Kill 20 En'kilah mobs` no longer show action bar or target preview.
6. Confirm `.from Scalder##25226` style rows now show the expected kill inline/button behavior.
7. Confirm no new Lua/BugSack errors during reload, step changes, combat swaps, or target preview use.
