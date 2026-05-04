@echo off
REM ===========================================================================
REM openmsx.bat -- launch "Sakhr MSX Story Demo" in openMSX on Windows.
REM
REM What this does:
REM   * locates the openMSX executable (default Program Files install path,
REM     fallback to PATH lookup)
REM   * inserts the ROM beside this batch file as cartridge slot A
REM   * forces the cartridge mapper to ASCII16 (the ROM uses ASCII16 banking;
REM     openMSX cannot reliably auto-detect that for 128 KB images)
REM   * selects a generic MSX machine that ships *with* openMSX (the C-BIOS
REM     configs), so you don't have to provide any extra ROM image:
REM         openmsx.bat        --> C-BIOS_MSX2   (default, runs on MSX2 hw)
REM         openmsx.bat 1      --> C-BIOS_MSX1   (forces MSX1 mode)
REM         openmsx.bat 2      --> C-BIOS_MSX2   (same as default)
REM   * passing any other string is treated as a literal openMSX machine ID:
REM         openmsx.bat Sony_HB-10
REM         openmsx.bat Al_Alamiah_AX370
REM ===========================================================================

setlocal

set "DIR=%~dp0"
set "ROM=%DIR%Sakhr MSX Story Demo.rom"

if "%~1"=="" (
    set "MACHINE=C-BIOS_MSX2"
) else if "%~1"=="2" (
    set "MACHINE=C-BIOS_MSX2"
) else if "%~1"=="1" (
    set "MACHINE=C-BIOS_MSX1"
) else (
    set "MACHINE=%~1"
)

REM Locate openMSX. Default install path is under Program Files.
set "OPENMSX="
if exist "%ProgramFiles%\openMSX\openmsx.exe" set "OPENMSX=%ProgramFiles%\openMSX\openmsx.exe"
if not defined OPENMSX if exist "%ProgramFiles(x86)%\openMSX\openmsx.exe" set "OPENMSX=%ProgramFiles(x86)%\openMSX\openmsx.exe"
if not defined OPENMSX (
    where openmsx >nul 2>&1
    if not errorlevel 1 (
        for /f "delims=" %%I in ('where openmsx') do set "OPENMSX=%%I"
    )
)
if not defined OPENMSX (
    echo openMSX not found. Install it from https://openmsx.org and re-run,
    echo or set OPENMSX to the openmsx.exe path.
    exit /b 1
)

if not exist "%ROM%" (
    echo ROM not found: %ROM%
    exit /b 1
)

echo openMSX: %OPENMSX%
echo machine: %MACHINE%
echo ROM:     %ROM% (ASCII16 mapper)

"%OPENMSX%" -machine "%MACHINE%" -carta "%ROM%" -romtype ASCII16

endlocal
