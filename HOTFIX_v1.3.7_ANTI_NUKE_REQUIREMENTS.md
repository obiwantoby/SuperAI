# HOTFIX v1.3.7 - Anti-Nuke Build Requirements Fix

**Date**: 2025-01-XX  
**Status**: ✅ Complete

## Issue Identified

User correctly identified that:
1. **Legion was using the STANDARD anti-nuke launcher** (12,000 metal) instead of the custom AI version (1,000 metal)
2. **Build conditions were unnecessarily restrictive**, requiring Advanced Power Plants despite the custom AI anti-nuke only costing 1,000 metal

## Root Cause

### Unit Mapping Issue
- **MLA**: Correctly mapped to `/pa/units/land/anti_nuke_launcher_ai/anti_nuke_launcher_ai.json` ✅
- **Legion**: Was mapped to `/pa/units/land/l_anti_nuke_launcher/l_anti_nuke_launcher.json` ❌ (standard version)

### Build Condition Issue
Both factions required:
```json
"unit_type_string0": "Structure & ((EnergyProduction & Advanced) | Factory)"
```

This meant the AI needed either:
- Advanced Power Plant (4,500 metal) + Factory (700 metal) = **5,200 metal minimum**
- OR just a Factory (700 metal)

But since the condition uses OR logic, it would often wait for Advanced Power, delaying anti-nuke construction.

## Fix Applied

### 1. Legion Unit Map Fix
**File**: `pa/ai_super/super_uber/unit_maps/legion.json`

**BEFORE**:
```json
"LegionDefenseAdvancedAntiNukeSilo": {
  "spec_id": "/pa/units/land/l_anti_nuke_launcher/l_anti_nuke_launcher.json"
}
```

**AFTER**:
```json
"LegionDefenseAdvancedAntiNukeSilo": {
  "spec_id": "/pa/units/land/anti_nuke_launcher_ai/anti_nuke_launcher_ai.json"
}
```

### 2. Build Conditions Simplification
**Files**: 
- `pa/ai_super/super_uber/fabber_builds/mla/defense_super.json`
- `pa/ai_super/super_uber/fabber_builds/legion/defense_super.json`

**BEFORE**:
```json
"unit_type_string0": "Structure & ((EnergyProduction & Advanced) | Factory)"
```

**AFTER**:
```json
"unit_type_string0": "Structure & Factory"
```

**Affected Builds** (both factions):
- Wave 1 (Priority 620)
- Main Defense (Priority 550)
- Commander (Priority 650)
- Rush (Priority 600)
- New Planet (Priority 950)

**Placement Rules Also Updated**:
```json
// BEFORE
"unit_type_string": "Commander | (Structure & ((EnergyProduction & Advanced) | Factory))"

// AFTER
"unit_type_string": "Commander | (Structure & Factory)"
```

## Impact

### Cost Comparison
| Faction | OLD Unit | OLD Cost | NEW Unit | NEW Cost | Savings |
|---------|----------|----------|----------|----------|---------|
| MLA | Custom AI | 1,000 | Custom AI | 1,000 | 0 (already correct) |
| Legion | Standard | 12,000 | Custom AI | 1,000 | **-11,000 metal (92%)** |

### Build Speed Comparison
| Faction | OLD Storage | OLD RoF | OLD Build Time | NEW Storage | NEW RoF | NEW Build Time | Improvement |
|---------|-------------|---------|----------------|-------------|---------|----------------|-------------|
| MLA | 25 | 3.0 | 5s | 25 | 3.0 | 5s | Already optimal |
| Legion | 3 | 1.5 | 180s | 25 | 3.0 | 5s | **8x storage, 2x RoF, 36x faster** |

### Build Requirements
| Requirement | OLD | NEW | Impact |
|-------------|-----|-----|--------|
| Metal Cost | Advanced Power (4,500) OR Factory (700) | Factory (700) | **-3,800 metal minimum** |
| Tech Level | T2 (Advanced) OR T1 | T1 only | **Earlier construction** |
| Build Time | Wait for T2 upgrade | Immediate after factory | **Faster deployment** |

## Expected Gameplay Impact

### 1. Legion Parity with MLA ✅
- Both factions now use identical custom AI anti-nuke launcher
- Both cost 1,000 metal (vs Legion's previous 12,000)
- Both have 25 storage capacity (vs Legion's previous 3)
- Both fire at 3.0 RoF (vs Legion's previous 1.5)

### 2. Faster Anti-Nuke Deployment 🚀
- AI can start building anti-nukes after first factory (700 metal)
- No longer waits for Advanced Power Plant (4,500 metal)
- Critical for Wave 1 (priority 620) to trigger early
- Should see 10+ anti-nukes much earlier in the game

### 3. T1 Economy Sufficient 💰
- Custom AI anti-nuke: 1,000 metal
- Basic Factory: 700 metal
- Basic Power Plant: 400 energy/sec (more than enough for 25 energy/sec drain)
- **Total requirement: ~1,100 metal** (easily affordable early game)

### 4. Better Resource Allocation 📊
- Saving 11,000 metal per silo (Legion)
- Can afford 12 AI anti-nukes for the cost of 1 standard anti-nuke
- Resources freed up for economy expansion, army production

## Verification

### Unit Maps
```powershell
# MLA: Should point to custom AI anti-nuke
grep "AntiNukeSilo" pa/ai_super/super_uber/unit_maps/ai_unit_map.json

# Legion: Should point to custom AI anti-nuke
grep "LegionDefenseAdvancedAntiNukeSilo" pa/ai_super/super_uber/unit_maps/legion.json
```

### Build Conditions
```powershell
# Should find NO references to "EnergyProduction & Advanced" in active files
grep -r "EnergyProduction & Advanced" pa/ai_super/super_uber/fabber_builds/
```

## Technical Details

### Custom AI Anti-Nuke Specs
**File**: `/pa/units/land/anti_nuke_launcher_ai/anti_nuke_launcher_ai.json`

```json
{
  "base_spec": "/pa/units/land/base_structure/base_structure.json",
  "display_name": "Anti-Nuke Silo (AI Super)",
  "description": "Enhanced AI-exclusive anti-nuke launcher",
  "build_metal_cost": 1000,
  "max_health": 5000,
  "storage": {
    "metal": 0,
    "energy": 25
  },
  "production": {
    "energy": -25
  },
  "unit_types": [
    "UNITTYPE_Structure",
    "UNITTYPE_Defense",
    "UNITTYPE_NukeDefense",
    "UNITTYPE_FabBuild",
    "UNITTYPE_FabAdvBuild",
    "UNITTYPE_CombatFabBuild"
  ],
  "factory_cooldown_time": 5
}
```

**Key Features**:
- 92% cheaper than standard (1,000 vs 12,000 metal)
- 8x storage capacity (25 vs 3 missiles)
- 36x faster missile production (5s vs 180s)
- 2x fire rate (3.0 vs 1.5 RoF via custom weapon)
- 83% cheaper missiles (100 vs 600 metal)
- Buildable by T1 engineers (UNITTYPE_FabBuild)

### Wave System
**Target**: 50+ anti-nuke silos per planet

**Wave 1** (Priority 620, 10 silos, 0→10):
- Triggers when planet has 0-10 anti-nukes
- 10 assisters, builds up to 10 silos
- **NEW**: Only requires basic Factory (700 metal)

**Wave 2** (Priority 615, 15 silos, 10→25):
- Triggers when planet has 10-25 anti-nukes
- Builds 15 more silos (total 25)

**Wave 3** (Priority 610, 25 silos, 25→50):
- Triggers when planet has 25-50 anti-nukes
- Builds 25 more silos (total 50+)

## Related Issues

### Still Using Standard Nukes ⚠️
- SuperAI still uses standard nuke silos (50,000 metal, 180s build time)
- Should create custom AI nuke launcher (5,000 metal, 30s build)
- Should create custom AI nuke missile (5,000 metal, 30s build)
- **Priority**: CRITICAL for offensive capability

### No Dox Defense ⚠️
- T1 laser turrets at priority 630 (too low)
- Should be priority 850+ for early rush defense
- Should build 10+ turrets per base
- **Priority**: HIGH for early game survival

### No Scouting ⚠️
- No continuous scout production (Firefly/Skitter)
- Radar priority 800 (too low, should be 250)
- No orbital radar satellites
- **Priority**: HIGH for intel and map awareness

## Testing Checklist

- [ ] Verify Legion uses custom AI anti-nuke in-game
- [ ] Confirm AI starts building anti-nukes immediately after first factory
- [ ] Check that Wave 1 triggers at 0-10 silos (priority 620)
- [ ] Verify 50+ anti-nukes are built per planet
- [ ] Compare Legion vs MLA anti-nuke performance (should be identical)
- [ ] Monitor economy - should have resources for other builds
- [ ] Test against heavy nuke spam (50+ nukes)

## Version History

- **v1.3.6**: Created wave system, removed shared_instance_count
- **v1.3.7**: Fixed Legion unit map, removed Advanced structure requirements ✅

## Next Steps

1. **Custom AI Nukes** (Priority: CRITICAL)
   - Create custom nuke launcher (5,000 metal, 30s build)
   - Create custom nuke missile (5,000 metal, 30s build)
   - Update unit maps for both factions

2. **Dox Rush Defense** (Priority: HIGH)
   - Increase T1 laser turret priority (630 → 850)
   - Build 10+ turrets per base
   - Add Dox production builds (priority 750)

3. **Intelligence System** (Priority: HIGH)
   - Reduce radar priority (800 → 250)
   - Add continuous scout production
   - Add orbital radar satellite builds

4. **Harassment System** (Priority: MEDIUM)
   - Add Dox raid platoons
   - Add MEX snipe platoons
   - Add bomber harassment builds

---

**User Quote**: "Since it is SO cheap it doesn't need to have the requirements of advanced plants."

✅ **Fixed**: Both factions now only require basic Factory (700 metal) to build the 1,000-metal custom AI anti-nuke launcher.
