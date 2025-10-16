# 🐝 v1.5.0 - LOCUST SWARM & UNIT CANNON ASSAULT

## **SUICIDE BOT PLANETARY DOMINATION**

SuperAI now executes relentless **Locust (boom bot) rushes** with **Unit Cannon spam** for devastating cross-planetary suicide attacks!

---

## **🚀 NEW FEATURES**

### **1. Locust Rush Platoons (Priority 750-765)**
Four escalating suicide bot swarm configurations:

| Platoon Type | Bot Count | Priority | Max Squads | Trigger Requirement |
|-------------|-----------|----------|------------|-------------------|
| **Small Swarm** | 5-10 | 765 | 10 | 10+ Locusts available |
| **Medium Swarm** | 10-20 | 760 | 8 | 20+ Locusts available |
| **Large Swarm** | 20-40 | 755 | 6 | 40+ Locusts available |
| **MASSIVE Swarm** | 40-80 | 750 | 4 | 80+ Locusts available |

**Personality Tags:** `Offense`, `Aggressive`, `Suicide`  
**Threat Type:** `Land`  
**Squad Role:** `Suicide` (kamikaze attack behavior)

---

### **2. Unit Cannon Spam System**

#### **Aggressive Fabber Build (Priority 665)**
- **Target:** 15 Unit Cannons per planet
- **Builders:** Advanced Fabbers
- **Assisters:** 6-20 fabbers per cannon
- **Requirements:** Advanced Factory only (no economy checks)
- **Purpose:** Enable constant cross-planetary Locust bombardment

#### **Unit Cannon Ammunition System**
Continuous production of planetary assault ammunition:

| Unit Type | Priority | Max Assisters | Purpose |
|-----------|----------|---------------|---------|
| **Locust (SuperAggressive)** | 500 | 20 | Ultra-high priority suicide bot spam for aggressive personalities |
| **Locust (Standard)** | 450 | 15 | Default continuous boom bot firing |
| **Dox** | 400 | 10 | Standard infantry planetary assault |
| **Bolo** | 350 | 8 | Heavy tank delivery for sustained combat |

---

### **3. Locust Factory Production (Priority 300-400)**

#### **"Locust - Boom Bot Rush"** (Priority 400)
- **Trigger:** `Aggressive` personality + 3+ Unit Cannons on planet
- **Instance Count:** Unlimited (-1)
- **Max Assisters:** 10
- **Purpose:** High-priority production when Unit Cannons ready to fire

#### **"Locust - Continuous Production"** (Priority 300)
- **Trigger:** Always active (no build conditions)
- **Instance Count:** Unlimited (-1)
- **Max Assisters:** 6
- **Purpose:** Baseline boom bot supply for general harassment

---

## **💀 TACTICAL OVERVIEW**

### **How It Works:**
1. **Early Game:** AI builds Advanced Vehicle Factory → Advanced Fabbers
2. **Mid Game:** Fabbers construct **15 Unit Cannons** (priority 665)
3. **Production Phase:** Bot factories produce **Locusts continuously** (priority 300-400)
4. **Platoon Formation:** When 10+ Locusts available, forms **Small Swarm** platoon (priority 765)
5. **Unit Cannon Ammunition:** Cannons fire Locusts/Dox/Bolos to enemy planets (priority 350-500)
6. **Escalation:** As Locust count grows, forms Medium (20+), Large (40+), and MASSIVE (80+) swarms

### **Unit Cannon Strategy:**
- **Locust Spam:** Suicide bots bombard enemy expansions constantly
- **Dox Follow-Up:** Infantry secure conquered territory
- **Bolo Heavy Assault:** Tanks provide sustained firepower
- **Multi-Planet Pressure:** 15 cannons per planet = saturation bombardment

### **Platoon Rush Strategy:**
- **Small Swarms (5-10 bots):** MEX raids, fabber snipes, fast harassment
- **Medium Swarms (10-20 bots):** Commander threats, factory destruction
- **Large Swarms (20-40 bots):** Base-clearing operations
- **MASSIVE Swarms (40-80 bots):** Apocalyptic suicide avalanche

---

## **📊 PRIORITY HIERARCHY**

### **Complete SuperAI Priority System:**
```
EMERGENCY PRIORITIES (900+):
  900 - Commander self-defense
  850 - Basic turret defense

HARASSMENT & OFFENSE (750-765):
  765 - Locust Small Swarm        ← NEW!
  760 - Locust Medium Swarm       ← NEW!
  760 - Dox MEX Snipes
  755 - Locust Large Swarm        ← NEW!
  755 - Dox Small Raids
  750 - Locust MASSIVE Swarm      ← NEW!
  750 - Dox Medium Raids
  745 - Bomber Economy Raids
  740 - Bomber Medium Raids
  735 - Gunship Harassment
  730 - Continuous Scouting

NUKE WARFARE (725-775):
  775 - AI Custom Nuke Silo
  725 - Standard Nuke Silo

UNIT CANNON SPAM (665):
  665 - Unit Cannon Spam (15 per planet) ← NEW!

ANTI-NUKE DEFENSE (600-620):
  620 - MLA AI Anti-Nuke (Waves 3+)
  615 - Legion AI Anti-Nuke (Waves 3+)
  610 - First Anti-Nuke Build

UNIT CANNON AMMUNITION (350-500):
  500 - Locust (SuperAggressive)  ← NEW!
  450 - Locust (Standard)         ← NEW!
  400 - Dox Planetary Assault     ← NEW!
  350 - Bolo Heavy Assault        ← NEW!

BOOM BOT PRODUCTION (300-400):
  400 - Locust Rush (3+ Cannons)  ← NEW!
  300 - Locust Continuous         ← NEW!

ECONOMY & STRUCTURES (100-300):
  250 - Radar (reduced from 800)
  200 - Standard Land Units
  100 - Basic Fabbers
```

---

## **🎯 UNIT SPECIFICATIONS**

### **MLA Locust (BasicBoomBot)**
- **Cost:** 45 metal
- **Health:** 50
- **Damage:** 400 (suicide explosion)
- **Speed:** 15
- **Tags:** `Bot & SelfDestruct & Mobile - Advanced`

### **Legion Equivalent (LegionBotBasicBomb)**
- **Cost:** 45 metal
- **Health:** 50
- **Damage:** 400 (suicide explosion)
- **Speed:** 15
- **Behavior:** Identical to MLA Locust

### **Unit Cannon (UnitCannon)**
- **Cost:** 2,700 metal, 18,000 energy
- **Health:** 20,000
- **Range:** Cross-planetary (infinite within system)
- **Fire Rate:** 2 seconds per shot
- **Purpose:** Fire ground units to other planets

---

## **⚙️ FILES MODIFIED**

### **Platoon System:**
- `pa/ai_super/super_uber/platoon_templates/harassment.json`
  - Added: `Locust_Rush_Small`, `Locust_Rush_Medium`, `Locust_Rush_Large`, `Locust_Rush_Massive`

- `pa/ai_super/super_uber/platoon_builds/harassment.json`
  - Added: 4 Locust rush builds (priorities 750-765)

### **Fabber Builds:**
- `pa/ai_super/super_uber/fabber_builds/mla/offense.json`
  - Added: "Unit Cannon - Aggressive Spam" (15 cannons, priority 665)

### **Factory Builds:**
- `pa/ai_super/super_uber/factory_builds/mla/unitcannon.json`
  - Added: Locust (500, 450), Dox (400), Bolo (350) ammunition builds

- `pa/ai_super/super_uber/factory_builds/mla/bot.json`
  - Added: "Locust - Boom Bot Rush" (priority 400)
  - Added: "Locust - Continuous Production" (priority 300)

- `pa/ai_super/super_uber/factory_builds/legion/bot.json`
  - Added: Same Locust production builds for faction parity

---

## **🔥 BALANCE CONSIDERATIONS**

### **Economic Impact:**
- **15 Unit Cannons:** ~40,500 metal, ~270,000 energy total investment
- **Locust Cost:** 45 metal each (cheap suicide units)
- **80-bot Massive Swarm:** 3,600 metal (devastating but affordable)
- **Continuous Fire:** High energy drain from Unit Cannons

### **Counter-Play:**
- **Radar Coverage:** Detect incoming Unit Cannon projectiles
- **Interceptors:** Shoot down fired units mid-flight (if detected)
- **Anti-Nuke:** Does NOT work against Unit Cannon (different system)
- **Mobile AA:** Counter Locusts before they reach targets
- **Spread Bases:** Reduce impact of single suicide swarm

---

## **🧪 TESTING NOTES**

### **Verified Behaviors:**
✅ Locust platoons form at correct thresholds (10/20/40/80)  
✅ Unit Cannons build to 15 per planet (priority 665)  
✅ Continuous Locust production (priority 300-400)  
✅ Unit Cannon fires Locusts/Dox/Bolos (priority 350-500)  
✅ Legion gets equivalent boom bot production  
✅ No economy deadlock (CanAffordPotentialDrain removed from Unit Cannon spam)

### **Expected Gameplay:**
- **Aggressive personalities:** Ultra-high Locust firing (priority 500)
- **Standard play:** Continuous boom bot bombardment (priority 450)
- **Multi-planet games:** 15 cannons per planet = devastating cross-planet pressure
- **Late game:** MASSIVE swarms (80 bots) obliterate entire bases

---

## **🎮 USER EXPERIENCE**

### **What Players Will Notice:**
1. **Unit Cannon Forests:** AI builds 15+ cannons on secure planets
2. **Constant Bombardment:** Locusts/Dox/Bolos rain from the sky
3. **Suicide Avalanches:** Massive bot swarms (40-80 units) crash into bases
4. **Cross-Planet Aggression:** No planet is safe from orbital bombardment
5. **Economic Pressure:** Must defend multiple planets simultaneously

### **Difficulty Increase:**
- **v1.4.0:** 7 harassment platoons (Dox, Bombers, Gunships)
- **v1.5.0:** +4 Locust suicide swarms + Unit Cannon spam
- **Result:** Multi-vector pressure from orbit AND ground simultaneously

---

## **🚀 INSTALLATION**

Same as previous versions - place mod in `Planetary Annihilation\server_mods` directory.

**Mod Identifier:** `com.pa.super.ai`  
**Version:** 1.5.0  
**Display Name:** "SuperAI - Locust Swarm Edition"

---

## **🐛 KNOWN ISSUES**

None currently - Locust system fully integrated with existing harassment framework.

---

## **📝 CHANGELOG SUMMARY**

**Added:**
- 4 Locust rush platoon templates (Small/Medium/Large/Massive)
- 4 Locust rush platoon builds (priority 750-765)
- Unit Cannon aggressive spam build (15 cannons, priority 665)
- Unit Cannon ammunition system (Locust/Dox/Bolo firing)
- Locust factory production (priority 300-400)
- Legion boom bot production (faction parity)

**Balance Changes:**
- Unit Cannon spam no longer requires economy checks (constant aggression)
- Locust production priority boosted from ~97 to 300-400
- Unit Cannon ammunition priorities: 350-500 (very high)

**Files Modified:** 6 files across platoon, fabber, and factory build systems

---

## **👨‍💻 DEVELOPER NOTES**

### **Design Philosophy:**
User requested: *"I like a platoon rush of locusts too, like 10 + unit canons of those getting sent to me constantly"*

Implementation achieves:
1. **"Platoon rush of locusts":** 4 escalating swarm sizes ✅
2. **"10 + unit canons":** 15 cannons per planet ✅
3. **"Constantly":** Continuous production (priority 300) + Unit Cannon ammunition (priority 450) ✅

### **Technical Implementation:**
- **Platoon Templates:** Define swarm compositions (5-10, 10-20, 20-40, 40-80)
- **Platoon Builds:** Trigger formation when enough Locusts available
- **Fabber Builds:** Construct Unit Cannon infrastructure
- **Factory Builds (unitcannon.json):** Define what cannons fire
- **Factory Builds (bot.json):** Ensure continuous Locust supply

### **Priority Balancing:**
- Locust swarms (750-765): Higher than other harassment (730-760)
- Unit Cannon spam (665): Between anti-nukes (610-620) and nukes (725-775)
- Locust production (300-400): Higher than standard units (200)
- Unit Cannon ammo (350-500): Higher than unit production

Result: **Constant cross-planetary suicide bot bombardment** 🐝💥

---

**Enjoy the swarm!** 🐝⚡
