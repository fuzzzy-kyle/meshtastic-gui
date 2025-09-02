"""Meshtastic GUI - A tkinter-based GUI for Meshtastic devices

This package provides a user-friendly graphical interface for the Meshtastic Python library.
"""

__version__ = "1.0.0"
__author__ = "Meshtastic Community"
__description__ = "A tkinter-based GUI for Meshtastic devices"

from .gui import MeshtasticGUI, main

__all__ = ['MeshtasticGUI', 'main']