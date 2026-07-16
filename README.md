# SuperAI

Elite AI opponent for **Planetary Annihilation: TITANS** — Queller AI Uber foundation with Second Wave units, Locust rushes, harassment, and Paragon endgame.

| | |
|--|--|
| **Version** | 1.5.0 (Locust Swarm) |
| **ID** | `com.pa.super.ai` |
| **Author** | Brandon (based on [Queller AI](https://github.com/Quitch/Queller-AI) by Quitch) |

## What it does

- **Queller-grade** economy and micro as the baseline  
- **Second Wave** combat units (Rex, Centaur, Stalker, naval/orbital, etc.)  
- **Locust / boom-bot** suicide swarms and unit-cannon pressure  
- **Harassment** (Dox / bombers / gunships)  
- **Paragon + nuke** late-game escalation  
- Optional **AI-only** economy/defense unit variants (not buildable by players)

## Requirements

| Mod | Role |
|-----|------|
| **Queller AI** | Base AI framework |
| **Second Wave Units** (`pa.mla.unit.addon`) | Extra unit roster |
| **Paragon** (`com.pa.brandon.paragon`) | Infinite economy structure |

TITANS only. High-end machines recommended — GOD-mode style production can get extreme.

## Install

1. Install the required mods above.  
2. Copy this mod into your PA mods folder:

   ```text
   %LOCALAPPDATA%\Uber Entertainment\Planetary Annihilation\mods\
   ```

3. Enable **SuperAI** in the PA mod list.  
4. Pick **SuperAI** as an AI opponent in skirmish / multiplayer.

See [INSTALLATION.md](INSTALLATION.md) for a fuller walkthrough and troubleshooting.

## Docs in this repo

| Doc | Contents |
|-----|----------|
| [INSTALLATION.md](INSTALLATION.md) | Install / enable steps |
| [CHANGELOG.md](CHANGELOG.md) | Version history |
| [AI_EXCLUSIVE_UNITS.md](AI_EXCLUSIVE_UNITS.md) | Hidden AI unit design notes |
| Release / hotfix notes | Point-in-time design writeups |

## Related

- [Planetary Annihilation dedicated server (Docker + jemalloc)](https://github.com/obiwantoby/PlanetaryAnnihilationDedicated)  
- [PA server optimization notes (BOLT / jemalloc)](https://github.com/obiwantoby/planetary-annihilation-optimization)

## License / attribution

Built on **Queller AI** by Quitch. Use at your own risk in multiplayer; this is a skirmish-focused challenge AI.
