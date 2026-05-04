# Playing *Sakhr MSX Story Demo* in an emulator (manual launch)

The cartridge image distributed here is a **128 KB ASCII16-mapper ROM**.
The ROM lays down an auto-detect fingerprint at boot, so most modern
emulators (openMSX, blueMSX, WebMSX) recognise it on their own — you
can usually just open it as a cartridge and it works. If your emulator
of choice doesn't auto-detect, set the mapper type to **ASCII 16K**
manually.

If you'd rather skip all this, just run the bundled launcher:

- macOS / Linux:   `./openmsx.sh`
- Windows:         `openmsx.bat`

Both scripts find openMSX, set the mapper to ASCII16, pick a generic
**C-BIOS MSX2** machine that ships with openMSX, and start the ROM in
one step. The first argument selects the machine:

```
./openmsx.sh                    # default: C-BIOS_MSX2 (bundled, MSX2 mode)
./openmsx.sh 2                  # same as above
./openmsx.sh 1                  # C-BIOS_MSX1 (bundled, MSX1 mode)
./openmsx.sh Sony_HB-10         # any openMSX machine ID also works,
./openmsx.sh Al_Alamiah_AX370   # if its BIOS ROMs are installed
./openmsx.sh Al_Alamiah_AX170
```

Same syntax with `openmsx.bat` on Windows.

## Files in this distribution

```
Sakhr MSX Story Demo.rom              ← the ROM image (131,072 bytes)
openmsx.sh, openmsx.bat               ← one-click launchers
play from physical cartridge.md       ← physical-cart playing guide
play from physical cartridge -ar.md
play in emulator.md                   ← this file
play in emulator -ar.md
```

## openMSX (recommended) — manual launch

openMSX is the most accurate MSX emulator and is free / open-source.
Install it from <https://openmsx.org/>.

### A note on machine configurations

openMSX needs a *machine config* (a virtual MSX model) to run any cart.
The bundled installer ships with the **C-BIOS** family of machines —
clean, royalty-free MSX implementations covering MSX1 and MSX2 — and
those work for this demo without any extra setup. Use them unless you
have a specific real-machine config (Sony HB-10, Sakhr AX-370, …) and
its BIOS ROM dumps installed; those produce slightly more authentic
behaviour but are not required.

| Use this machine ID         | When                                          |
| --------------------------- | --------------------------------------------- |
| `C-BIOS_MSX2`               | Default — runs everywhere, bundled, MSX2 hw   |
| `C-BIOS_MSX1`               | Force MSX1 mode (the demo's primary target)   |
| `Sony_HB-10`                | If you have the Sony HB-10 BIOS installed     |
| `Al_Alamiah_AX370`          | If you have the Sakhr AX-370 BIOS installed   |

### From a terminal / command line

macOS:
```
/Applications/openMSX.app/Contents/MacOS/openmsx \
    -machine C-BIOS_MSX2 \
    -carta "Sakhr MSX Story Demo.rom" \
    -romtype ASCII16
```

Linux:
```
openmsx -machine C-BIOS_MSX2 -carta "Sakhr MSX Story Demo.rom" -romtype ASCII16
```

Windows (PowerShell):
```
& "C:\Program Files\openMSX\openmsx.exe" `
    -machine C-BIOS_MSX2 `
    -carta "Sakhr MSX Story Demo.rom" `
    -romtype ASCII16
```

What each flag does:

| Flag                  | Meaning                                                |
| --------------------- | ------------------------------------------------------ |
| `-machine C-BIOS_MSX2`| Hardware profile. `C-BIOS_MSX2` ships with openMSX, no extra ROM needed. Swap for `C-BIOS_MSX1` to run as MSX1, or use `Sony_HB-10` / `Al_Alamiah_AX370` if you have those BIOS images. |
| `-carta <ROM>`        | Insert into cartridge slot A.                          |
| `-romtype ASCII16`    | **Force the ASCII16 mapper.** Required — auto-detect can pick the wrong type for 128 KB ROMs. |

### From the openMSX GUI menu

1. Launch openMSX with no command-line arguments.
2. Press **F10** to open the on-screen control bar.
3. **Hardware → Change Machine** → pick *C-BIOS MSX2* (or *C-BIOS MSX1*
   for MSX1 mode, or *Sony HB-10* / *Sakhr AX-370* if you have those
   installed).
4. **Media → Cartridge Slot A → Insert ROM image…** and select
   `Sakhr MSX Story Demo.rom`.
5. **Media → Cartridge Slot A → Mapper Type** → **ASCII16**.
6. **Hardware → Reset Machine** (or just close and re-insert the cart).

If the screen comes up black, garbled, or never reaches the splash, the
mapper is almost certainly wrong. Repeat step 5 and reset.

## Other emulators

The demo works on any emulator that supports the MSX-DOS-era ASCII16 cart
mapper. The exact menu wording varies — look for *Mapper / ROM type /
Slot type* and select **ASCII 16K** (sometimes labeled `ASCII16` or
`ASCII-16K`).

| Emulator      | Where to set the mapper                                    |
| ------------- | ----------------------------------------------------------- |
| openMSX       | `-romtype ASCII16` flag, or **Media → Cart Slot A → Mapper Type** |
| blueMSX       | **Cartridge → Insert ROM…** then choose **ASCII16** in the type dropdown |
| WebMSX        | Drag-drop the ROM onto the page, then top-right gear → **Cartridge → ROM Format → ASCII16** |
| MSX-Emul (Mac)| **Cart → ROM Type → ASCII 16K** |
| fMSX (TI-99 fork) | `-rom <file> -ascii16` from the command line |

If your emulator only offers Konami / Konami SCC / Plain mappers, it
won't run this 128 KB image — switch to one with ASCII16 support
(openMSX, blueMSX, or WebMSX all have it).

## Why the mapper matters

A 128 KB ROM is twice the size of an MSX1's 64 KB cartridge address
window, so the ROM is split into eight 16 KB *banks* and the cart's
mapper hardware swaps which bank appears on the bus when the CPU
executes code. ASCII16 is the specific bank-switch protocol this ROM
uses:

- Write a bank number 0..7 to address `$6000` → that bank appears at CPU
  range `$4000..$7FFF` (page 1).
- Write a bank number 0..7 to address `$7000` → that bank appears at CPU
  range `$8000..$BFFF` (page 2).

If the emulator thinks the cart is *Plain* (no mapper), the writes to
`$6000`/`$7000` are silently ignored and the CPU only ever sees the
first 32 KB of the ROM — which never includes the slide assets, so the
demo shows the splash but garbles or freezes the moment you press Space
to leave it. If it picks *Konami* (MegaROM) by mistake, the bank-select
addresses are different (`$5000`/`$7000` etc.) and again the wrong
bytes get switched in.

This is why every launch has to specify ASCII16 explicitly.

## What you should see when it runs

After 5–7 seconds of BIOS POST:

1. **Splash** — title rises, MSX logo settles, comet flies, music kicks in,
   `مسافة للاستمرار` prompt appears at the bottom.
2. **Press Space** → Slide 1 (Mohammed Al-Sharekh biography, body
   text typed letter-by-letter with MSX keyclicks at word boundaries).
3. **Press Space again** → Slide 2 (Nabil Ali biography).
4. **Press Space again** → Slide 3 (Sakhr Computer story on the CRT
   monitor backdrop).
5. **Press Space at slide 3** → loops back to the splash.
6. **Press M** at any time after the splash → toggles music mute on/off.

If music sounds garbled or speed is wrong, set the emulator's machine to
an MSX1 (the demo's PSG envelope timings are tuned to TMS9918 60 Hz —
MSX2/2+/turboR work fine but the audio detail is calibrated for MSX1
silicon).
