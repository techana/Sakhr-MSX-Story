#!/usr/bin/env bash
# ===========================================================================
# openmsx.sh — launch "Sakhr MSX Story Demo" in openMSX on macOS / Linux.
#
# What this does:
#   • finds the openMSX binary in the usual install locations
#   • inserts the ROM beside this script as cartridge slot A
#   • forces the cartridge mapper to ASCII16 (the ROM uses ASCII16 banking,
#     openMSX cannot reliably auto-detect that for 128 KB images)
#   • selects a generic MSX machine that ships *with* openMSX (the C-BIOS
#     configs), so you don't have to provide any extra ROM image:
#         openmsx.sh         → C-BIOS_MSX2   (default, runs on MSX2 hardware)
#         openmsx.sh 1       → C-BIOS_MSX1   (forces MSX1 mode)
#         openmsx.sh 2       → C-BIOS_MSX2   (same as default)
#   • passing any other string is treated as a literal openMSX machine ID:
#         openmsx.sh Sony_HB-10
#         openmsx.sh Al_Alamiah_AX370
# ===========================================================================
set -euo pipefail

DIR="$(cd "$(dirname "$0")" && pwd)"
ROM="$DIR/Sakhr MSX Story Demo.rom"

case "${1:-}" in
    "" | "2")    MACHINE="C-BIOS_MSX2" ;;
    "1")         MACHINE="C-BIOS_MSX1" ;;
    *)           MACHINE="$1"           ;;
esac

# Locate openMSX binary.
OPENMSX="${OPENMSX:-}"
if [[ -z "$OPENMSX" ]]; then
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
fi
if [[ -z "$OPENMSX" ]] && command -v openmsx >/dev/null 2>&1; then
    OPENMSX="$(command -v openmsx)"
fi
if [[ -z "$OPENMSX" ]]; then
    echo "openMSX not found." >&2
    echo "Install it from https://openmsx.org and re-run, or set the" >&2
    echo "OPENMSX environment variable to the binary path." >&2
    exit 1
fi

if [[ ! -f "$ROM" ]]; then
    echo "ROM not found: $ROM" >&2
    exit 1
fi

echo "openMSX: $OPENMSX"
echo "machine: $MACHINE"
echo "ROM:     $ROM"
# We still pass -romtype ASCII16 explicitly. Auto-detect succeeds on
# this ROM (the boot code lays down a mapper-detect fingerprint), but
# pinning is harmless and shaves a few frames of detection latency.
exec "$OPENMSX" -machine "$MACHINE" -carta "$ROM" -romtype ASCII16
