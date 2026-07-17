Analysis complete. Here's the breakdown:

ZygorGuidesViewerRM (3.3.5a) - Current State
Version: 3.0.112, Interface 30300
Architecture: Ace3 framework, event-driven
Core systems: Guide Parser, Step/Goal tracking, Navigation Pointer, Quest Tracking, Guide Browser, Options, Action Buttons, Fog of War data, Talent Advisor, Map Spots
~20 core Lua modules, 47 guide files, 24 embedded libraries
4 arrow styles, multiple UI skins (including remaster themes)
ZygorGuidesViewerClassicTBC (Retail) - What It Has Extra
The retail version is significantly more feature-rich with 784 files vs the RM's smaller set. Key features that could be backported:

Feature	Status in RM
Item Scoring & Gear Finder	DONE - stat weighting, tooltip overlays, upgrade detection, quest reward selection, gear finder
Notification Center	Missing - queued notification UI
Creature Detector	Missing - mount/pet identification + 3D viewer
Dungeon Pointer Maps	Missing - floor-by-floor dungeon navigation
Gold Guide System	Missing - farming/gathering/crafting/auction tools
Advanced Routing (LibRover)	Missing - optimized pathfinding
Custom UI Widget Framework	Missing - 14 widget types (ScrollTable, SuggestBox, etc.)
Enhanced Talent Advisor	Partial - RM has basic version, retail has popout + registering
NPC/Object 3D Model Data	Missing
Quest Chain Parser	Missing
10-language Localization	Partial
Multi-version API shims	Missing
The retail version also has a modular Code-WOTLK/ directory with version-specific overrides, making it well-structured for backp85