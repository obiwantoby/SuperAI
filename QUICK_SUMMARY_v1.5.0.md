# SuperAI v1.5.0 - LOCUST SWARM UPDATE SUMMARY

## **WHAT YOU ASKED FOR:**
> "I like a platoon rush of locusts too, like 10 + unit canons of those getting sent to me constantly"

## **WHAT YOU GOT:**
✅ **4 Locust suicide swarm types** (5-10, 10-20, 20-40, 40-80 bots)  
✅ **15 Unit Cannons per planet** (aggressive spam build)  
✅ **Continuous Locust bombardment** (priority 300-500)  
✅ **Cross-planetary assault system** (Locusts/Dox/Bolos fired from orbit)

---

## **HOW IT WORKS:**

### **1. Locust Rush Platoons (Priority 750-765)**
- **Small Swarm (5-10 bots):** Triggers when 10+ Locusts available
- **Medium Swarm (10-20 bots):** Triggers when 20+ Locusts available  
- **Large Swarm (20-40 bots):** Triggers when 40+ Locusts available
- **MASSIVE Swarm (40-80 bots):** Triggers when 80+ Locusts available

**All platoons have HIGHEST harassment priority (750-765), even higher than Dox MEX snipes!**

### **2. Unit Cannon Spam (Priority 665)**
- AI builds **15 Unit Cannons** per secure planet
- Each cannon has **6-20 fabber assisters**
- No economy checks = **constant construction**
- Cannons fire units to enemy planets every 2 seconds

### **3. Unit Cannon Ammunition (Priority 350-500)**
Cannons continuously fire:
- **Locusts (priority 450-500):** Suicide bot bombardment
- **Dox (priority 400):** Infantry planetary assault
- **Bolos (priority 350):** Heavy tank delivery

### **4. Locust Production (Priority 300-400)**
Bot factories produce boom bots **non-stop**:
- **Rush Mode (priority 400):** When 3+ Unit Cannons exist
- **Continuous (priority 300):** Always producing baseline supply

---

## **FILES MODIFIED (7 Total):**

1. **`platoon_templates/harassment.json`**  
   Added: 4 Locust_Rush templates (Small/Medium/Large/Massive)

2. **`platoon_builds/harassment.json`**  
   Added: 4 Locust rush builds (priority 750-765)

3. **`fabber_builds/mla/offense.json`**  
   Added: Unit Cannon - Aggressive Spam (15 cannons, priority 665)

4. **`factory_builds/mla/unitcannon.json`**  
   Added: Locust/Dox/Bolo ammunition builds (priority 350-500)

5. **`factory_builds/mla/bot.json`**  
   Added: Locust production builds (priority 300-400)

6. **`factory_builds/legion/bot.json`**  
   Added: Legion boom bot production (faction parity)

7. **`modinfo.json`**  
   Updated: Version 1.5.0, display name "SuperAI - Locust Swarm"

---

## **PRIORITY SYSTEM OVERVIEW:**

```
900 - Commander Defense
850 - T1 Laser Turrets (12 turrets)

765 - Locust Small Swarm ← NEW!
760 - Locust Medium Swarm / Dox MEX Snipes ← NEW!
755 - Locust Large Swarm / Dox Small Raids ← NEW!
750 - Locust MASSIVE Swarm / Dox Medium Raids ← NEW!
745 - Bomber Economy Raids
740 - Bomber Medium Raids
735 - Gunship Harassment
730 - Continuous Scouting

775 - AI Custom Nuke Silo
725 - Standard Nuke Silo

665 - Unit Cannon Spam (15 per planet) ← NEW!

620 - MLA AI Anti-Nuke (Waves 3+)
615 - Legion AI Anti-Nuke (Waves 3+)
610 - First Anti-Nuke Build

500 - Locust Ammo (SuperAggressive) ← NEW!
450 - Locust Ammo (Standard) ← NEW!
400 - Dox Planetary Assault / Locust Rush Production ← NEW!
350 - Bolo Heavy Assault ← NEW!

300 - Locust Continuous Production ← NEW!
250 - Radar (reduced from 800)
200 - Standard Units
100 - Basic Fabbers
```

---

## **WHAT TO EXPECT IN-GAME:**

### **Early Game:**
- AI builds Advanced Vehicle Factory
- Advanced Fabbers start constructing Unit Cannons

### **Mid Game:**
- **15 Unit Cannons** appear on secure planets
- Bot factories spam Locusts (priority 300-400)
- Small Locust swarms (5-10 bots) raid expansions

### **Late Game:**
- **MASSIVE swarms (40-80 Locusts)** obliterate bases
- Unit Cannons fire **constant bombardment** to all enemy planets
- Cross-planetary suicide bot avalanches every few seconds
- No planet is safe from orbital boom bot rain

---

## **COST ANALYSIS:**

- **Unit Cannon:** 2,700 metal, 18,000 energy each
- **15 Unit Cannons:** ~40,500 metal, ~270,000 energy total
- **Locust:** 45 metal each (cheap suicide unit)
- **80-bot Massive Swarm:** 3,600 metal (devastating but affordable)

**Economic Strategy:** High initial investment (Unit Cannons), then cheap continuous pressure (Locusts).

---

## **COUNTERS:**

Players can defend against Locust swarms with:
- **Radar Coverage:** Detect incoming Unit Cannon projectiles
- **Air Interceptors:** Shoot down fired units mid-flight
- **Mobile AA:** Counter Locusts before they reach targets
- **Spread Bases:** Reduce impact of single suicide swarm
- **Priority Target Unit Cannons:** Destroy the orbital bombardment infrastructure

**NOTE:** Anti-nukes do NOT work against Unit Cannons (different system)!

---

## **GAMEPLAY IMPACT:**

### **Before (v1.4.0):**
- 7 harassment platoon types (Dox, Bombers, Gunships, Scouts)
- Raids on MEXs and economy structures
- Continuous scouting pressure

### **After (v1.5.0):**
- **+4 Locust suicide swarm types**
- **+15 Unit Cannons per planet**
- **+Cross-planetary bombardment**
- **Multi-vector pressure:** Orbit AND ground simultaneously

**Result:** AI is now **SIGNIFICANTLY more aggressive** with constant suicide bot bombardment from multiple planets at once!

---

## **TECHNICAL NOTES:**

### **Why "Constantly"?**
1. **Locust production (priority 300):** Always active, no build conditions
2. **Unit Cannon ammo (priority 450):** Continuous firing queue
3. **15 cannons per planet:** Saturation bombardment capability
4. **Unlimited instance counts:** No production caps

### **Why Priority 750-765 for Platoons?**
- Higher than Dox MEX snipes (760)
- Higher than all other harassment (730-745)
- Ensures Locust swarms form before other platoons
- Maximizes suicide bot pressure

### **Why 15 Unit Cannons?**
- User requested "10 + unit canons"
- 15 ensures saturation bombardment
- Each cannon fires every 2 seconds
- 15 cannons = 7.5 units fired per second across all targets

---

## **TESTING CHECKLIST:**

Before releasing to friends/community, verify:
- [ ] Locust swarms form at correct thresholds (10/20/40/80)
- [ ] Unit Cannons build to 15 per planet
- [ ] Bot factories produce Locusts continuously
- [ ] Unit Cannons fire Locusts/Dox/Bolos to enemy planets
- [ ] Legion gets boom bot production (faction parity)
- [ ] No JSON syntax errors (already validated ✅)
- [ ] No economy deadlock from Unit Cannon spam

---

## **VERSION INFO:**

**Mod ID:** `com.pa.super.ai`  
**Version:** 1.5.0  
**Display Name:** "SuperAI - Locust Swarm"  
**Dependencies:** Second Wave Units, Paragon mod  
**Titans Only:** Yes

---

## **DOCUMENTATION:**

Full technical documentation in: `RELEASE_v1.5.0_LOCUST_RUSH.md`

Includes:
- Complete priority hierarchy
- Unit specifications (Locust stats, Unit Cannon stats)
- Files modified breakdown
- Balance considerations
- Counter-play strategies
- Developer notes

---

**ENJOY THE SWARM!** 🐝💥⚡

The AI will now **constantly** bombard you with suicide bots from **10+ Unit Cannons** exactly as requested!
