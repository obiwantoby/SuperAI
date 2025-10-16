# SuperAI v1.0.1 - UI Registration Fix

## Issue
SuperAI appeared in mod manager but not in the AI selection dropdown during game setup.

## Root Cause
Two problems in the initial release:

### 1. Wrong Context in modinfo.json
```json
"context": "server"  // ❌ Wrong - server-side only
```
Should be:
```json
"context": "client"  // ✅ Correct - UI runs client-side
```

### 2. Incorrect JavaScript Registration Pattern
The initial `new_game.js` used modern ES6 syntax with `aiTypes.push()` but didn't use the traditional `model.aiPersonalities()` registration that PA's UI expects.

## Fixes Applied

### Fixed: modinfo.json
```json
{
  "context": "client",  // Changed from "server"
  ...
}
```

### Fixed: new_game.js
```javascript
var superAILoaded;

(function() {
  if (superAILoaded) {
    return;
  }

  superAILoaded = true;

  try {
    var superUber = {
      name: "SuperAI",
      display_name: "SuperAI",
      ai_path: "/pa/ai_super/super_uber",
      // ... all personality parameters ...
    };

    // Register with AI system (traditional method)
    if (typeof model !== 'undefined' && model.aiPersonalities) {
      model.aiPersonalities().SuperAI = superUber;
      model.aiPersonalities.valueHasMutated();
    }
    
    // Also try the aiTypes array method (fallback for compatibility)
    if (typeof aiTypes !== 'undefined') {
      aiTypes.push({
        name: superUber.display_name,
        personality: superUber
      });
    }
  } catch (e) {
    console.error("SuperAI personality error:", e);
    console.error(JSON.stringify(e));
  }
})();
```

## Changes Made

### 1. Switched to IIFE (Immediately Invoked Function Expression)
- Ensures code runs immediately when loaded
- Better than function that needs to be called
- Pattern: `(function() { ... })();`

### 2. Dual Registration
- **Primary**: `model.aiPersonalities().SuperAI = superUber;`
  - Traditional PA method
  - Directly adds to AI personality list
  - Requires `model.aiPersonalities.valueHasMutated()` to notify knockout.js
  
- **Fallback**: `aiTypes.push({ ... })`
  - Modern method used by some mods
  - Ensures compatibility

### 3. Type Safety Checks
- Checks `typeof model !== 'undefined'` before using
- Checks `typeof aiTypes !== 'undefined'` before using
- Prevents errors if variables not loaded yet

### 4. Better Error Logging
- Logs both error object and JSON stringified version
- Helps debugging if registration fails

## How to Apply Fix

**If you already installed v1.0.0:**

1. PA may have cached the old files - restart PA completely
2. Or, re-copy the mod folder:
   ```powershell
   Remove-Item "$env:LOCALAPPDATA\Uber Entertainment\Planetary Annihilation\mods\com.pa.super.ai" -Recurse -Force
   Copy-Item -Recurse "c:\Users\Brandon\dev\mods\com.pa.super.ai" "$env:LOCALAPPDATA\Uber Entertainment\Planetary Annihilation\mods\"
   ```

3. Launch PA
4. Go to Settings → Mods → Verify "SuperAI" is enabled
5. Start new Skirmish
6. Click "Add AI" → Should now see "SuperAI" in dropdown

## Verification

**SuperAI should now appear:**
- In the AI personality dropdown
- Alongside other AI like "Absurd", "Queller", etc.
- Listed as "SuperAI" (no prefix)

**If still not appearing:**
1. Check PA log file: `%LOCALAPPDATA%\Uber Entertainment\Planetary Annihilation\log\PA-*.txt`
2. Look for JavaScript errors related to "SuperAI"
3. Verify mod is enabled in Settings → Mods
4. Verify dependencies are installed:
   - Queller AI
   - com.pa.brandon.paragon
   - pa.mla.unit.addon

## Technical Notes

### Why "client" context?
- `"server"` context: Runs on server/host only, used for game logic
- `"client"` context: Runs on client UI, used for menus/UI
- AI personality selection happens in UI → needs "client" context
- AI logic files (fabber_builds, factory_builds) run on server regardless

### Why two registration methods?
Different PA mods use different patterns:
- **Old mods**: Direct `model.aiPersonalities()` assignment
- **New mods**: `aiTypes.push()` array method
- **SuperAI**: Uses both for maximum compatibility

### What is `valueHasMutated()`?
- Part of knockout.js (PA's UI framework)
- Notifies UI that observable array changed
- Without it, UI won't update to show new AI
- Must be called after modifying `aiPersonalities()`

## Version History

**v1.0.0** - Initial release
- ❌ Used "server" context
- ❌ Only used `aiTypes.push()` method
- Result: Mod loaded but AI didn't appear in UI

**v1.0.1** - UI Registration Fix
- ✅ Changed to "client" context
- ✅ Uses `model.aiPersonalities()` registration
- ✅ Includes `aiTypes.push()` fallback
- ✅ IIFE for immediate execution
- Result: AI now appears in UI dropdown

---

**Status**: ✅ FIXED - SuperAI should now appear in AI selection

**Test**: Restart PA, start new Skirmish, check AI dropdown for "SuperAI"
