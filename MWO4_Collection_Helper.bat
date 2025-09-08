@echo off
setlocal enabledelayedexpansion

pushd "%~dp0"

echo ===============================================================================
echo     MWO4 Mod Collection Helper
echo ===============================================================================
echo.

net session >nul 2>&1 || (
    echo FAIL: Script must be run as Administrator.
    timeout /t 2 /nobreak >nul & pause & exit /b 1
)

if not exist ".\data" (
    echo FAIL: ".\data" folder not found. Please relocate script to ~\Oblivion\*
    timeout /t 2 /nobreak >nul & pause & exit /b 1
) else (
    echo PASS: ".\data" folder found.
)

:: ---------- OBSE_Kyoma_MenuQue.dll ----------
if exist ".\Data\OBSE\Plugins\OBSE_Kyoma_MenuQue.dll" (
    del /F /Q ".\Data\OBSE\Plugins\OBSE_Kyoma_MenuQue.dll"
    echo PASS: OBSE_Kyoma_MenuQue.dll removed.
) else (
    echo PASS: No OBSE_Kyoma_MenuQue.dll file to delete.
)

:: ---------- ORM -Travelers' Cloaks.esp ----------
set "src=.\Data\Travelers' Cloaks 2.0\01 PluginsTravelers' Cloaks 2.0\01 Plugins\ORM -Travelers' Cloaks.esp"
set "dst=.\Data\ORM -Travelers' Cloaks.esp"

if exist "%dst%" (
    echo PASS: ORM -Travelers' Cloaks.esp already in Data folder.
) else if exist "%src%" (
    move /Y "%src%" "%dst%" >nul
    echo PASS: ORM -Travelers' Cloaks.esp moved ^(overwrote existing if any^).
) else (
    echo FAIL: ORM -Travelers' Cloaks.esp not found in bundle path.
)

:: ---------- Version.dll ----------
if exist ".\Version.dll" (
    echo PASS: Version.dll already in root folder.
) else if exist ".\Data\Version.dll" (
    move /Y ".\Data\Version.dll" ".\Version.dll" >nul
    echo PASS: Version.dll moved ^(overwrote existing if any^).
) else (
    echo FAIL: Version.dll not found in .\Data.
)

:: ---------- MoreHeap.ini ----------
if exist ".\MoreHeap.ini" (
    echo PASS: MoreHeap.ini already in root folder.
) else if exist ".\Data\MoreHeap.ini" (
    copy /Y ".\Data\MoreHeap.ini" ".\MoreHeap.ini" >nul
    echo PASS: MoreHeap.ini deployed ^(overwrote existing if any^).
) else (
    echo FAIL: MoreHeap.ini not found in .\Data.
)

:: ---------- Elys Silent Voice ----------
set "elysPath=.\Data\obse\plugins"
set "elysMissing=0"
for %%f in (Elys_USV.dll Elys_USV.lip Elys_USV.mp3 Elys_USV.txt) do (
    if not exist "%elysPath%\%%f" set "elysMissing=1"
)
if %elysMissing%==1 (
    echo FAIL: Elys Silent Voice files incomplete in %elysPath%
) else (
    echo PASS: Elys Silent Voice files all present.
)

echo.
pause
endlocal