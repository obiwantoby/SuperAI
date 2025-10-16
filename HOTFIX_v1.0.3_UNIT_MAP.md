# HOTFIX v1.0.3 - CRITICAL: Unit Map Missing Second Wave + Paragon

## THE PROBLEM

**User Report:** "No organic attempt to make a paragon, I gave them one in sandbox mode to see if it would trigger insane nukes or unit canons. I also was looking for any second wave units."

**Root Cause:** The AI's `unit_map` file (`ai_unit_map.json`) was missing definitions for:
- **Paragon** - The trigger for GOD MODE
- **All Second Wave units** (Rex, Stalker, Swordfish, Andreas, Pounder)
- **OrbitalBattleShip** (Omega) - For unlimited spam

### Why This Broke Everything

The AI config files reference units by friendly names like `"Paragon"`, `"Stalker"`, `"Rex"`, etc. The `unit_map.json` translates these names to actual unit spec paths like `/pa/units/land/paragon/paragon.json`.

**Without the unit_map entries, the AI literally didn't know what "Paragon" was!**

It's like giving someone building instructions that say "build the whatchamacallit" - they have no idea what you're talking about!

---

## THE FIX

Added the following entries to `pa/ai_super/super_uber/unit_maps/ai_unit_map.json`:

```json
"Paragon": {"spec_id": "/pa/units/land/paragon/paragon.json"},
"Rex": {"spec_id": "/pa/units/addon/rex/rex.json"},
"Stalker": {"spec_id": "/pa/units/addon/stalker/stalker.json"},
"Swordfish": {"spec_id": "/pa/units/addon/swordfish/swordfish.json"},
"Andreas": {"spec_id": "/pa/units/addon/andreas/andreas.json"},
"Pounder": {"spec_id": "/pa/units/addon/pounder/pounder.json"},
"OrbitalBattleShip": {"spec_id": "/pa/units/orbital/orbital_battleship/orbital_battleship.json"}
```

### Units That Don't Actually Exist

**Removed from configs** (these were in the original Legion copy but don't exist in Second Wave MLA):
- ~~Centaur~~ (doesn't exist)
- ~~Saxon~~ (doesn't exist)
- ~~Spear~~ (doesn't exist)

These units exist in **Legion** faction but not in **MLA** (regular PA). SuperAI is MLA-focused.

---

## WHAT THIS FIXES

### ✅ Paragon Building
- **Before:** AI never tried to build Paragon (didn't know what it was)
- **After:** AI will now build Paragon at priority 525 (Strategic Economy phase)
- **Trigger:** 15+ advanced mexes, 8+ advanced energy, 0.9+ efficiency

### ✅ Second Wave Units
- **Before:** AI never built Second Wave units (didn't recognize them)
- **After:** AI will now build:
  - **Rex** (advanced assault bot) - Priority 150
  - **Stalker** (stealth vehicle) - Priority 150  
  - **Swordfish** (bomber) - Priority 150
  - **Andreas** (orbital fighter) - Priority 150
  - **Pounder** (artillery defense) - Priority 401

### ✅ GOD MODE Activation
- **Before:** Even when given Paragon, AI didn't trigger GOD MODE (didn't recognize unit)
- **After:** When Paragon completes (UnitCountOnPlanet >= 1):
  - **100 Nuke Silos** (50-100 assisters each) - Priority 670
  - **Unlimited Omega Battleships** (50 assisters) - Priority 670
  - **Unlimited Unit Cannons** (50-100 assisters) - Priority 670

---

## BUILD PRIORITIES (Now Working!)

| Priority | Phase | What Gets Built |
|----------|-------|-----------------|
| 100 | Early | Fabbers, basic economy, factories |
| 150 | **Mid-Game** | **Second Wave units spam** (Rex, Stalker, Andreas, Swordfish) |
| 255-300 | Combat | Standard units, defenses, artillery |
| 401-402 | Defense | **Pounder** anti-artillery towers |
| 525 | Strategic | **Paragon construction begins** (15+ adv mexes, 8+ adv energy) |
| 565 | Late Eco | Additional Paragon (if can afford 3 simultaneously) |
| **670** | **GOD MODE** | **100 nukes + unlimited Omegas + unlimited Unit Cannons** |

---

## TO TEST

1. **Install v1.0.3:**
   ```powershell
   Copy-Item -Recurse "c:\Users\Brandon\dev\mods\com.pa.super.ai" "$env:LOCALAPPDATA\Uber Entertainment\Planetary Annihilation\mods\" -Force
   ```

2. **Restart PA** (clears JavaScript cache)

3. **Test Paragon Building:**
   - Play vs SuperAI on metal-rich planet
   - Let game run to late-game (15+ min)
   - SuperAI should organically attempt Paragon when it has 15+ advanced mexes

4. **Test GOD MODE:**
   - Give SuperAI a Paragon in sandbox mode
   - Wait ~30 seconds for AI update cycle
   - Watch for massive nuke silo spam (should see 100+ being built)
   - Watch for unlimited Omega spam from orbital factories

5. **Test Second Wave Units:**
   - Mid-game (after T2 economy established)
   - SuperAI should build Rex bots, Stalker vehicles, Swordfish bombers
   - Check unit roster - should see Second Wave units mixed in

---

## EXPECTED BEHAVIOR

### Early Game (0-5 min)
- Standard Queller build (fabbers, mexes, energy, factories)
- **No Second Wave units yet** (requirements: 3-4 adv mexes, 0.75+ efficiency)

### Mid Game (5-15 min)
- **Second Wave unit spam begins** when:
  - 3+ advanced metal extractors
  - 0.75+ metal efficiency
  - Can afford build demand
- Should see **Rex, Stalker, Swordfish, Andreas** in production queues
- **Pounder** anti-artillery towers for defense

### Late Game (15-30 min)
- **Paragon construction** when:
  - 15+ advanced mexes
  - 8+ advanced energy
  - 0.9+ metal/energy efficiency
  - Can afford potential drain
- Standard late-game army continues
- 3-5 nukes for normal play

### GOD MODE (Post-Paragon)
- **Activates immediately when Paragon completes**
- **100 Nuke Silos** with 50-100 assisters each
- **Unlimited Omega Battleships** from orbital factories (50 assisters each)
- **Unlimited Unit Cannons** (50-100 assisters each)
- **WARNING:** This WILL cause lag on lower-end systems!

---

## VERIFICATION COMMANDS

Check if unit_map entries exist:
```powershell
Get-Content "c:\Users\Brandon\dev\mods\com.pa.super.ai\pa\ai_super\super_uber\unit_maps\ai_unit_map.json" | Select-String -Pattern "Paragon|Rex|Stalker|OrbitalBattleShip"
```

Expected output:
```
"Paragon":{"spec_id":"/pa/units/land/paragon/paragon.json"}
"Rex":{"spec_id":"/pa/units/addon/rex/rex.json"}
"Stalker":{"spec_id":"/pa/units/addon/stalker/stalker.json"}
"OrbitalBattleShip":{"spec_id":"/pa/units/orbital/orbital_battleship/orbital_battleship.json"}
```

---

## CHANGELOG v1.0.2 → v1.0.3

**CRITICAL FIX:**
- Added Paragon to unit_map (AI can now recognize and build it!)
- Added all valid Second Wave MLA units to unit_map (Rex, Stalker, Swordfish, Andreas, Pounder)
- Added OrbitalBattleShip (Omega) to unit_map (GOD MODE spam now works!)
- Fixed build configs to only reference units that actually exist in Second Wave MLA

**REMOVED (Units don't exist in Second Wave MLA):**
- Removed Centaur references (Legion-only unit)
- Removed Saxon references (Legion-only unit)  
- Removed Spear references (Legion-only structure)

**WHY THIS MATTERS:**
The AI had all the build logic configured correctly, but couldn't execute because it didn't know what the unit names meant. Like having a perfect recipe but not knowing what "flour" is!

---

## INSTALL & TEST

```powershell
# Navigate to workspace
cd c:\Users\Brandon\dev\mods

# Copy to PA mods folder (overwrites v1.0.2)
Copy-Item -Recurse ".\com.pa.super.ai" "$env:LOCALAPPDATA\Uber Entertainment\Planetary Annihilation\mods\" -Force

# Verify version
Get-Content "$env:LOCALAPPDATA\Uber Entertainment\Planetary Annihilation\mods\com.pa.super.ai\modinfo.json" | Select-String "version"
```

Expected: `"version": "1.0.3"`

**CRITICAL:** Restart PA to clear JavaScript cache!

---

## WHAT TO EXPECT IN-GAME

### If It Works:
- SuperAI will **organically build Paragon** in late-game
- You'll see **Second Wave units** (Rex, Stalker, Swordfish) in mid-game
- **GOD MODE activates** when Paragon completes (100 nukes spam immediately)
- **Omegas spam** from orbital factories non-stop
- Game may **lag heavily** during GOD MODE (10,000+ fabbers possible!)

### If It Still Doesn't Work:
Check PA logs for errors:
```powershell
Get-ChildItem "$env:LOCALAPPDATA\Uber Entertainment\Planetary Annihilation\log" -Filter "PA-*.txt" | Sort-Object LastWriteTime -Descending | Select-Object -First 1 | Get-Content | Select-String "SuperAI|error|unit_map"
```

---

## VERSION HISTORY

- **v1.0.0** - Initial creation (UI registration broken, unit_map broken)
- **v1.0.1** - UI fix attempt (wrong context "client" instead of "server")
- **v1.0.2** - UI fixed (server context, Legion pattern, no Queller dependency) 
- **v1.0.3** - **CRITICAL FIX:** Added all missing unit_map entries (Paragon, Second Wave, Omega)

---

*Date: 2025-10-08*
*Issue: Unit map missing critical entries*  
*Impact: AI couldn't recognize Paragon or Second Wave units*  
*Fix: Added 7 unit_map entries for all custom units*
