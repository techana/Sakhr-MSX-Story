#!/usr/bin/env bash
# ===========================================================================
# openmsx.sh — launch "Sakhr MSX Story Demo" in openMSX on macOS / Linux.
#
# What this does:
#   • finds the openMSX binary in the usual install locations
#   • inserts the ROM beside this script as cartridge slot A
#   • forces the cartridge mapper to ASCII16 (the ROM uses ASCII16 banking,
#     openMSX cannot reliably auto-detect that for 128 KB images)
#   • selects an MSX1 machine (Sony HB-10) so the demo runs on its primary
#     target hardware
#
# To play on a different machine, edit MACHINE below or pass it as the
# first argument:   ./openmsx.sh msx2          (or "msx2plus", "turboR", …)
# ===========================================================================
set -euo pipefail

DIR="$(cd "$(dirname "$0")" && pwd)"
ROM="$DIR/Sakhr MSX Story Demo.rom"
MACHINE="${1:-Sony_HB-10}"      # MSX1 by default

# Locate openMSX binary.
OPENMSX=""
for cand in \
    "/Applications/openMSX.app/Contents/MacOS/openmsx" \
    "/usr/local/bin/openmsx" \
    "/opt/homebrew/bin/openmsx" \
    "/usr/bin/openmsx"
do
    if [[ -x "$cand" ]]; then
        OPENMSX="$cand"
        break
    fi
done
if [[ -z "$OPENMSX" ]]; then
    if command -v openmsx >/dev/null 2>&1; then
        OPENMSX="$(command -v openmsx)"
    else
        echo "openMSX not found." >&2
        echo "Install it from https://openmsx.org and re-run, or set the" >&2
        echo "OPENMSX environment variable to the binary path." >&2
        exit 1
    fi
fi

if [[ ! -f "$ROM" ]]; then
    echo "ROM not found: $ROM" >&2
    exit 1
fi

echo "openMSX: $OPENMSX"
echo "machine: $MACHINE"
echo "ROM:     $ROM (ASCII16 mapper)"
exec "$OPENMSX" -machine "$MACHINE" -carta "$ROM" -romtype ASCII16
