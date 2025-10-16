# AI-Exclusive Units - Technical Reference

## Overview

SuperAI v1.1.0 implements **AI-exclusive enhanced units** that are invisible to players but provide massive economic and defensive advantages to the AI. This document explains the technical implementation.

## The Four AI-Exclusive Units

### 1. Metal Extractor AI
**File**: `/pa/units/land/metal_extractor_ai/metal_extractor_ai.json`

**Stats**:
- Production: **28 metal/sec** (stock: 7 metal/sec) = **4x boost**
- Cost: 170 metal (same as stock)
- All other properties: Identical to stock

**Impact**: AI gets 4x metal income from T1 extractors, enabling much faster tech progression.

### 2. Energy Plant AI
**File**: `/pa/units/land/energy_plant_ai/energy_plant_ai.json`

**Stats**:
- Production: **2,400 energy/sec** (stock: 600 energy/sec) = **4x boost**
- Cost: 450 metal (same as stock)
- All other properties: Identical to stock

**Impact**: AI gets 4x energy income from T1 plants, supporting massive fabber swarms.

### 3. Anti-Nuke Launcher AI
**File**: `/pa/units/land/anti_nuke_launcher_ai/anti_nuke_launcher_ai.json`

**Stats**:
- Cost: **1,000 metal** (stock: 21,000 metal) = **95% cheaper**
- Reload time: **5 seconds** (stock: 60 seconds) = **12x faster**
- Missile cost: **200 metal** (stock: 5,000 metal) = **96% cheaper**
- Bonus: Includes anti-orbital ion cannon

**Impact**: AI can blanket bases with anti-nukes for trivial cost, making nuclear attacks nearly impossible.

### 4. Ion Defense AI (Umbrella)
**File**: `/pa/units/orbital/ion_defense_ai/ion_defense_ai.json`

**Stats**:
- Cost: **500 metal** (stock: 2,400 metal, enhanced: 2,200) = **79% cheaper**
- Features: Ion beam + anti-drop pods + tactical missiles
- All defensive capabilities: Same as enhanced mod

**Impact**: AI can saturate orbital space with umbrellas for minimal investment.

## Technical Implementation

### The Paragon Pattern

This implementation is based on studying the Paragon mod structure:

**Paragon Mod (Visible to Players)**:
```
pa/units/land/paragon/paragon.json          ← Unit definition
pa/units/unit_list.json                     ← Lists units for game engine
ui/mods/.../shared_build.js                 ← Registers in build menu ✅
modinfo.json scenes: {"shared_build": [...]} ← Enables UI registration
```

**SuperAI (Hidden from Players)**:
```
pa/units/land/metal_extractor_ai/...        ← Unit definition
pa/units/unit_list.json                     ← Lists units for game engine
NO shared_build.js                          ← NOT in build menu ✅
NO "shared_build" scene in modinfo.json     ← No UI registration
```

### File Structure

```
com.pa.super.ai/
├── modinfo.json (NO shared_build scene)
├── pa/
│   ├── units/
│   │   ├── unit_list.json ← Lists all 4 AI-exclusive units
│   │   ├── land/
│   │   │   ├── metal_extractor_ai/
│   │   │   │   └── metal_extractor_ai.json
│   │   │   ├── energy_plant_ai/
│   │   │   │   └── energy_plant_ai.json
│   │   │   └── anti_nuke_launcher_ai/
│   │   │       ├── anti_nuke_launcher_ai.json
│   │   │       ├── anti_nuke_launcher_ai_ammo.json
│   │   │       └── anti_nuke_launcher_tool_ion_weapon.json
│   │   └── orbital/
│   │       └── ion_defense_ai/
│   │           └── ion_defense_ai.json (+ tools/ammo)
│   └── ai_super/
│       └── super_uber/
│           └── unit_maps/
│               └── ai_unit_map.json ← Maps friendly names to AI versions
└── ui/
    └── mods/
        └── com.pa.super.ai/
            └── new_game.js (AI personality ONLY, not shared_build)
```

### Key Files

#### 1. unit_list.json
**Location**: `pa/units/unit_list.json`

**Purpose**: Tells game engine to load these unit definitions

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

**Critical**: Without this, game engine doesn't load units (even if AI scripts reference them).

#### 2. ai_unit_map.json
**Location**: `pa/ai_super/super_uber/unit_maps/ai_unit_map.json`

**Purpose**: Maps friendly names (used in AI build scripts) to actual unit file paths

```json
{
    "BasicMetalExtractor": {
        "spec_id": "/pa/units/land/metal_extractor_ai/metal_extractor_ai.json"
    },
    "BasicEnergyGenerator": {
        "spec_id": "/pa/units/land/energy_plant_ai/energy_plant_ai.json"
    },
    "Umbrella": {
        "spec_id": "/pa/units/orbital/ion_defense_ai/ion_defense_ai.json"
    },
    "AntiNukeSilo": {
        "spec_id": "/pa/units/land/anti_nuke_launcher_ai/anti_nuke_launcher_ai.json"
    }
}
```

**How AI Finds Units**:
1. AI build script says "build BasicMetalExtractor"
2. AI looks up "BasicMetalExtractor" in unit_map.json
3. Finds spec_id: `/pa/units/land/metal_extractor_ai/metal_extractor_ai.json`
4. Builds the AI-exclusive version (28 metal/sec) instead of stock (7 metal/sec)

#### 3. Unit Definition Files
**Example**: `metal_extractor_ai.json`

**Critical Rules**:
- ✅ **Copy exact stock file** (not handcraft from scratch)
- ✅ **Modify ONLY stats** (production, cost, reload, etc.)
- ✅ **Add `UNITTYPE_Custom58`** to unit_types array
- ✅ **Keep all other fields identical** to stock

**Why**: Handcrafted files have subtle incompatibilities (wrong area_build_separation, missing fields, wrong field order, etc.) that cause game engine to silently reject them.

**Example Diff (Metal Extractor)**:
```json
{
  "production": {
    "metal": 28  // CHANGED: was 7
  },
  "unit_types": [
    "UNITTYPE_Structure",
    "UNITTYPE_Basic",
    "UNITTYPE_MetalProduction",
    "UNITTYPE_CmdBuild",
    "UNITTYPE_FabBuild",
    "UNITTYPE_Economy",
    "UNITTYPE_Custom58"  // ADDED: for mod compatibility
  ]
  // Everything else: IDENTICAL to stock
}
```

#### 4. modinfo.json
**Critical**: NO "shared_build" scene

```json
{
  "context": "server",
  "scenes": {
    "new_game": ["coui://ui/mods/com.pa.super.ai/new_game.js"]
    // NO "shared_build" entry = units not in build menu
  }
}
```

## How It Works

### Loading Sequence

1. **Game Start**: PA loads `modinfo.json` files
2. **Unit Loading**: Game engine reads `pa/units/unit_list.json`
3. **Unit Parsing**: Game loads all 4 AI-exclusive unit definitions
4. **AI Initialization**: AI loads personality from `new_game.js`
5. **AI Mapping**: AI loads `unit_maps/ai_unit_map.json`
6. **Build Decision**: AI build script says "build BasicMetalExtractor"
7. **Unit Lookup**: AI looks up in unit_map → finds AI-exclusive version
8. **Construction**: AI builds metal_extractor_ai (28 metal/sec)

### Why Players Can't See Units

**Player Build Menu**:
1. Game looks for `shared_build.js` files
2. `shared_build.js` registers units in Build.HotkeyModel.SpecIdToGridMap
3. SuperAI has NO shared_build.js
4. Units never registered in build menu
5. Players cannot see or build them

**But AI Can Build**:
1. AI doesn't use build menus
2. AI uses unit_map.json for lookups
3. unit_map.json points to AI-exclusive versions
4. AI builds them normally via economy.json/factory_builds

### Verification

**Test 1: Player Cannot See Units**
- Open build menu as player
- Search for "Metal Extractor"
- Should see: Stock metal extractor (7 metal/sec)
- Should NOT see: Metal Extractor AI (28 metal/sec)
- ✅ Hidden successfully

**Test 2: AI Builds Enhanced Units**
- Start skirmish vs SuperAI
- Watch AI build metal extractors
- Check production: Should be 28 metal/sec (not 7)
- ✅ AI using enhanced version

**Test 3: Unit File Loading**
- Check PA logs for loading errors
- Should see: "Loading unit: /pa/units/land/metal_extractor_ai/..."
- Should NOT see: Loading errors or missing file warnings
- ✅ Game engine loaded units

## Creating New AI-Exclusive Units

### Step-by-Step Process

**Step 1: Copy Stock File**
```powershell
# Find stock unit in PA installation
$stockPath = "C:\Program Files (x86)\Steam\steamapps\common\Planetary Annihilation Titans\media\pa\units\land\energy_plant_adv\energy_plant_adv.json"

# Copy to your mod
Copy-Item $stockPath ".\pa\units\land\energy_plant_adv_ai\energy_plant_adv_ai.json"
```

**Step 2: Modify Stats Only**
```powershell
# Load, modify, save
$unit = Get-Content ".\pa\units\land\energy_plant_adv_ai\energy_plant_adv_ai.json" | ConvertFrom-Json
$unit.production.energy = 15000  # 4x of 3750
$unit.unit_types += "UNITTYPE_Custom58"
$unit | ConvertTo-Json -Depth 10 | Set-Content ".\pa\units\land\energy_plant_adv_ai\energy_plant_adv_ai.json"
```

**Step 3: Add to unit_list.json**
```json
{
    "units": [
        "/pa/units/land/energy_plant_adv_ai/energy_plant_adv_ai.json"
    ]
}
```

**Step 4: Map in ai_unit_map.json**
```json
{
    "AdvancedEnergyGenerator": {
        "spec_id": "/pa/units/land/energy_plant_adv_ai/energy_plant_adv_ai.json"
    }
}
```

**Step 5: Do NOT Create shared_build.js**
- No UI registration
- Units automatically hidden

### Common Mistakes

**❌ Mistake 1: Creating from scratch**
```json
// WRONG: Handcrafted file
{
  "base_spec": "/pa/units/land/base_structure/base_structure.json",
  "production": {"metal": 28},
  "unit_types": ["UNITTYPE_Structure"]
  // Missing 50+ fields, wrong field order, etc.
}
```

**✅ Correct: Copy stock + modify**
```powershell
Copy-Item stock.json ai_version.json
# Modify only stats via PowerShell/text editor
```

**❌ Mistake 2: Adding fake unit types**
```json
"unit_types": [
  "UNITTYPE_Extractor",  // DOESN'T EXIST IN PA!
  "UNITTYPE_Custom1"     // Might cause issues
]
```

**✅ Correct: Use stock types + Custom58**
```json
"unit_types": [
  // All stock types from original file
  "UNITTYPE_Custom58"  // Add this one only
]
```

**❌ Mistake 3: Forgetting unit_list.json**
```
pa/units/land/my_unit_ai/my_unit_ai.json exists
pa/units/unit_list.json missing or doesn't include it
```

**✅ Correct: Always add to unit_list.json**
```json
{"units": ["/pa/units/land/my_unit_ai/my_unit_ai.json"]}
```

## Debugging

### AI Not Building Units

**Check 1: unit_list.json**
```powershell
Get-Content ".\pa\units\unit_list.json" | ConvertFrom-Json
# Should list your AI-exclusive unit
```

**Check 2: JSON Validity**
```powershell
Get-Content ".\pa\units\land\my_unit_ai\my_unit_ai.json" | ConvertFrom-Json
# Should not error
```

**Check 3: File Installation**
```powershell
Test-Path "$env:LOCALAPPDATA\Uber Entertainment\Planetary Annihilation\server_mods\com.pa.super.ai\pa\units\land\my_unit_ai\my_unit_ai.json"
# Should return True
```

**Check 4: unit_map.json**
```powershell
Get-Content ".\pa\ai_super\super_uber\unit_maps\ai_unit_map.json" | ConvertFrom-Json
# Should have mapping: FriendlyName -> spec_id
```

### Players Can See Units

**Check 1: No shared_build.js**
```powershell
Get-ChildItem ".\ui\mods\com.pa.super.ai\" -Recurse -Filter "shared_build.js"
# Should return nothing (or error: no files found)
```

**Check 2: modinfo.json**
```powershell
Get-Content ".\modinfo.json" | ConvertFrom-Json | Select-Object -ExpandProperty scenes
# Should NOT have "shared_build" property
```

## Performance Impact

### Economy Boost Analysis

**Stock AI T1 Economy**:
- 20 metal extractors × 7 metal/sec = 140 metal/sec
- 10 energy plants × 600 energy/sec = 6,000 energy/sec

**SuperAI T1 Economy (Same Buildings)**:
- 20 metal extractors × 28 metal/sec = **560 metal/sec** (4x)
- 10 energy plants × 2,400 energy/sec = **24,000 energy/sec** (4x)

**Result**: SuperAI reaches T2 and Paragon 4x faster with same building count.

### Defense Cost Comparison

**Stock Anti-Nuke Defense**:
- 1 anti-nuke launcher: 21,000 metal
- 1 missile: 5,000 metal
- Total for 1 shot: 26,000 metal

**SuperAI Anti-Nuke Defense**:
- 1 anti-nuke launcher: 1,000 metal (95% cheaper)
- 1 missile: 200 metal (96% cheaper)
- Reload time: 5s (vs 60s = 12x faster)
- Total for 1 shot: 1,200 metal

**Result**: SuperAI can build 21 anti-nukes for the price of 1 stock anti-nuke.

## Changelog

**v1.1.0** - Initial Implementation
- Created 4 AI-exclusive units (metal extractor, energy plant, anti-nuke, ion defense)
- Implemented Paragon pattern (copy stock + enhance)
- Created unit_list.json for game engine loading
- Verified units hidden from players
- Documented complete technical implementation

---

**Last Updated**: October 8, 2025
**SuperAI Version**: 1.1.0
**Pattern Source**: Paragon mod by Brandon
