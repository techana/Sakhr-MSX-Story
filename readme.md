# Sakhr MSX Story

[العربية](readme-ar.md)

An MSX program that tells the story of the **Sakhr** MSX line of
computers and the Arab pioneers behind them — the engineers, founders,
and team that built one of the first widely-distributed Arabic-localized
home computers in the 1980s.

This repository contains a runnable cartridge image (a ROM) for a real
or emulated MSX, plus instructions for how to play it.

> ⚠️ **This is still a demo / proof-of-concept release.** It walks
> through five story slides — Mohammed Al-Sharekh, Nabil Ali, the
> Sakhr Computer project, the Sakhr AX-100 (1984), and the Sakhr
> AX-170 (1986) — with PSG background music, animated splash screen,
> typewriter body text, and MSX keyclick sound. More slides, finer
> art, and possibly an MSX2 high-resolution version are planned.

## Get the ROM

Pre-built ROM images and the launcher scripts live under [`MSX-1/`](MSX-1/):

```
MSX-1/
├─ Sakhr MSX Story Demo.rom         ← cartridge image (192 KB)
├─ openmsx.sh                       ← one-click launcher (macOS / Linux)
├─ openmsx.bat                      ← one-click launcher (Windows)
├─ play in emulator.md              ← how to play in an emulator (English)
├─ play in emulator -ar.md          ← (Arabic)
├─ play from physical cartridge.md  ← how to play on real MSX hardware (English)
└─ play from physical cartridge -ar.md  ← (Arabic)
```

## Quick start

### In an emulator

Easiest path on any platform: install [openMSX](https://openmsx.org/),
then either run the bundled launcher or open the ROM manually with the
**ASCII16** mapper. See [`MSX-1/play in emulator.md`](MSX-1/play%20in%20emulator.md)
for the step-by-step.

### On real MSX hardware

Either copy the ROM onto a multi-cart's SD card (MegaFlashROM SCC+ SD,
Carnivore-2, GR8NET, MultiCarta…) and set the mapper to **ASCII 16K**,
or burn a dedicated cartridge from blank parts. See
[`MSX-1/play from physical cartridge.md`](MSX-1/play%20from%20physical%20cartridge.md)
for the recipe.

Either way the demo runs on **MSX1, MSX2, MSX2+, and turboR** computers.

## What's in the demo today

- Splash with title rise, MSX-logo reveal, comet flyby, and 3-channel
  PSG music.
- **Bilingual: Arabic and English.** Press **L** at any time to
  toggle the demo's language; the current slide repaints in the new
  language. The choice is sticky for the rest of the run and survives
  the slideshow looping back. Arabic text reads right-to-left and
  English left-to-right, both typewritten with the same keyclick
  effect.
- Five biographical / story slides:
  1. **محمد الشارخ / Mohammed Al-Sharekh** — founder of Al-Alamiah
     and the Sakhr brand.
  2. **نبيل علي / Nabil Ali** — pioneer of Arabic computing.
  3. **حاسوب صخر / Sakhr Computers** — the Sakhr Computer project itself.
  4. **صخر AX-100** — the 1984 launch model, an Arabic-localised port
     of the Yamaha YIS-503.
  5. **صخر AX-170** — the 1986 best-seller, an Arabic-localised port
     of the Sanyo MPC-2 MSX1.
- Letter-by-letter typewriter body text with MSX-style keyclicks at
  word boundaries.
- Looping back to the splash screen at the end of slide 5.

## Status

Demo / proof-of-concept. Works end-to-end and is enjoyable to watch,
but the content is intentionally compact — five slides — so people
can experience the format quickly while the project iterates toward
a fuller release. Feedback and corrections welcome.
