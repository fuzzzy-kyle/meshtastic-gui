#!/usr/bin/env python3
"""Test script to verify the GUI can be imported and basic functionality works."""

import sys
import importlib.util

def test_import():
    """Test if we can import the main GUI module."""
    try:
        # Test importing the module
        spec = importlib.util.spec_from_file_location(
            "meshtastic_gui", 
            "src/meshtastic_gui/__init__.py"
        )
        module = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(module)
        
        print("✓ Successfully imported meshtastic_gui module")
        print(f"✓ Version: {module.__version__}")
        print(f"✓ Description: {module.__description__}")
        
        # Test if we can import the GUI class (but don't instantiate it)
        from src.meshtastic_gui.gui import MeshtasticGUI
        print("✓ Successfully imported MeshtasticGUI class")
        
        return True
        
    except ImportError as e:
        print(f"✗ Import error: {e}")
        if "meshtastic" in str(e):
            print("  Note: You need to install the meshtastic library first:")
            print("  pip install meshtastic")
        return False
    except Exception as e:
        print(f"✗ Unexpected error: {e}")
        return False

def test_dependencies():
    """Check if required dependencies are available."""
    required_deps = ['meshtastic', 'pubsub', 'tkinter']
    missing_deps = []
    
    for dep in required_deps:
        try:
            if dep == 'pubsub':
                # pubsub is imported as 'from pubsub import pub'
                import pubsub
            else:
                __import__(dep)
            print(f"✓ {dep} is available")
        except ImportError:
            missing_deps.append(dep)
            print(f"✗ {dep} is missing")
    
    return len(missing_deps) == 0

if __name__ == "__main__":
    print("Testing Meshtastic GUI Installation")
    print("=" * 40)
    
    # Test dependencies first
    deps_ok = test_dependencies()
    print()
    
    # Test import
    import_ok = test_import()
    print()
    
    if deps_ok and import_ok:
        print("✓ All tests passed! The GUI should work correctly.")
        print("\nRecommended installation (with virtual environment):")
        print("Linux/macOS: ./install.sh")
        print("Windows: install.bat")
        print("\nManual installation:")
        print("1. Create virtual environment: python3 -m venv venv")
        print("2. Activate: source venv/bin/activate (Linux/macOS) or venv\\Scripts\\activate (Windows)")
        print("3. Install dependencies: pip install -r requirements.txt")
        print("4. Install GUI: pip install -e .")
        print("5. Run GUI: meshtastic-gui")
    else:
        print("✗ Some tests failed. Please check the errors above.")
        sys.exit(1)