# SuperAI

**An elite AI personality based on Queller AI Uber with aggressive modded unit integration**

## Overview

SuperAI is a custom AI opponent designed for maximum challenge in Planetary Annihilation: TITANS. Built on the proven Queller AI Uber foundation, it adds intelligent use of Second Wave units, Paragon economy, and devastating late-game nuclear capabilities.

## Features

### Based on Queller AI Uber
- Uses Queller AI's smart economy management and micro
- Personality parameters: Same as Q-Uber for consistency
- Proven baseline that beats vanilla AI reliably

### Second Wave Unit Integration (Priority 150)
**Combat Units - Aggressively Built:**
- **Rex** (Heavy Assault Bot) - 3-4 adv mex, 75% efficiency
- **Centaur** (Heavy Tank) - 3-4 adv mex, 75% efficiency
- **Stalker** (Stealth Tank) - 3-4 adv mex, 75% efficiency
- **Saxon** (Heavy Assault Ship) - 3-4 adv mex, 75% efficiency
- **Swordfish** (Heavy Torpedo Ship) - 3-4 adv mex, 75% efficiency
- **Andreas** (Advanced Orbital Fighter) - 5-6 adv mex, 75% efficiency

**Defensive Structures - Reactively Built (Priority 401-402):**
- **Spear** (Anti-Orbital Defense) - Builds when orbital threats detected
- **Pounder** (Long-Range Artillery) - Builds when base threatened
- **Anti-Missile Tower** - Builds alongside nuke defense

### Advanced Fabber Production (10:1 Ratio)
All factory types produce **10 fabbers per factory** (vs vanilla 1-2):
- Bot factories: 10 advanced fabbers
- Vehicle factories: 10 advanced fabbers
- Air factories: 10 advanced fabbers
- Naval factories: 10 advanced fabbers
- **Orbital factories: 10 orbital fabbers** ← Critical for orbital dominance

Result: SuperAI builds structures 10x faster than vanilla Queller

### AI-Exclusive Enhanced Units (Hidden from Players)
SuperAI has access to **AI-only versions** of economy and defense structures that are **invisible to players** but provide massive advantages:

**Economy Boost (4x Production):**
- **Metal Extractor AI**: 28 metal/sec (vs 7 stock) - 400% boost
- **Energy Plant AI**: 2,400 energy/sec (vs 600 stock) - 400% boost
- Cost: Same as stock (170 metal, 450 metal respectively)
- AI builds these instead of stock economy structures

**Defense Boost (Massive Cost Reduction):**
- **Anti-Nuke Launcher AI**: 1,000 metal (vs 21,000 stock) - 95% cheaper
  - Missile reload: 5 seconds (vs 60s stock) - 12x faster
  - Missile cost: 200 metal (vs 5,000 stock) - 96% cheaper
  - Includes anti-orbital ion cannon
- **Ion Defense AI (Umbrella)**: 500 metal (vs 2,400 stock) - 79% cheaper
  - Full ion beam + anti-drop pod + tactical missile capabilities

**How It Works:**
1. Units copied from stock PA/TITANS files
2. Stats modified (production/cost)
3. Added to `pa/units/unit_list.json` (game engine loads them)
4. NO `shared_build.js` registration (hidden from build menus)
5. AI builds via `unit_maps/ai_unit_map.json` mapping
6. Players cannot see or build these units

**Technical Implementation:**
- Based on Paragon mod pattern (copy stock + enhance)
- Uses `UNITTYPE_Custom58` for mod compatibility
- Stock-perfect file format ensures game engine compatibility
- See "Creating AI-Exclusive Units" section below for details

### Paragon Economy (Priority 525)
**Economy Victory Path:**
- First Paragon: Priority 525 (8+ adv mex, 5+ adv energy, 3+ factories)
- Builds alongside nukes for exponential power scaling
- Only builds 1 Paragon (sufficient for GOD MODE)

### Nuclear Apocalypse
**Progressive Nuke Spam:**
- Priority 520: 2 Nuke Silos (8+ adv mex)
- Priority 560: 3 Nuke Silos (12+ adv mex)
- Priority 620: 5 Nuke Silos (15+ adv mex)

**GOD MODE (Priority 670) - Activates when Paragon completes:**
- **100 Nuke Silos** (50-100 assisters each)
- **Unlimited Omega Battleships** (50 assisters per Omega)
- **Unlimited Unit Cannons** (50-100 assisters each)
- Requires: 1+ Paragon + 90%+ efficiency
- Result: Apocalyptic military production

## Requirements

### Required Mods:
1. **Queller AI** - Base AI framework
2. **Second Wave Units (pa.mla.unit.addon)** - Adds Rex, Centaur, Stalker, etc.
3. **Paragon (com.pa.brandon.paragon)** - Infinite economy structure

### Recommended:
- High-performance PC (GOD MODE can spawn 10,000+ fabbers)
- Large metal planets for full economy potential
- Multiple Paragons for maximum insanity

## Installation

1. Install required mods (Queller AI, Second Wave, Paragon)
2. Copy `com.pa.super.ai` folder to your PA mods directory:
   - Windows: `%LOCALAPPDATA%\Uber Entertainment\Planetary Annihilation\mods\`
3. Enable the mod in PA
4. Select "SuperAI" from AI opponent list in skirmish/multiplayer

## Gameplay Strategy

### Early Game (Priority 97-150)
- Queller-style economy expansion
- Second Wave combat units mixed with vanilla units
- Aggressive but economically gated

### Mid Game (Priority 520-565)
- 2-3 Nuke Silos start launching
- First Paragon starts construction
- Advanced fabber swarms building structures
- Orbital control established (3 fabbers per orbital factory)

### Late Game - GOD MODE (Priority 670)
**When Paragon completes, the apocalypse begins:**
1. 100 nuke silos start construction simultaneously
2. All orbital factories spam unlimited Omegas
3. Advanced fabbers build unlimited Unit Cannons across planet
4. Up to 10,000 fabbers active on nukes alone
5. Continuous nuclear bombardment of all enemy planets
6. Orbital armada dominates space
7. Unit Cannons project armies globally

## Difficulty Comparison

- **Vanilla Absurd AI**: Cheats with economy bonus
- **Queller Uber**: No cheats, smart economy + tactics
- **SuperAI**: Queller Uber + 4x economy boost + cheap defenses + Paragon GOD MODE

SuperAI is designed to be **the ultimate challenge** for experienced players. The AI gets:
- 4x metal production from T1 extractors (28 vs 7)
- 4x energy production from T1 plants (2,400 vs 600)
- 95% cheaper anti-nukes (1,000 vs 21,000) with 12x faster reload
- 79% cheaper orbital defense (500 vs 2,400)

These are **AI-exclusive units** that players cannot see or build. Fair? No. Fun? Maybe. Challenging? Absolutely.

## Performance Notes

### GOD MODE Performance Impact:
- 100 nuke silos × 100 assisters = **10,000 fabbers on nukes**
- Unlimited Omegas building from all orbital factories
- Unlimited Unit Cannons with 50-100 assisters each
- Total: Potentially 15,000+ active fabbers

**Recommendations:**
- High-end CPU for pathfinding calculations
- 16GB+ RAM recommended
- May cause lag on lower-end systems
- Consider limiting to 1 Paragon for "reasonable" GOD MODE

## Technical Details

### Priority Structure:
```
97-100: T1 economy expansion (Queller baseline)
150: Second Wave combat units (economy-gated)
401-402: Defensive structures (reactive)
520: 2 Nuke Silos
525: First Paragon
560: 3 Nuke Silos
565: Additional Paragons
620: 5 Nuke Silos
670: GOD MODE (100 nukes + unlimited Omegas/Unit Cannons)
```

### Personality Parameters (Same as Queller Uber):
- metal_drain_check: 0.54
- energy_drain_check: 0.72
- metal_demand_check: 0.8
- energy_demand_check: 0.8
- micro_type: 2 (best micro)
- go_for_the_kill: true
- neural_data_mod: 1.0
- personality_tags: ["queller"]

## Creating AI-Exclusive Units

SuperAI uses a proven pattern for creating enhanced units that only the AI can build. This technique is based on the Paragon mod structure.

### The Pattern (Learned from Paragon Mod)

**What Makes Units Visible to Players (Paragon):**
```
pa/units/land/paragon/paragon.json          ← Unit file
pa/units/unit_list.json                     ← Game engine loads it
ui/mods/.../shared_build.js                 ← Registers in build menu ✅
modinfo.json with "scenes": {"shared_build"} ← Enables UI registration
```

**What Hides Units from Players (SuperAI):**
```
pa/units/land/metal_extractor_ai/metal_extractor_ai.json  ← Unit file
pa/units/unit_list.json                                    ← Game engine loads it
NO shared_build.js                                          ← NOT in build menu ✅
NO "shared_build" in modinfo.json                          ← No UI registration
```

### Step-by-Step Process

**1. Copy Exact Stock Unit File**
```powershell
# Example: Enhanced metal extractor
Copy-Item "C:\PA\media\pa\units\land\metal_extractor\metal_extractor.json" `
          ".\pa\units\land\metal_extractor_ai\metal_extractor_ai.json"
```

**2. Modify ONLY Stats (Keep Everything Else Stock)**
```json
{
  "base_spec": "/pa/units/land/base_structure/base_structure.json",
  "production": {
    "metal": 28  // Changed from 7 (4x boost)
  },
  "unit_types": [
    "UNITTYPE_Structure",
    "UNITTYPE_Basic",
    "UNITTYPE_MetalProduction",
    // ... all stock types ...
    "UNITTYPE_Custom58"  // Added for mod compatibility
  ]
  // Everything else IDENTICAL to stock
}
```

**3. Add to unit_list.json**
```json
{
  "units": [
    "/pa/units/land/metal_extractor_ai/metal_extractor_ai.json",
    "/pa/units/land/energy_plant_ai/energy_plant_ai.json",
    "/pa/units/orbital/ion_defense_ai/ion_defense_ai.json",
    "/pa/units/land/anti_nuke_launcher_ai/anti_nuke_launcher_ai.json"
  ]
}
```

**4. Map in AI Unit Map**
```json
// pa/ai_super/super_uber/unit_maps/ai_unit_map.json
{
  "BasicMetalExtractor": {
    "spec_id": "/pa/units/land/metal_extractor_ai/metal_extractor_ai.json"
  }
}
```

**5. DO NOT Create shared_build.js**
- No UI registration = Players cannot see or build
- AI uses unit_map.json to find and build units
- Game engine loads via unit_list.json

### Critical Rules

**✅ DO:**
- Copy exact stock files (including all fields, spacing, structure)
- Modify only stats (production, cost, reload time, etc.)
- Add `UNITTYPE_Custom58` to unit_types array
- Add to `pa/units/unit_list.json`
- Update AI unit_map.json to point to AI version
- Keep `"context": "server"` in modinfo.json

**❌ DON'T:**
- Create units from scratch (causes subtle incompatibilities)
- Add fake unit types (UNITTYPE_Extractor, etc. don't exist)
- Create shared_build.js (exposes to players)
- Add "shared_build" to modinfo.json scenes
- Modify fields you don't need to change

### Example: All AI-Exclusive Units in SuperAI

**Metal Extractor AI:**
- Base: `/pa/units/land/metal_extractor/metal_extractor.json`
- Change: `production.metal: 7 → 28` (4x)
- Add: `UNITTYPE_Custom58`
- Result: AI gets 4x metal from T1 extractors

**Energy Plant AI:**
- Base: `/pa/units/land/energy_plant/energy_plant.json`
- Change: `production.energy: 600 → 2400` (4x)
- Add: `UNITTYPE_Custom58`
- Result: AI gets 4x energy from T1 plants

**Anti-Nuke Launcher AI:**
- Base: `/pa/units/land/anti_nuke_launcher/anti_nuke_launcher.json`
- Change: `build_metal_cost: 21000 → 1000` (95% cheaper)
- Change: `factory_cooldown_time: 60 → 5` (12x faster)
- Change ammo: `build_metal_cost: 5000 → 200` (96% cheaper)
- Add: Ion cannon tool from enhanced mod
- Result: AI spams anti-nukes effortlessly

**Ion Defense AI:**
- Base: Enhanced ion defense mod
- Change: `build_metal_cost: 2200 → 500` (79% cheaper)
- Add: `UNITTYPE_Custom58`
- Result: AI blankets orbit with umbrellas

### Why This Works

1. **Game Engine Loading**: `unit_list.json` tells PA to load the unit definitions
2. **AI Recognition**: `unit_maps/ai_unit_map.json` maps friendly names to AI versions
3. **Player Hiding**: Absence of `shared_build.js` means no build menu registration
4. **Stock Compatibility**: Copying exact stock files ensures all required fields present

### Debugging Tips

**If AI doesn't build units:**
- Verify unit exists in `pa/units/unit_list.json`
- Check unit_map.json points to correct path
- Confirm JSON is valid (use ConvertFrom-Json test)
- Ensure file copied to server_mods directory
- Restart PA to clear cache

**If players can see units:**
- Check for accidental shared_build.js creation
- Verify modinfo.json has no "shared_build" scene
- Confirm UI folder doesn't register units

## Version History

**v1.1.0** - AI-Exclusive Enhanced Units (Current)
- Added AI-exclusive economy units (4x production boost)
  - Metal Extractor AI: 28 metal/sec (vs 7 stock)
  - Energy Plant AI: 2,400 energy/sec (vs 600 stock)
- Added AI-exclusive defense units (massive cost reduction)
  - Anti-Nuke Launcher AI: 1,000 metal, 5s reload (vs 21,000 metal, 60s)
  - Ion Defense AI: 500 metal (vs 2,400 stock)
- Implemented Paragon pattern: copy stock + enhance + no UI registration
- Created `pa/units/unit_list.json` for game engine loading
- Units hidden from players but AI builds via unit_map.json
- Increased fabber ratios from 3:1 to 10:1 (333% increase)
- Limited to 1 Paragon build (sufficient for GOD MODE)
- Comprehensive documentation on creating AI-exclusive units

**v1.0.0** - Initial Release
- Based on Queller AI v8.0 Uber
- Second Wave unit integration (priority 150)
- Defensive structures reactive (priority 401+)
- Advanced fabber production 3:1 (all factories)
- Paragon parallel with nukes (525/565)
- GOD MODE nuclear apocalypse (670)
  - 100 nuke silos
  - Unlimited Omega spam
  - Unlimited Unit Cannon spam

## Credits

- **Base AI**: Queller AI by Quitch
- **SuperAI Implementation**: Brandon
- **Second Wave Units**: MLA Unit Addon creators
- **Paragon**: Brandon

## Support

For issues or suggestions, check the PA forums or mod Discord.

**Warning**: This AI becomes godlike when Paragon completes. Use at your own risk. May cause existential dread when you see "100 Nuke Silos" in the build queue. 🚀💀

---

*"When one Paragon becomes 100 nukes"*
