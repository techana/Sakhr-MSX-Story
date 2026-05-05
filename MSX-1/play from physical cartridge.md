# Playing *Sakhr MSX Story Demo* from a real cartridge

You can play this demo on any **MSX1, MSX2, MSX2+, or turboR** computer
the same way you'd play any commercial MSX game: insert a cartridge into
slot 1 or slot 2 and turn the machine on.

This package gives you the *cartridge image*:

```
Sakhr MSX Story Demo.rom        (160 KB)
```

You have two routes to actually play it on a real computer:

1. **Use a multi-cart you already own** (most common today).
2. **Burn a dedicated cartridge** from blank parts.

Both routes work the same way once the cartridge is in front of you —
the difference is only in how the ROM gets onto the cart.

---

## Route 1 — Multi-cart (recommended for most people)

If you have a modern flash / SD-card cartridge, you don't need any
soldering or special tools. Just copy the file across.

Cartridges that are known to work:

- **MegaFlashROM SCC+ SD** (from the MSX Cartridge Shop, 1chipMSX)
- **Carnivore-2**
- **GR8NET**
- **MultiCarta**
- Any other multi-cart that lets you load a ROM from an SD card and
  pick the *cartridge mapper* in its menu

### Steps

1. Copy `Sakhr MSX Story Demo.rom` to the SD card of your multi-cart.
2. Insert the multi-cart into your MSX, switch the machine on.
3. From the cart's loader menu, find the file and **before launching it,
   set the mapper / ROM type to "ASCII 16K"** (sometimes shown as
   `ASCII16` or `ASCII-16K`).
4. Confirm / launch. The splash screen should appear after a short
   delay.

> **Why the mapper setting matters.** A 160 KB cartridge has to swap
> blocks of memory in and out of the computer's view as the program
> runs, and several different layouts existed historically. This demo
> uses the layout known as **ASCII 16K** and includes a small fingerprint
> at boot that lets most multi-carts identify the mapper automatically.
> If your multi-cart's auto-detect doesn't pick ASCII 16K (the screen
> stays black or shows garbled colours after pressing Space on the
> splash), set the mapper manually to ASCII 16K and reload.

If your multi-cart's menu doesn't list ASCII 16K at all, it likely
can't run 160 KB ASCII16 carts. Almost every modern multi-cart does
support ASCII 16K, but a few older / hobby boards don't — check your
model's manual.

---

## Route 2 — A dedicated burned cartridge

If you'd like a permanent cartridge that's just *this* demo, with a
nice label on it, the cartridge has to be assembled by someone with
EPROM-burning tools. Hand the shopping list below to your local
MSX-friendly retro-tech friend if you don't do this yourself.

What goes inside the cartridge:

- A standard MSX cartridge shell.
- **An EPROM or flash chip of at least 256 KB** for the ROM (the demo
  is 160 KB, but the next standard chip size up from 128 KB is 256 KB —
  256-KB chips simply leave their upper 96 KB unused). Common parts:
  `M27C2001` (UV-EPROM, 256 KB) or `AT29C020` (flash EEPROM, 256 KB).
- **A cartridge PCB with the ASCII 16K mapper.** This was the layout
  used by many ASCII / Microcabin titles in the 1980s. An unused PCB
  from one of those games (with its EPROM removed) works perfectly,
  and brand-new boards of this type are still sold by hobby retailers
  (search for *MSX ASCII16 cartridge PCB*).

The recipe is: burn `Sakhr MSX Story Demo.rom` onto the chip starting
at offset 0 (no header, no wrapping), socket it onto the ASCII 16K PCB,
close the shell, label it, plug it in.

---

## What you should see when it plays

- 5–7 seconds of the MSX's normal start-up screen.
- The demo's splash: title rises, MSX logo settles, comet flies, music
  begins, and the prompt `مسافة للاستمرار` appears at the bottom.
- **Press the Space bar** to walk through four biographical / story
  slides — Mohammed Al-Sharekh, Nabil Ali, the Sakhr Computer story,
  and the Sakhr AX-100 (1984) — one after the other.
- **Press M** at any time to mute or un-mute the music.
- **Press Space at the last slide** → the demo loops back to the
  splash and starts over.

If the screen stays black or shows garbled colours and never reaches
the splash, the mapper is almost certainly set to the wrong type — go
back to your multi-cart's menu and pick **ASCII 16K** explicitly. For
a burned cartridge that misbehaves, the chip burn or the PCB itself
is the place to look.

Enjoy.
