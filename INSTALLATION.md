# SuperAI Installation Guide

## Quick Start

### 1. Install Dependencies (REQUIRED)

**You must have these mods installed first:**

1. **Queller AI**
   - Steam Workshop: Search for "Queller AI"
   - Or: https://github.com/Quitch/Queller-AI

2. **Paragon** (com.pa.brandon.paragon)
   - Install from your local mods

3. **Second Wave Units** (pa.mla.unit.addon / MLA Unit Addon)
   - Steam Workshop: Search for "Second Wave" or "MLA Unit Addon"

### 2. Install SuperAI

**Option A: Direct Copy (Development)**
```powershell
# Copy the mod folder to PA mods directory
Copy-Item -Recurse "c:\Users\Brandon\dev\mods\com.pa.super.ai" "$env:LOCALAPPDATA\Uber Entertainment\Planetary Annihilation\mods\"
```

**Option B: Manual Installation**
1. Locate your PA mods folder:
   - Windows: `%LOCALAPPDATA%\Uber Entertainment\Planetary Annihilation\mods\`
   - Default path: `C:\Users\[YourName]\AppData\Local\Uber Entertainment\Planetary Annihilation\mods\`

2. Copy the entire `com.pa.super.ai` folder into the mods directory

3. Enable the mod in Planetary Annihilation:
   - Launch PA
   - Go to Settings → Mods
   - Find "SuperAI" and enable it
   - Restart PA if needed

### 3. Verify Installation

1. Start a new Skirmish game
2. Click "Add AI" opponent
3. Look for **"SuperAI"** in the AI personality dropdown
4. If you see it, installation successful! 🎉

If you don't see SuperAI:
- Check that all 3 dependencies are installed and enabled
- Check mod priority (SuperAI priority: 110, should load after Queller at 100)
- Check PA console log for errors (`%LOCALAPPDATA%\Uber Entertainment\Planetary Annihilation\log\`)

## Testing SuperAI

### Recommended Test Setup

**Map:**
- Large metal planet (lots of metal spots for economy)
- Multi-planet system (tests orbital/nuke spam)

**Game Settings:**
- You vs SuperAI (1v1)
- Eco Multiplier: 1.0 (fair test)
- Start: Normal (not Commanders only)

**What to Watch For:**

**Early Game (0-10 min):**
- Should expand like Queller Uber
- May start building Second Wave units if economy allows

**Mid Game (10-25 min):**
- Should have 3 fabbers per factory (check orbital especially!)
- May start building Paragon around 15-20 min
- Nuke silos should appear at 2-3-5 progression

**Late Game (25+ min):**
- When Paragon completes, watch the build queue
- Should see 100 nuke silos appear
- Orbital factories spam Omegas
- Unit Cannons start appearing across planet
- **This is GOD MODE** - expect apocalypse

### Performance Monitoring

**If you experience lag:**
1. Check fabber count (F5 → Units tab)
2. If 10,000+ fabbers active, GOD MODE is working
3. May need to limit Paragon count for performance

**Console Commands (for testing):**
```
# Check AI state
ai_debug

# See build queue
# (Use in-game UI - F11 → Select AI commander → View build queue)
```

## Troubleshooting

### SuperAI doesn't appear in AI list
**Cause**: Dependencies missing or mod not enabled
**Fix**: 
1. Verify Queller AI is installed and enabled
2. Verify Paragon mod is installed and enabled
3. Verify Second Wave Units (pa.mla.unit.addon) is installed and enabled
4. Check mod load order (SuperAI priority: 110)

### SuperAI selected but behaves like vanilla AI
**Cause**: AI files didn't load correctly
**Fix**:
1. Check PA log file for JavaScript errors
2. Verify `new_game.js` is in `ui/mods/com.pa.super.ai/`
3. Verify AI files are in `pa/ai_super/super_uber/`
4. Try disabling and re-enabling the mod

### SuperAI doesn't build Second Wave units
**Cause**: Second Wave Units mod not installed
**Fix**:
1. Install pa.mla.unit.addon from Steam Workshop
2. Enable the mod in PA settings
3. Restart PA

### SuperAI doesn't build Paragon
**Cause**: Paragon mod not installed OR economy not strong enough
**Fix**:
1. Install com.pa.brandon.paragon mod
2. Give AI time (Paragon requires 8+ adv mex, 5+ adv energy)
3. Check build queue - may be queued but not started yet

### SuperAI causes massive lag
**Cause**: GOD MODE activated (10,000+ fabbers)
**Fix**:
1. This is working as intended! 100 nukes = lots of fabbers
2. Reduce system size for less fabber spam
3. Use smaller planets
4. Consider "reasonable mode" (manually edit offense.json to reduce nukes)

### SuperAI gets orbital rushed
**Cause**: This was fixed in v5.0.1, make sure you have latest version
**Fix**:
1. Verify orbital.json has `"value0": 3` for orbital fabbers
2. Should be 3 orbital fabbers per orbital factory
3. If still 1, file didn't copy correctly

## File Structure Reference

```
com.pa.super.ai/
├── modinfo.json                    # Mod metadata & dependencies
├── README.md                       # Full documentation
├── CHANGELOG.md                    # Version history
├── INSTALLATION.md                 # This file
├── images/
│   └── icon.gif                    # Mod icon
├── pa/
│   └── ai_super/
│       └── super_uber/
│           ├── fabber_builds/      # Structure construction logic
│           │   └── mla/
│           │       ├── economy.json        # Paragon + metal/energy
│           │       ├── offense.json        # Nukes + Unit Cannons
│           │       ├── defense_land.json   # Spear/Pounder/Anti-Missile
│           │       └── defense_super.json  # Anti-nukes
│           ├── factory_builds/     # Unit production logic
│           │   └── mla/
│           │       ├── bot.json            # Rex + fabbers
│           │       ├── vehicle.json        # Centaur/Stalker + fabbers
│           │       ├── air.json            # Fabbers
│           │       ├── naval.json          # Saxon/Swordfish + fabbers
│           │       └── orbital.json        # Andreas/Omegas + fabbers
│           ├── platoon_builds/
│           ├── platoon_templates/
│           └── unit_maps/
└── ui/
    └── mods/
        └── com.pa.super.ai/
            └── new_game.js         # Personality registration
```

## Development Testing

### Quick Reload During Development

**After modifying files:**
```powershell
# Quick sync to PA mods folder
Copy-Item -Recurse -Force "c:\Users\Brandon\dev\mods\com.pa.super.ai\*" "$env:LOCALAPPDATA\Uber Entertainment\Planetary Annihilation\mods\com.pa.super.ai\"
```

**In PA:**
- No need to restart PA for most changes
- Just start a new game (AI files reload per-game)
- UI changes (new_game.js) require PA restart

### Testing Specific Features

**Test Second Wave Units:**
- Give AI lots of early metal
- Check factory builds at 3+ adv mex
- Should see Rex, Centaur, Andreas, etc.

**Test Paragon:**
- Give AI 8+ adv mex
- Wait for priority 525 to activate
- Should start building Paragon alongside 2-3 nuke silos

**Test GOD MODE:**
- Give AI Paragon (or wait for it to complete)
- Check build queue immediately after
- Should see 100 nuke silos appear

**Test Orbital Fabbers:**
- Check orbital factory production
- Should make 3 orbital fabbers per factory
- Compare to vanilla Queller (only makes 1)

## Support

**For issues:**
1. Check this installation guide first
2. Check README.md for gameplay details
3. Check CHANGELOG.md for version-specific info
4. Check PA log files for errors

**Known Working Configuration:**
- PA Build: 116982+
- Queller AI: v5.25.0+
- Second Wave Units: Latest
- Paragon: Latest

---

**Enjoy the apocalypse!** 🚀💀

*"When installation is complete, nuclear rain shall fall"*
