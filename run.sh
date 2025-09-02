#!/bin/bash

# Meshtastic GUI Runner Script
# This script activates the virtual environment and runs the GUI

set -e

echo "🚀 Starting Meshtastic GUI..."

# Check if virtual environment exists
if [ ! -d "venv" ]; then
    echo "❌ Virtual environment not found!"
    echo "Please run ./install.sh first to set up the environment."
    exit 1
fi

# Check if GUI is installed in venv
if [ ! -f "venv/bin/meshtastic-gui" ] && [ ! -f "venv/Scripts/meshtastic-gui.exe" ]; then
    echo "❌ Meshtastic GUI not installed in virtual environment!"
    echo "Please run ./install.sh to install the GUI."
    exit 1
fi

# Activate virtual environment and run GUI
if [ -f "venv/bin/activate" ]; then
    # Unix/Linux/macOS
    source venv/bin/activate
    echo "✅ Virtual environment activated"
    echo "🎯 Launching Meshtastic GUI..."
    meshtastic-gui
elif [ -f "venv/Scripts/activate" ]; then
    # Windows (Git Bash/WSL)
    source venv/Scripts/activate
    echo "✅ Virtual environment activated"
    echo "🎯 Launching Meshtastic GUI..."
    meshtastic-gui
else
    echo "❌ Could not find virtual environment activation script"
    exit 1
fi