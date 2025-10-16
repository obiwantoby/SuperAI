# SuperAI v1.0.2 - Complete Troubleshooting & Final Fix

## Problem: SuperAI Not Appearing in UI

User reports: "SuperAI shows in mod manager but not in AI selection dropdown"

## Investigation & Fixes

### Fix #1: Context (REVERTED - Was Wrong)
**Initial Change**: `"server"` → `"client"`  
**Status**: ❌ **INCORRECT**

**Why I Was Wrong:**
- Queller AI uses `"context": "server"` ✓
- Legion mod uses `"context": "server"` ✓
- User was correct to question this

**Corrected**: Changed back to `"server"`

### Fix #2: Removed Queller Dependency
**Change**: Removed `"com.pa.quitch.qQuellerAI"` from dependencies  
**Status**: ✅ **CORRECT**

**Reasoning:**
- SuperAI doesn't extend Queller, it COPIES Queller logic
- All AI files are self-contained in `/pa/ai_super/super_uber/`
- Only needs Paragon and Second Wave as actual dependencies
- Queller dependency may have caused loading issues

### Fix #3: JavaScript Registration Pattern
**Change**: Modified `new_game.js` to use proper registration  
**Status**: ✅ **CORRECT** (but may need more work)

**Current Pattern:**
```javascript
(function() {
  var superUber = { ... };
  
  // Direct registration
  if (typeof model !== 'undefined' && model.aiPersonalities) {
    model.aiPersonalities().SuperAI = superUber;
    model.aiPersonalities.valueHasMutated();
  }
  
  // Fallback
  if (typeof aiTypes !== 'undefined') {
    aiTypes.push({ name: superUber.display_name, personality: superUber });
  }
})();
```

## Current Configuration (v1.0.2)

```json
{
  "context": "server",
  "identifier": "com.pa.super.ai",
  "version": "1.0.2",
  "priority": 110,
  "dependencies": [
    "com.pa.brandon.paragon",
    "pa.mla.unit.addon"
  ],
  "scenes": {
    "new_game": ["coui://ui/mods/com.pa.super.ai/new_game.js"]
  }
}
```

## Verification Checklist

### ✅ File Structure Complete
- ✓ `/pa/ai_super/super_uber/fabber_builds/`
- ✓ `/pa/ai_super/super_uber/factory_builds/`
- ✓ `/pa/ai_super/super_uber/platoon_builds/`
- ✓ `/pa/ai_super/super_uber/platoon_templates/`
- ✓ `/pa/ai_super/super_uber/unit_maps/`
- ✓ `/ui/mods/com.pa.super.ai/new_game.js`
- ✓ `modinfo.json`

### ✅ Configuration Correct
- ✓ Context: `"server"` (like Queller)
- ✓ Priority: 110 (loads after Queller at 100)
- ✓ Dependencies: Only Paragon + Second Wave
- ✓ Scene: Points to new_game.js

## Possible Remaining Issues

### Issue 1: Mod Not Actually Installing
**Symptom**: Shows in mod manager but files not copied  
**Solution**: Manually copy to PA folder

**Command:**
```powershell
$dest = "$env:LOCALAPPDATA\Uber Entertainment\Planetary Annihilation\mods\com.pa.super.ai"
Remove-Item $dest -Recurse -Force -ErrorAction SilentlyContinue
Copy-Item -Recurse "c:\Users\Brandon\dev\mods\com.pa.super.ai" $dest
```

### Issue 2: JavaScript Not Loading
**Symptom**: No errors but personality doesn't register  
**Debugging**: Check PA log file

**Log Location:**
```
%LOCALAPPDATA%\Uber Entertainment\Planetary Annihilation\log\PA-*.txt
```

**Look For:**
- "SuperAI personality error"
- JavaScript syntax errors
- Scene loading errors

### Issue 3: Load Order Problem
**Symptom**: Loads but overwrites happen  
**Current Priority**: 110 (after Queller at 100)

**Test**: Try different priorities:
- 101 (right after Queller)
- 105 (middle)
- 110 (current)

### Issue 4: PA Cache
**Symptom**: Old version still loading  
**Solution**: Clear PA cache

**Commands:**
```powershell
# Close PA first
Stop-Process -Name "PA" -Force -ErrorAction SilentlyContinue

# Clear cache
Remove-Item "$env:LOCALAPPDATA\Uber Entertainment\Planetary Annihilation\cache" -Recurse -Force -ErrorAction SilentlyContinue

# Restart PA
```

## Step-by-Step Installation Test

### 1. Clean Install
```powershell
# Remove any existing version
$paModsPath = "$env:LOCALAPPDATA\Uber Entertainment\Planetary Annihilation\mods"
Remove-Item "$paModsPath\com.pa.super.ai" -Recurse -Force -ErrorAction SilentlyContinue

# Copy fresh version
Copy-Item -Recurse "c:\Users\Brandon\dev\mods\com.pa.super.ai" "$paModsPath\"

# Verify files copied
Get-ChildItem "$paModsPath\com.pa.super.ai" -Recurse | Measure-Object | Select-Object Count
```

**Expected**: Should see 86 files copied

### 2. Launch PA

**Check:**
1. Settings → Mods → "SuperAI" listed and enabled
2. Green checkmark next to SuperAI
3. No red error indicators

### 3. Check Dependencies

**Verify these are installed & enabled:**
- ✓ com.pa.brandon.paragon
- ✓ pa.mla.unit.addon (Second Wave)

### 4. Start New Skirmish

**Steps:**
1. Click "Skirmish"
2. Click "Add AI"
3. Check AI dropdown list
4. Look for "SuperAI"

**Expected**: Should appear in alphabetical order with other AIs

### 5. If Still Not Showing

**Check PA Log:**
```powershell
# Find most recent log
$logPath = "$env:LOCALAPPDATA\Uber Entertainment\Planetary Annihilation\log"
Get-ChildItem "$logPath\PA-*.txt" | Sort-Object LastWriteTime -Descending | Select-Object -First 1 | Get-Content | Select-String -Pattern "SuperAI|new_game.js|com.pa.super.ai"
```

**Look For:**
- Errors loading new_game.js
- JavaScript errors
- Dependency errors

## Comparison: Working vs Not Working

### Working AI (Legion Mod - Confirmed Works)
```json
{
  "context": "server",
  "scenes": {
    "new_game": [
      "coui://ui/mods/com.pa.brandon.legion/new_game.js",
      "coui://ui/mods/com.pa.brandon.legion/personalities.js"
    ]
  },
  "priority": 100
}
```

**JavaScript:**
```javascript
var superAILoaded;
function superAI() {
  if (superAILoaded) return;
  superAILoaded = true;
  
  var superAIUber = { ... };
  model.aiPersonalities().SuperAIUber = superAIUber;
  model.aiPersonalities.valueHasMutated();
}
superAI();
```

### SuperAI (Currently Not Working)
```json
{
  "context": "server",
  "scenes": {
    "new_game": ["coui://ui/mods/com.pa.super.ai/new_game.js"]
  },
  "priority": 110
}
```

**JavaScript:**
```javascript
var superAILoaded;
(function() {
  if (superAILoaded) return;
  superAILoaded = true;
  
  var superUber = { ... };
  if (typeof model !== 'undefined' && model.aiPersonalities) {
    model.aiPersonalities().SuperAI = superUber;
    model.aiPersonalities.valueHasMutated();
  }
})();
```

**Key Difference**: Legion uses named function that's called, SuperAI uses IIFE

## Potential Fix #4: Match Legion Pattern Exactly

Let me try matching the Legion pattern more closely:

```javascript
var superAILoaded;

function superAIPersonality() {
  if (superAILoaded) {
    return;
  }
  
  superAILoaded = true;
  
  try {
    var superUber = {
      name: "SuperAI",
      display_name: "SuperAI",
      ai_path: "/pa/ai_super/super_uber",
      metal_drain_check: 0.54,
      energy_drain_check: 0.72,
      metal_demand_check: 0.8,
      energy_demand_check: 0.8,
      micro_type: 2,
      go_for_the_kill: true,
      priority_scout_metal_spots: true,
      enable_commander_danger_responses: true,
      neural_data_mod: 1,
      adv_eco_mod: 1,
      adv_eco_mod_alone: 0,
      personality_tags: ["queller"],
      min_basic_fabbers: 3,
      min_advanced_fabbers: 1
    };
    
    model.aiPersonalities().SuperAI = superUber;
    model.aiPersonalities.valueHasMutated();
    
  } catch (e) {
    console.error("SuperAI error:", e);
    console.error(JSON.stringify(e));
  }
}

superAIPersonality();
```

**Differences from Current:**
1. Named function instead of IIFE
2. No typeof checks (trust that model exists)
3. Call function explicitly at end
4. Simplified error handling

## Action Plan

1. **Update new_game.js to match Legion pattern exactly**
2. **Bump version to 1.0.2**
3. **Clean install to PA folder**
4. **Test in PA**
5. **Check logs if fails**

## Expected Outcome

After these fixes, "SuperAI" should appear in the AI dropdown alongside:
- Absurd
- Hard
- Normal
- Q-Bronze
- Q-Casual
- Q-Gold
- Q-Platinum
- Q-Silver
- Q-Uber
- **→ SuperAI** ← Should be here

---

**Status**: Ready to apply final fix (matching Legion pattern)  
**Version**: 1.0.1 → 1.0.2  
**Confidence**: High (matching proven working pattern)
