#!/bin/bash

# Meshtastic GUI Installation Script
# This script sets up a Python virtual environment and installs the GUI

set -e  # Exit on any error

echo "🚀 Meshtastic GUI Installation Script"
echo "======================================"

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 is required but not installed."
    echo "Please install Python 3.8 or higher and try again."
    exit 1
fi

# Check Python version
PYTHON_VERSION=$(python3 -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
echo "📋 Found Python $PYTHON_VERSION"

# Check if version is >= 3.8
if python3 -c 'import sys; exit(0 if sys.version_info >= (3, 8) else 1)'; then
    echo "✅ Python version is compatible"
else
    echo "❌ Python 3.8 or higher is required. Found: $PYTHON_VERSION"
    exit 1
fi

# Create virtual environment
VENV_DIR="venv"
echo "📦 Creating virtual environment in '$VENV_DIR'..."

if [ -d "$VENV_DIR" ]; then
    echo "⚠️  Virtual environment already exists. Removing old one..."
    rm -rf "$VENV_DIR"
fi

python3 -m venv "$VENV_DIR"

# Activate virtual environment
echo "🔧 Activating virtual environment..."
source "$VENV_DIR/bin/activate"

# Upgrade pip
echo "⬆️  Upgrading pip..."
python -m pip install --upgrade pip

# Install dependencies
echo "📥 Installing dependencies..."
pip install -r requirements.txt

# Install the GUI in development mode
echo "📦 Installing Meshtastic GUI..."
pip install -e .

# Test the installation
echo "🧪 Testing installation..."
python -c "
try:
    import meshtastic_gui
    print('✅ meshtastic_gui module imported successfully')
    print(f'✅ Version: {meshtastic_gui.__version__}')
except ImportError as e:
    print(f'❌ Import failed: {e}')
    exit(1)
"

echo ""
echo "🎉 Installation completed successfully!"
echo ""
echo "To run the Meshtastic GUI:"
echo "  1. Activate the virtual environment: source venv/bin/activate"
echo "  2. Run the GUI: meshtastic-gui"
echo ""
echo "Or use the run.sh script for convenience: ./run.sh"
echo ""

# Create activation script
cat > activate.sh << 'EOF'
#!/bin/bash
# Activation script for Meshtastic GUI virtual environment
source venv/bin/activate
echo "✅ Virtual environment activated!"
echo "You can now run: meshtastic-gui"
EOF

chmod +x activate.sh

echo "💡 Tip: Use './activate.sh' to quickly activate the virtual environment"