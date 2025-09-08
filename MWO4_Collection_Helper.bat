@echo off
setlocal enabledelayedexpansion

:: 1) DP0 to script dir
pushd "%~dp0"

:: 2) Print header
echo ===============================================================================
echo     MWO4 Mod Collection Helper 
echo ===============================================================================
echo.

:: 3) Check for admin rights
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: This script must be run as Administrator.
    timeout /t 2 /nobreak >nul
    exit /b 1
)

:: 4) Check for .\data folder
if not exist ".\data" (
    echo ERROR: ".\data" folder not found.
    timeout /t 2 /nobreak >nul
    exit /b 1
) else (
    echo SUCCESS: ".\data" folder found.
)

:: 5) Check and delete OBSE_Kyoma_MenuQue.dll
if exist ".\Data\OBSE\Plugins\OBSE_Kyoma_MenuQue.dll" (
    del ".\Data\OBSE\Plugins\OBSE_Kyoma_MenuQue.dll"
    echo DELETED: OBSE_Kyoma_MenuQue.dll
) else (
    echo NOT FOUND: OBSE_Kyoma_MenuQue.dll
)

:: 6) Check and move ORM -Travelers' Cloaks.esp
set "source=.\Data\Travelers' Cloaks 2.0\01 PluginsTravelers' Cloaks 2.0\01 Plugins\ORM -Travelers' Cloaks.esp"
set "dest=.\Data\ORM -Travelers' Cloaks.esp"

if exist "%source%" (
    move "%source%" "%dest%" >nul
    echo MOVED: ORM -Travelers' Cloaks.esp to Data folder
) else (
    echo NOT FOUND: ORM -Travelers' Cloaks.esp in expected path
)

:: 7) Check and move Version.dll
if exist ".\Data\Version.dll" (
    move ".\Data\Version.dll" ".\Version.dll" >nul
    echo MOVED: Version.dll to root
) else (
    echo NOT FOUND: Version.dll in .\Data
)

:: 8) Report Elys Silent Voice files location
set "elysPath=.\Data\obse\plugins"
set "elysFiles=Elys_USV.dll Elys_USV.lip Elys_USV.mp3 Elys_USV.txt"

set "elysMissing=0"
for %%f in (%elysFiles%) do (
    if not exist "%elysPath%\%%f" (
        set "elysMissing=1"
    )
)

if %elysMissing%==0 (
    echo ELYS SILENT VOICE: All 4 files correctly located in %elysPath%
) else (
    echo ELYS SILENT VOICE: One or more files missing in %elysPath%
)

echo.
pause
endlocal