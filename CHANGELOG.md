# SuperAI - Changelog

## v1.3.6 - AI-Exclusive Fast Nukes & Anti-Dox Rush Defense (2025-10-12)

### ☢️ CUSTOM AI NUKE LAUNCHERS - 10X FASTER
**AI now uses exclusive rapid-fire nuclear weapons!**

Standard nukes cost **50,000 metal** and take **180 seconds** to build - the AI was never able to nuke effectively. Created custom AI-only nuke launchers and missiles that are **10x faster and 10x cheaper**.

**AI Nuke Launcher (MLA & Legion):**
- **Cost:** 5,000 metal (vs standard 14,400)
- **Missile Build Time:** 15 seconds (vs standard 180 seconds - **12x faster!**)
- **Missile Cost:** 5,000 metal (vs standard 50,000 - **10x cheaper!**)
- **Storage:** 10 missiles (vs standard 1)

**New Files Created:**
- `nuke_launcher_ai.json` - MLA AI nuke silo (5,000 metal, 15s cooldown, 10 storage)
- `nuke_launcher_ai_ammo.json` - MLA AI nuke missile (5,000 metal)
- `l_nuke_launcher_ai.json` - Legion AI Supernova silo (5,000 metal, 15s cooldown, 10 storage)
- `l_nuke_launcher_ai_ammo.json` - Legion AI Supernova missile (5,000 metal)

**Unit Map Updates:**
- MLA: `NukeSilo` now points to `/pa/units/land/nuke_launcher_ai/nuke_launcher_ai.json`
- Legion: `LegionDefenseAdvancedNukeSilo` now points to `/pa/units/land/l_nuke_launcher_ai/l_nuke_launcher_ai.json`

**Result:** AI can now launch a nuke every **15 seconds** instead of every **3 minutes**. With 3-5 silos per planet building simultaneously, the AI can fire **12-20 nukes per minute** vs the old rate of **1-2 nukes per minute**. Nuclear warfare is now **truly devastating**!

---

### 🛡️ ANTI-DOX RUSH DEFENSE
**AI now aggressively counters Dox/Peacekeeper rushes!**

Added high-priority land defense turret spam and massively boosted Dox production to counter early bot rushes.

**New Defense Build - "Laser Defense Tower - ANTI-DOX RUSH Defense" (MLA):**
- **Priority:** 700 (very high - builds after factories, before most defenses)
- **Instance Count:** 20 turrets
- **Assisters:** 5-15
- **Trigger:** Enemy surface presence + Bot threat > 50
- **Placement:** Perimeter defense around base

**New Defense Build - "Jackal Defense Tower - ANTI-DOX RUSH Defense" (Legion):**
- Same specs as MLA version
- 20 Jackal turrets with 5-15 assisters

**Dox/Peacekeeper Production Boost:**
- **MLA Dox Priority:** 97 → **200** (+106% increase)
- **MLA Dox Assisters:** 10 → **30** (+200% increase)
- **Legion Peacekeeper Priority:** 95 → **200** (+111% increase)
- **Legion Peacekeeper Assisters:** 10 → **30** (+200% increase)

**Combined Strategy:**
1. Detects enemy Bot threat
2. Builds 20 laser/Jackal turrets at perimeter (priority 700)
3. Swarms factories with 30 assisters producing Dox/Peacekeepers (priority 200)
4. Creates defensive grid + overwhelming counter-rush

---

### 🎯 STRATEGIC IMPACT

**Nuclear Warfare Revolution:**
- ☢️ **12-20 nukes/minute** vs old 1-2 nukes/minute
- 💰 **Affordable** - 5,000 metal vs 50,000 (with 40 metal/sec economy this is trivial)
- ⚡ **Rapid fire** - 15 seconds vs 180 seconds
- 📦 **10 missile storage** vs 1 standard
- 🎯 Combined with 3-5 silos per planet = **relentless nuclear bombardment**

**Anti-Rush Defense:**
- 🛡️ **20 turrets** auto-deploy on Bot threat detection
- 🏭 **3x assister boost** on Dox production
- 🎯 **Priority 700** turrets + **Priority 200** Dox = immediate response
- 💪 **Defensive + offensive** counter - holds with turrets, pushes back with Dox swarm

**Balance Impact:**
Players can no longer rely on:
- ❌ Early Dox rushes (20 turrets + Dox counter-swarm)
- ❌ Slow nuclear buildup (AI fires nukes every 15 seconds)
- ✅ Must use combined arms with air/orbital support
- ✅ Must build anti-nuke immediately (AI nukes come fast)

---

### 🛠️ TECHNICAL DETAILS

**New Files:**
- `pa/units/land/nuke_launcher_ai/nuke_launcher_ai.json` - MLA AI nuke silo
- `pa/units/land/nuke_launcher_ai/nuke_launcher_ai_ammo.json` - MLA AI nuke missile
- `pa/units/land/l_nuke_launcher_ai/l_nuke_launcher_ai.json` - Legion AI nuke silo
- `pa/units/land/l_nuke_launcher_ai/l_nuke_launcher_ai_ammo.json` - Legion AI nuke missile

**Modified Files:**
- `pa/ai_super/super_uber/unit_maps/ai_unit_map.json` - NukeSilo → nuke_launcher_ai
- `pa/ai_super/super_uber/unit_maps/legion.json` - LegionDefenseAdvancedNukeSilo → l_nuke_launcher_ai
- `pa/ai_super/super_uber/factory_builds/mla/bot.json` - Dox priority 97→200, assisters 10→30
- `pa/ai_super/super_uber/factory_builds/legion/bot.json` - Peacekeeper priority 95→200, assisters 10→30
- `pa/ai_super/super_uber/fabber_builds/mla/defense_land.json` - Added anti-Dox turret spam (priority 700, 20 turrets)
- `pa/ai_super/super_uber/fabber_builds/legion/defense_land.json` - Added anti-Dox turret spam (priority 700, 20 turrets)

---

## v1.3.5 - T1 Anti-Nuke Swarm: 50+ Silos Per Planet (2025-10-12)

### 🏭 T1 ENGINEERS CAN BUILD AI ANTI-NUKE
**Basic fabricators can now construct the SuperAI anti-nuke launcher!**

Previously, only Advanced fabricators could build the AI's custom anti-nuke system. Now **T1 engineers have full access**, allowing the AI to start building anti-nuke defenses **immediately** from the start of the game.

**Unit Type Changes:**
- Added `UNITTYPE_FabBuild` - Basic fabricators can build
- Added `UNITTYPE_CombatFabBuild` - Combat fabricators can build
- Retained `UNITTYPE_FabAdvBuild` and `UNITTYPE_CombatFabAdvBuild` - Advanced fabricators still have access

**Build Permission Changes:**
- **MLA:** Changed from `AnyAdvancedFabber` → `AnyFabber` (includes Basic + Advanced)
- **Legion:** Changed from `AnyLegionFabberAdvanced` → `AnyLegionFabberAdvanced + AnyLegionFabberBasic`

**Result:** AI can deploy anti-nuke defenses **from the moment the first factory is built**, not waiting for Advanced fabricators. T1 bot/vehicle/air fabricators will immediately start constructing the 1000-metal anti-nuke silos.

---

### 🚀 50+ ANTI-NUKE SILOS PER PLANET
**Massively increased instance counts to create overwhelming anti-nuke coverage!**

Instance counts increased by **400-900%** across all build strategies to create an impenetrable nuclear defense grid that covers entire planets.

**Instance Count Changes (Both MLA & Legion):**

| Build Strategy | Old | New | Increase |
|----------------|-----|-----|----------|
| **PROACTIVE Defense (620)** | 5 | **50** | +900% |
| **New Planet Landing (950)** | 3 | **10** | +233% |
| **Main Defense (550)** | 12 | **50** | +317% |
| **Commander Protection (650)** | 6 | **20** | +233% |
| **Rush Defense (600)** | 8 | **30** | +275% |

**Total Maximum: 160 anti-nuke silos per planet!**
- PROACTIVE: 50 silos (builds without threats)
- Main Defense: 50 silos (builds with threats)
- Rush: 30 silos (rapid response)
- Commander: 20 silos (commander protection)
- Landing: 10 silos (new planets)

---

### 💥 INSANE TOTAL CAPACITY

**Per Planet Defense Arsenal:**
- **160 anti-nuke silos** maximum deployment
- **4,000 interceptor missiles** stockpiled (160 silos × 25 missiles each)
- **480 missiles/second** combined fire rate (160 silos × 3.0 RoF)
- **160,000 metal** in anti-nuke missiles alone (4,000 × 100 metal each - but they produce 40 metal/sec so this is trivial)

**Build Efficiency:**
- ⚡ **5-second reload** per missile
- 💰 **100 metal** per missile (vs standard 600)
- 🎯 **3.0 shots/second** per silo (vs standard 1.5)
- 📦 **25-missile capacity** per silo (vs standard 3)
- 🏭 **Built by T1 engineers** from game start

**Multi-Planet Scenario:**
With 3 planets fully defended:
- **480 total silos**
- **12,000 interceptor missiles**
- **1,440 missiles/second** system-wide fire rate

---

### 🛡️ STRATEGIC IMPACT

**Nuclear Defense Evolution:**
- v1.3.2: 25-missile storage, proactive builds
- v1.3.4: 2x fire rate, 34 silos max
- **v1.3.5: T1 buildable, 160 silos max** ⬅️ YOU ARE HERE

**What This Means:**
- 🔥 **Instant defense** - T1 engineers start building immediately
- 🏰 **Total coverage** - 160 silos provide overlapping protection across entire planet
- ☢️ **Unstoppable** - 480 shots/second can intercept massive coordinated strikes
- 💰 **Early game viable** - Only 1000 metal per silo with 40 metal/sec economy
- 🌍 **Scales to system** - Every planet gets 50+ silos minimum

**Counter-Strategy Required:**
Players must now use **overwhelming nuclear saturation** (50+ simultaneous nukes) or alternative strategies like Unit Cannons, Halleys, or Titans to defeat the AI, as conventional nuclear strikes will be completely nullified by the defensive grid.

---

### 🛠️ TECHNICAL DETAILS

**Modified Files:**
- `pa/units/land/anti_nuke_launcher_ai/anti_nuke_launcher_ai.json` - Added FabBuild + CombatFabBuild unit types
- `pa/ai_super/super_uber/fabber_builds/mla/defense_super.json` - Changed builders to AnyFabber, increased counts to 50/10/50/20/30
- `pa/ai_super/super_uber/fabber_builds/legion/defense_super.json` - Added Basic fabbers, increased counts to 50/10/50/20/30

**Build Condition Changes:**
- PROACTIVE: Now allows builds with just 1 Factory (not Advanced Factory), limit increased from 3 → 50
- All strategies: Changed from Advanced Factory requirement → any Factory

---

## v1.3.4 - Enhanced Anti-Nuke Defense: 2x Fire Rate & More Silos (2025-10-11)

### 🚀 2X FASTER ANTI-NUKE INTERCEPTION
**AI anti-nuke launchers now fire twice as fast as standard launchers!**

The AI's exclusive anti-nuke launcher now has **double the rate of fire** compared to standard anti-nuke systems, making it dramatically more effective at stopping incoming nuclear strikes.

**Rate of Fire Changes:**
- **Standard Anti-Nuke:** 1.5 shots/second
- **SuperAI Anti-Nuke:** **3.0 shots/second** (100% increase!)

**Technical Implementation:**
- Created custom weapon file: `anti_nuke_launcher_ai_tool_weapon.json`
- Updated `anti_nuke_launcher_ai.json` to use the custom 3.0 RoF weapon
- Combined with 25-missile storage capacity and 5-second build time from v1.3.2

**Result:** AI can now intercept incoming nukes **twice as fast**, making nuclear strikes against the AI much more difficult to execute successfully. The AI can fire 3 anti-nuke missiles per second vs the standard 1.5, allowing it to defend against concentrated nuclear barrages.

---

### 🏰 SIGNIFICANTLY MORE ANTI-NUKE SILOS
**AI now builds 40-60% more anti-nuke silos across all build strategies!**

Instance counts massively increased across all 5 anti-nuke construction strategies to create an impenetrable nuclear defense network.

**Instance Count Increases (Both MLA & Legion):**
- **PROACTIVE Defense (Priority 620):** 3 → **5 silos** (+67% increase)
  - Builds 5 silos without any threat detection
  - Each holds 25 missiles = **125 total interceptors proactively deployed**
  
- **New Planet Landing (Priority 950):** 2 → **3 silos** (+50% increase)
  - Immediate anti-nuke protection on newly colonized planets
  - 75 total interceptors ready on landing
  
- **Main Defense (Priority 550):** 8 → **12 silos** (+50% increase)
  - Primary anti-nuke network when threats detected
  - 300 total interceptors at full deployment
  
- **Commander Protection (Priority 650):** 4 → **6 silos** (+50% increase)
  - Enhanced protection around commander location
  - 150 total interceptors defending commander
  
- **Rush Defense (Priority 600):** 5 → **8 silos** (+60% increase)
  - Rapid response to immediate nuclear threats
  - 200 total interceptors for emergency defense

**Total Anti-Nuke Capacity:**
With all strategies active, AI can deploy up to **34 anti-nuke silos** (up from 22), holding a combined **850 interceptor missiles** (up from 550). At 3.0 shots/second, the AI can fire **102 anti-nuke missiles per second** across its full defense network!

---

### 📊 STRATEGIC IMPACT

**Nuclear Defense Arsenal:**
- 🎯 **2x faster interception** - Stops nukes in half the time
- 🏰 **+12 additional silos** - 54% more anti-nuke structures
- 🚀 **+300 interceptor missiles** - Massive stockpile capacity
- ⚡ **102 missiles/second** - Insane combined fire rate across all silos

**Combined v1.3.2-1.3.4 Features:**
- 25-missile storage per silo (vs standard 3)
- 5-second build time (vs standard 180s)
- 100 metal per missile (vs standard 600)
- 3.0 rate of fire (vs standard 1.5)
- Proactive construction without threats
- Up to 34 silos per base

**Result:** The AI now has an **impenetrable nuclear defense** that can withstand massive coordinated nuclear barrages. Combined with aggressive nuke spam from v1.3.0/1.3.3, creates ultimate nuclear arms race where both offense and defense are maximized.

---

### 🛠️ TECHNICAL DETAILS

**New Files:**
- `pa/units/land/anti_nuke_launcher_ai/anti_nuke_launcher_ai_tool_weapon.json` - Custom 3.0 RoF weapon

**Modified Files:**
- `pa/units/land/anti_nuke_launcher_ai/anti_nuke_launcher_ai.json` - Uses custom weapon
- `pa/ai_super/super_uber/fabber_builds/mla/defense_super.json` - Instance counts: 5/3/12/6/8
- `pa/ai_super/super_uber/fabber_builds/legion/defense_super.json` - Instance counts: 5/12/6/8

---

## v1.3.3 - Economy Parity & Faster Nuclear Warfare (2025-10-10)

### 🏭 LEGION ECONOMY BOOST PARITY
**Legion AI now has the same economy advantages as MLA!**

Previously, only MLA (Second Wave) had access to AI-exclusive boosted economy units. Legion used standard economy buildings, putting them at a 5.7x disadvantage. This is now fixed.

**New Legion AI-Exclusive Economy Units:**
- **l_mex_ai (Metal Extractor):** Produces **40 metal/sec** (vs standard 7 metal/sec - **5.7x boost**)
- **l_energy_plant_ai (Energy Plant):** Produces **2400 energy/sec** (vs standard 600 energy/sec - **4x boost**)

**Unit Map Changes:**
- Updated `legion.json` to map `LegionEcoBasicMetalExtractor` → `/pa/units/land/l_mex_ai/l_mex_ai.json`
- Updated `legion.json` to map `LegionEcoBasicEnergyPlant` → `/pa/units/land/l_energy_plant_ai/l_energy_plant_ai.json`

**Result:** Both factions now have identical economy scaling, ensuring balanced AI performance regardless of faction choice.

---

### ☢️ FASTER NUCLEAR WARFARE
**AI starts nuking much earlier in the game!**

Nuke silo construction priority massively increased to start nuclear warfare faster. Silos now build **immediately after orbital launchers** and **before Omega battleships**, ensuring nuclear capabilities come online much sooner.

**Priority Changes:**
- **"Nuke Silo - AGGRESSIVE SPAM":** Priority **680 → 775** (+95 priority, 14% increase)
  - Now builds **above Fighters (750)**, just below Radar (800) and Orbital Launchers (720)
  - Activates on combat planets (enemy surface presence)
  - 3 silos per planet with 10-50 assisters
  
- **"Nuke Silo - Expansion Planets":** Priority **600 → 725** (+125 priority, 21% increase)
  - Now builds on expansion planets much faster
  - 2 silos per planet with 8-45 assisters

**Updated Priority Hierarchy (v1.3.3):**
```
950: Anti-nuke (new planet landing)
900: Anti-air turrets (Galata/Shredder)
850: Ion defense (custom 500 metal)
800: Radar
775: Nuke silos (AGGRESSIVE SPAM - combat planets) ⬆️ NEW!
750: Fighters
725: Nuke silos (Expansion planets) ⬆️ NEW!
720: Orbital launcher
700: Factories
670: Omega/Imperator (GOD MODE)
650: Omega/Imperator (planet invasion), Catapults, Anti-nuke (Commander)
640: Spears
630: Basic turrets
620: Anti-nuke silos (PROACTIVE)
550: Omega/Imperator (aggressive expansion), Anti-nuke (main)
500: Helios/Hades Titans
```

**Strategic Impact:**
- ☢️ AI launches nukes **much faster** - nuclear warfare starts in mid-game instead of late-game
- 🚀 Nuke silos build **before heavy orbital battleships** - prioritizes long-range bombardment
- 🎯 Earlier nuclear pressure forces player to invest in anti-nuke defense sooner
- ⚡ Combined with v1.3.0's aggressive nuke spam (3-5 silos per planet), creates relentless nuclear assault

---

### 📊 TECHNICAL DETAILS

**New Files:**
- `pa/units/land/l_mex_ai/l_mex_ai.json` - Legion AI metal extractor (40 metal/sec)
- `pa/units/land/l_energy_plant_ai/l_energy_plant_ai.json` - Legion AI energy plant (2400 energy/sec)

**Modified Files:**
- `pa/ai_super/super_uber/unit_maps/legion.json` - Mapped Legion economy units to AI-boosted versions
- `pa/ai_super/super_uber/fabber_builds/mla/offense_formatted.json` - Nuke silo priorities 680→775, 600→725
- `pa/ai_super/super_uber/fabber_builds/legion/offense.json` - Supernova priorities 680→775, 600→725

---

## v1.3.2 - Proactive Anti-Nuke Defense: Nuclear Fortress (2025-10-10)

### 🛡️ NEW PLANET LANDING DEFENSE SYSTEM
**AI now automatically secures and defends new planets immediately upon landing!**

When the SuperAI arrives on a new planet (via teleporter), it now builds defensive structures **BEFORE** starting army production. This prevents early rushes and air snipes from destroying new bases.

### First Landing Build Order (Priority 750-710)
The AI now follows this exact sequence when arriving on a new planet:

**Priority 750 - Spear/Phalanx Anti-Tactical Defense**
- **Builds:** 2x Spear (MLA) or 2x Phalanx (Legion)  
- **Assisters:** 2-5 fabbers
- **Purpose:** Protects against tactical missiles and orbital bombardment
- **Why First:** Highest priority defense against long-range harassment

**Priority 740 - Air Defense Turrets**
- **Builds:** 3x Galata/Shredder turrets
- **Assisters:** 2-5 fabbers
- **Purpose:** Prevents air snipes and bomber rushes
- **Coverage:** Surrounds landing zone with AA protection

**Priority 730 - Basic Land Defense**
- **Builds:** 2x Laser Turrets (MLA) or 2x Jackal (Legion)
- **Assisters:** 2-5 fabbers
- **Purpose:** Defends against ground army pushes
- **Placement:** Guards teleporter and key structures

**Priority 720 - Radar**
- **Builds:** 1x Basic Radar
- **Assisters:** 2-4 fabbers
- **Purpose:** Provides vision and threat detection
- **Strategic:** Enables defensive positioning

**Priority 710 - Factories (Boosted)**
- **Builds:** Bot/Air/Vehicle Factory
- **Assisters:** Increased from 3-5 → 5-10 (100% faster build)
- **Purpose:** Starts army production and bomber raids
- **Change:** Priority increased from 701 → 710

### Build Trigger Conditions
- **Activates When:** AI has presence on another planet AND teleporter exists on current planet
- **Applies To:** Both MLA (Second Wave) and Legion factions
- **Cost Check:** Only builds if economy can afford the drain
- **Instance Control:** Limits number of each defensive type to prevent over-building

### Strategic Impact
- 🛡️ **Prevents Air Snipes:** AA turrets online before factories vulnerable
- ⚡ **Stops Early Rushes:** Land defenses protect expansion immediately  
- 🎯 **Vision Priority:** Radar reveals threats before they arrive
- 🏗️ **Faster Construction:** More assisters = 2-3x faster builds
- 🌍 **All Planets Protected:** Every new landing follows this defensive doctrine
- 💣 **Quicker Offense:** Boosted factory assisters enable faster bomber production

### Technical Changes
**Files Modified (MLA Faction):**
- `fabber_builds/mla/defense_land.json` - Added Spear + Basic Turret landing builds
- `fabber_builds/mla/defense_air.json` - Added Galata turret landing builds  
- `fabber_builds/mla/intel.json` - Added Radar landing builds
- `fabber_builds/mla/air.json` - Boosted air factory priority 701→710, assisters 3-5→5-10
- `fabber_builds/mla/bot.json` - Boosted bot factory priority 701→710, assisters 3-5→5-10
- `fabber_builds/mla/vehicle.json` - Boosted vehicle factory priority 701→710, assisters 3-5→5-10

**Files Modified (Legion Faction):**
- `fabber_builds/legion/defense_land.json` - Added Phalanx + Jackal landing builds
- `fabber_builds/legion/defense_air.json` - Added Shredder turret landing builds
- `fabber_builds/legion/intel.json` - Added Radar landing builds
- `fabber_builds/legion/air.json` - Boosted flyer foundry priority 701→710, assisters 3-5→5-10
- `fabber_builds/legion/bot.json` - Boosted walker foundry priority 701→710, assisters 3-5→5-10
- `fabber_builds/legion/vehicle.json` - Boosted armor foundry priority 701→710, assisters 3-5→5-10

### Comparison: Before vs After
**OLD (v1.1.5):** Factory → Metal Extractors → Economy → (Maybe defenses later)  
**NEW (v1.2.0):** Spears → AA Turrets → Land Defense → Radar → **THEN** Factory

**Result:** New planets are now **immediately fortified and defended** instead of vulnerable to early attacks!

## v1.1.5 - Aggression Overhaul: Nuclear Defense & Rapid Colonization (2025-10-09)

### 🔥 MAJOR AI BEHAVIOR CHANGES
**Made SuperAI significantly more aggressive with enhanced defensive and expansion capabilities!**

### Anti-Nuke Defense Improvements
**MLA Faction:**
- **Anti-Nuke Silos:** Increased from 3 → 8 per base
- **Priority:** Increased from 450/550 → 550/650 (builds faster)
- **Assisters:** Increased max from 12 → 20 (faster construction)
- **Build Requirements:** Reduced from 3 → 1 advanced structures (starts earlier)
- **Anti-Nuke Missiles:** 
  - Priority increased from 152 → 200
  - Added 5 minimum assisters (previously 0)
  - Max assisters increased from 12 → 25
  - Rush mode: increased from 510 → 650 priority, 12 → 30 max assisters

**Legion Faction:**
- **Iron Dome Silos:** Increased from 1 → 8 per base  
- **Priority:** Increased from 380/510 → 550/650
- **Assisters:** Increased max from 12 → 20
- **Interceptor Missiles:** Same improvements as MLA (priority, assisters)

### Planet Colonization Acceleration
**Orbital Launcher Construction:**
- **Priority:** Increased from 480 → 580 (MLA), 376/480 → 480/580 (Legion)
- **Assisters:** Increased from 3-5 → 5-10 (100% faster build)
- **Fabber Requirements:** Reduced from 5 → 2 (builds with fewer fabbers)
- Result: AI establishes orbital presence much faster

**Orbital Fabber Production:**
- **Instance Count:** Increased from 1 → 3 per launcher/factory
- **Priority:** Increased from 199 → 250 (builds earlier)
- **Max Assisters:** Increased from 10 → 15
- **Ratio Limit:** Increased from 10:1 → 15:1 fabbers per factory
- Result: AI sends more fabbers to colonize all planets simultaneously

### Strategic Impact
- 🛡️ **Better Nuclear Defense:** AI builds 8+ anti-nuke silos vs previous 1-3
- 🚀 **Faster Expansion:** AI colonizes all planets 2-3x faster
- ⚡ **Higher Priority:** Defense and expansion compete better with army production
- 🏗️ **More Assisters:** Construction completes much faster
- 🌍 **Multi-Planet Dominance:** AI establishes presence on all worlds rapidly

### Technical Changes
**Files Modified:**
- `fabber_builds/mla/defense_super.json` - Anti-nuke silo counts and priority
- `fabber_builds/legion/defense_super.json` - Legion equivalent changes
- `factory_builds/mla/launcher.json` - Anti-nuke missile production
- `factory_builds/legion/launcher.json` - Legion equivalent changes
- `fabber_builds/mla/orbital.json` - Orbital launcher priority and requirements
- `fabber_builds/legion/orbital.json` - Legion equivalent changes
- `factory_builds/mla/orbital.json` - Orbital fabber production
- `factory_builds/legion/orbital.json` - Legion equivalent changes

## v1.0.3 - CRITICAL HOTFIX: Unit Map (2025-10-08)

### 🚨 CRITICAL BUG FIX
**The AI couldn't see Paragon or Second Wave units!**

**Root Cause:** Missing unit_map entries in `ai_unit_map.json`
- The AI referenced units by name ("Paragon", "Rex", "Stalker")
- But had no mapping from names to actual unit spec paths
- Result: AI silently ignored all build commands for these units

**What Was Broken:**
- ❌ Paragon: Never attempted to build (didn't know what it was)
- ❌ Second Wave Units: Never built Rex, Stalker, Swordfish, Andreas, Pounder
- ❌ GOD MODE: Never activated even when given Paragon (couldn't recognize it)
- ❌ Omega Spam: Never built Omegas (didn't know "OrbitalBattleShip")

**What Was Fixed:**
- ✅ Added `Paragon` → `/pa/units/land/paragon/paragon.json`
- ✅ Added `Rex` → `/pa/units/addon/rex/rex.json`
- ✅ Added `Stalker` → `/pa/units/addon/stalker/stalker.json`
- ✅ Added `Swordfish` → `/pa/units/addon/swordfish/swordfish.json`
- ✅ Added `Andreas` → `/pa/units/addon/andreas/andreas.json`
- ✅ Added `Pounder` → `/pa/units/addon/pounder/pounder.json`
- ✅ Added `OrbitalBattleShip` → `/pa/units/orbital/orbital_battleship/orbital_battleship.json`

**Units Removed (Don't exist in Second Wave MLA):**
- ❌ Centaur (Legion-only)
- ❌ Saxon (Legion-only)
- ❌ Spear (Legion-only)

**Impact:** AI now actually works as designed! Will build Paragon, use Second Wave units, and activate GOD MODE.

---

## v1.0.2 - UI Registration Fix (2025-10-08)

### Fixed
- Changed context back to "server" (user was correct!)
- Removed Queller dependency (SuperAI is self-contained)
- Changed JavaScript pattern to match Legion mod exactly
- Named function with explicit call instead of IIFE

---

## v1.0.1 - UI Fix Attempt (2025-10-08)

### Changed
- Changed context to "client" (❌ THIS WAS WRONG)
- Added IIFE pattern for registration

---

## v1.0.0 - Initial Release (2025-10-08)

### Foundation
**Based on Queller AI v8.0 Uber**
- Copied all Queller Uber AI files as baseline
- Uses proven Queller economy management and tactics
- Full personality parameters from Q-Uber:
  - metal_drain_check: 0.54
  - energy_drain_check: 0.72
  - metal_demand_check: 0.8
  - energy_demand_check: 0.8
  - micro_type: 2
  - personality_tags: ["queller"]

### Second Wave Unit Integration
**Combat Units at Priority 150:**
- Rex (Heavy Assault Bot) - 3+ adv mex, 75% efficiency
- Centaur (Heavy Tank) - 3+ adv mex, 75% efficiency
- Stalker (Stealth Tank) - 4+ adv mex, 75% efficiency
- Saxon (Heavy Assault Ship) - 3+ adv mex, 75% efficiency
- Swordfish (Heavy Torpedo Ship) - 4+ adv mex, 75% efficiency
- Andreas (Advanced Orbital Fighter) - 5+ adv mex, 75% efficiency

**Defensive Structures (Reactive - Priority 401-402):**
- Spear (Anti-Orbital) - Priority 401, threat 200+
- Pounder (Artillery) - Priority 402
- Anti-Missile Tower - Priority 401
- Logic: Builds reactively to threats, not economy-gated

### Advanced Fabber Production (+50%)
**All factory types produce 3 fabbers per factory:**
- Bot fabbers: 3 per factory (was 1)
- Vehicle fabbers: 3 per factory (was 1)
- Air fabbers: 3 per factory (was 1)
- Naval fabbers: 3 per factory (was 1)
- **Orbital fabbers: 3 per factory** (was 1)

Result: 3x faster structure construction vs vanilla Queller

### Paragon Economy
**Parallel with Nuke Progression:**
- First Paragon: Priority 525
  - Requirements: 8+ adv mex, 5+ adv energy, 3+ factories
  - Assisters: 8-15
- Additional Paragons: Priority 565
  - Requirements: 12+ adv mex, 10+ adv energy
  - Assisters: 10-20

Strategic timing: Builds WITH nukes, not before them

### Nuclear Capabilities
**Progressive Nuke Spam:**
- Priority 520: 2 Nuke Silos (8+ adv mex) - 3-12 assisters
- Priority 560: 3 Nuke Silos (12+ adv mex) - 5-20 assisters
- Priority 620: 5 Nuke Silos (15+ adv mex) - 10-30 assisters

**GOD MODE (Priority 670) - When Paragon completes:**
- 100 Nuke Silos (50-100 assisters each)
- Unlimited Omega Battleships (50 assisters per Omega)
- Unlimited Unit Cannons (50-100 assisters each)
- Requirements: 1+ Paragon + 90%+ efficiency
- Total fabber allocation: 15,000+ possible

### Anti-Nuke Defense
**Builds anti-nukes alongside nuke silos:**
- Priority 380: Standard anti-nuke (3-12 assisters)
- Priority 510: Commander/Rush protection (5-12 assisters)
- Reactive to nuke threats in system

### Technical Implementation
**File Structure:**
- `/pa/ai_super/super_uber/` - AI personality files
- `fabber_builds/mla/` - Structure construction logic
  - economy.json - Paragon + metal/energy
  - offense.json - Nuke silos + Unit Cannons
  - defense_land.json - Spear/Pounder/Anti-Missile
  - defense_super.json - Anti-nuke silos
- `factory_builds/mla/` - Unit production logic
  - bot.json - Rex + 3 fabbers per factory
  - vehicle.json - Centaur/Stalker + 3 fabbers
  - air.json - 3 fabbers per factory
  - naval.json - Saxon/Swordfish + 3 fabbers
  - orbital.json - Andreas/Omegas + 3 fabbers
- `ui/mods/com.pa.super.ai/new_game.js` - Personality registration

**Dependencies:**
- com.pa.quitch.qQuellerAI (base AI)
- com.pa.brandon.paragon (Paragon structure)
- pa.mla.unit.addon (Second Wave units)

### Known Issues
- GOD MODE may cause performance issues (10,000+ fabbers)
- Recommended: High-end PC, 16GB+ RAM
- Multiple Paragons may cause server instability

### Design Philosophy
**SuperAI represents the ultimate AI challenge:**
1. Smart baseline (Queller Uber proven tactics)
2. Aggressive modded unit usage (Second Wave at priority 150)
3. Exponential economy (Paragon parallel with nukes)
4. Apocalyptic late-game (100 nukes + unlimited Omegas/Unit Cannons)

When you see "Paragon Complete," the apocalypse begins.

---

**Credits:**
- Base AI: Queller AI by Quitch
- SuperAI: Brandon
- Second Wave Units: MLA Unit Addon
- Paragon: Brandon

*"Making vanilla Queller look casual since 2025"*
