@echo off
REM Meshtastic GUI Installation Script for Windows
REM This script sets up a Python virtual environment and installs the GUI

echo 🚀 Meshtastic GUI Installation Script (Windows)
echo ================================================

REM Check if Python is installed
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Python is required but not installed.
    echo Please install Python 3.8 or higher from python.org and try again.
    pause
    exit /b 1
)

REM Show Python version
echo 📋 Python version:
python --version

REM Create virtual environment
set VENV_DIR=venv
echo 📦 Creating virtual environment in '%VENV_DIR%'...

if exist "%VENV_DIR%" (
    echo ⚠️  Virtual environment already exists. Removing old one...
    rmdir /s /q "%VENV_DIR%"
)

python -m venv "%VENV_DIR%"

REM Activate virtual environment
echo 🔧 Activating virtual environment...
call "%VENV_DIR%\Scripts\activate.bat"

REM Upgrade pip
echo ⬆️  Upgrading pip...
python -m pip install --upgrade pip

REM Install dependencies
echo 📥 Installing dependencies...
pip install -r requirements.txt

REM Install the GUI in development mode
echo 📦 Installing Meshtastic GUI...
pip install -e .

REM Test the installation
echo 🧪 Testing installation...
python -c "import meshtastic_gui; print('✅ meshtastic_gui module imported successfully'); print(f'✅ Version: {meshtastic_gui.__version__}')"

if %errorlevel% neq 0 (
    echo ❌ Installation test failed
    pause
    exit /b 1
)

echo.
echo 🎉 Installation completed successfully!
echo.
echo To run the Meshtastic GUI:
echo   1. Run: run.bat
echo   or
echo   1. Activate the virtual environment: venv\Scripts\activate.bat
echo   2. Run the GUI: meshtastic-gui
echo.

REM Create activation batch file
echo @echo off > activate.bat
echo REM Activation script for Meshtastic GUI virtual environment >> activate.bat
echo call venv\Scripts\activate.bat >> activate.bat
echo echo ✅ Virtual environment activated! >> activate.bat
echo echo You can now run: meshtastic-gui >> activate.bat

echo 💡 Tip: Use 'activate.bat' to quickly activate the virtual environment
pause