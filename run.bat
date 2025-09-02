@echo off
REM Meshtastic GUI Runner Script for Windows
REM This script activates the virtual environment and runs the GUI

echo 🚀 Starting Meshtastic GUI...

REM Check if virtual environment exists
if not exist "venv" (
    echo ❌ Virtual environment not found!
    echo Please run install.bat first to set up the environment.
    pause
    exit /b 1
)

REM Check if GUI is installed in venv
if not exist "venv\Scripts\meshtastic-gui.exe" (
    echo ❌ Meshtastic GUI not installed in virtual environment!
    echo Please run install.bat to install the GUI.
    pause
    exit /b 1
)

REM Activate virtual environment and run GUI
if exist "venv\Scripts\activate.bat" (
    call venv\Scripts\activate.bat
    echo ✅ Virtual environment activated
    echo 🎯 Launching Meshtastic GUI...
    meshtastic-gui
) else (
    echo ❌ Could not find virtual environment activation script
    pause
    exit /b 1
)