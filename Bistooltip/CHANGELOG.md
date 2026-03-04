# BisTooltip Changelog

## Version 1.3.8-3.3.5a

### Bug Fixes

1. **Checkmark Color Stability Fixed**
   - `clearCheckMarks()` now properly hides textures with `Hide()`
   - Colors reset to white (1,1,1,1) before clearing
   - Prevents color bleeding when clicking UI elements

2. **Removed Blue Border from Gem Box**
   - Gem plan row has no backdrop (completely transparent)

3. **Discord Link Dialog Fixed**
   - Single "OK" button with copy hint

4. **Slot Separators in All Modes**
   - Solid line separator `_____` now visible in standard mode
   - Color: medium gray (#555555)
   - Works in: Standard, BIS Checklist, and Customize modes

5. **Gem Condensing in Standard Mode**
   - Duplicate gems now show as "2x" or "3x" instead of repeating
   - Example: 3 identical gems → single icon with "3x" label
   - Only applies to standard mode (BIS Checklist shows all gems)

6. **Spec Highlight for Your Specialization**
   - When Spec Highlight is enabled for player's own spec
   - "Your specialization" section now shows `>>` markers
   - Format: `>> Warrior - Protection <<`

---

## New Features Since Lock Phase (v1.3.0)

### 1. Lock Phase System (v1.3.0)
- **Checkbox "Lock"** next to phase dropdown
- When locked, phase dropdown is disabled
- **Tooltips filter**: Only show BIS info for locked phase and earlier

### 2. Customize Mode (v1.3.0)
- **Checkbox "Customize"** in dropdown row
- Only available in standard view
- Allows reordering item priorities per slot

### 3. Slot Locking Icons (v1.3.0)
- **[O]** = unlocked (green), **[X]** = locked (default)
- Click to toggle unlock state
- **[L]** header to toggle all slots

### 4. Click-to-Swap Item Reordering (v1.3.1)
- Click first item → red border appears
- Click second item → positions swap
- Right-click → cancel selection

### 5. Reset Button "R" (v1.3.1)
- Resets all custom priorities for current class/spec/phase
- Restores original item order

### 6. Custom Priority Integration (v1.3.5)
- Custom item order reflects in tooltips
- Item at position 1 shows as "BIS"
- Progress bar counts custom BIS items

### 7. Progress Bar Improvements (v1.3.4-1.3.7)
- Counts ALL slots
- Proper Horde↔Alliance ID lookup
- Color changes based on progress %

### 8. Phase Combining (v1.3.7)
- "PR BIS / T7 BIS" → "BIS PR-T7"
- All BIS text in green color

### 9. Tooltip Enhancements (v1.3.7)
- "Where:" changed to "Rank:"
- Rank: hidden when BIS until last phase
- Player's spec hidden from main list

### 10. UI Polish (v1.3.7-1.3.8)
- Bright green checkmarks (0, 1, 0)
- Gem stat width reduced for better fit
- Slot separators in all modes
- Gem condensing (2x, 3x notation)
- Spec Highlight works for player's spec

---

## Version History

| Version | Key Changes |
|---------|-------------|
| 1.3.0 | Lock Phase, Customize Mode, Slot Locking |
| 1.3.1 | Click-to-Swap, Reset Button |
| 1.3.2 | Tooltip options, Lock Phase filtering |
| 1.3.4 | Progress bar counting |
| 1.3.5 | Custom priority system |
| 1.3.6 | Reset functionality, BIS green color |
| 1.3.7 | Phase combining, Rank: label, credits |
| 1.3.8 | Color fix, separators, gem condensing, spec highlight |
