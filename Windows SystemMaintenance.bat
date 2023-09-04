@echo off
title System Maintenance, USB Settings, and Website Opener

echo.
echo -----------------------------------------
echo   System Maintenance and USB Settings
echo -----------------------------------------
echo.

:: Check if running as administrator
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Please run this script as administrator.
    pause
    exit
)

:menu
cls
echo -----------------------------------------
echo   System Maintenance and USB Settings
echo -----------------------------------------
echo.
echo [1;33m1. [1;37mRun sfc /scannow
echo [1;33m2. [1;37mRun DISM /Online /Cleanup-Image /CheckHealth
echo [1;33m3. [1;37mRun DISM /Online /Cleanup-Image /ScanHealth
echo [1;33m4. [1;37mRun DISM /Online /Cleanup-Image /RestoreHealth
echo [1;33m5. [1;37mUSB Settings Modifier
echo [1;33m6. [1;37mOpen Website (https://dekoning.work)
echo [1;33m7. [1;37mExit
echo.

set /p choice=Enter your choice: 

if "%choice%"=="1" (
    echo Running sfc /scannow...
    sfc /scannow
    pause
    goto menu
) else if "%choice%"=="2" (
    echo Running DISM /Online /Cleanup-Image /CheckHealth...
    DISM /Online /Cleanup-Image /CheckHealth
    pause
    goto menu
) else if "%choice%"=="3" (
    echo Running DISM /Online /Cleanup-Image /ScanHealth...
    DISM /Online /Cleanup-Image /ScanHealth
    pause
    goto menu
) else if "%choice%"=="4" (
    echo Running DISM /Online /Cleanup-Image /RestoreHealth...
    DISM /Online /Cleanup-Image /RestoreHealth
    pause
    goto menu
) else if "%choice%"=="5" (
    call :usb_settings
    goto menu
) else if "%choice%"=="6" (
    start https://dekoning.work
    goto menu
) else if "%choice%"=="7" (
    exit
) else (
    echo Invalid choice. Please select a valid option.
    pause
    goto menu
)

:usb_settings
cls
echo -----------------------------------------
echo         USB Settings Modifier
echo -----------------------------------------
echo.
echo [1;33m1. [1;37mEnable USB Read/Write Permissions
echo [1;33m2. [1;37mAllow Write Access to Removable Drives
echo [1;33m3. [1;37mAllow Write Access to All Removable Media
echo [1;33m4. [1;37mBack to Main Menu
echo.

set /p usb_choice=Enter your choice: 

if "%usb_choice%"=="1" (
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\USBSTOR" /v "Start" /t REG_DWORD /d 3 /f
    echo USB Read/Write permissions have been enabled.
    pause
    goto usb_settings
) else if "%usb_choice%"=="2" (
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDrivesTypeAutoRun" /t REG_DWORD /d 0 /f
    echo Write access to removable drives has been allowed.
    pause
    goto usb_settings
) else if "%usb_choice%"=="3" (
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutoRun" /t REG_DWORD /d 0 /f
    echo Write access to all removable media has been allowed.
    pause
    goto usb_settings
) else if "%usb_choice%"=="4" (
    goto menu
) else (
    echo Invalid choice. Please select a valid option.
    pause
    goto usb_settings
)
