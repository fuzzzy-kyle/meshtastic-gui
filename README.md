# Meshtastic GUI

A user-friendly graphical interface for Meshtastic devices built with tkinter.

## Overview

Meshtastic GUI provides an intuitive desktop application for interacting with Meshtastic mesh networking devices. It offers a comprehensive interface for device management, node visualization, messaging, and configuration.

## Features

- **Device Connection**: Connect via Serial (USB), TCP/IP, or Bluetooth LE
- **Mesh Network Visualization**: View all nodes in your mesh network with real-time updates
- **Messaging**: Send and receive text messages with full conversation history
- **Node Management**: 
  - Favorite nodes for quick access
  - Request position and telemetry data
  - Perform network traceroutes
  - Ping nodes to test connectivity
- **Configuration**: Manage device and channel settings
- **Monitoring**: Real-time packet monitoring and logging
- **Data Export**: Export conversations, node data, and packet logs

## Installation

### Prerequisites

First, install the Meshtastic CLI library:

```bash
pip install meshtastic
```

### Install Meshtastic GUI

```bash
pip install meshtastic-gui
```

## Usage

### Launch the GUI

After installation, you can launch the GUI in several ways:

```bash
# Command line
meshtastic-gui

# Or as a Python module
python -m meshtastic_gui
```

### Getting Started

1. **Connect to Device**:
   - Use the Connection tab to select your connection method
   - For USB: Select your serial port
   - For TCP: Enter IP address and port
   - For BLE: Choose from discovered devices

2. **View Network**:
   - The Mesh Nodes tab shows all discovered nodes
   - Favorite important nodes using the star column
   - Double-click nodes for quick actions

3. **Send Messages**:
   - Use the Messages tab to communicate
   - Select recipients from the dropdown
   - View conversation history in the active chats

4. **Monitor Activity**:
   - The Monitor tab shows real-time packet data
   - Export logs for analysis
   - Use CLI commands for advanced operations

## Requirements

- Python 3.8 or higher
- Meshtastic CLI library (automatically installed as dependency)
- tkinter (usually included with Python)
- Operating System: Windows, macOS, or Linux

## Device Compatibility

Compatible with all Meshtastic-supported devices:
- ESP32-based devices
- nRF52-based devices
- Native NRF52 devices
- And more...

Supports all connection methods:
- USB/Serial
- WiFi (TCP)
- Bluetooth Low Energy

## Development

To set up for development:

```bash
git clone https://github.com/meshtastic/gui.git
cd gui
pip install -e .[dev]
```

## Contributing

Contributions are welcome! Please feel free to submit pull requests, report bugs, or suggest features.

## License

This project is licensed under the GPL-3.0 License - see the LICENSE file for details.

## Support

- [Meshtastic Documentation](https://meshtastic.org/)
- [Community Discord](https://discord.gg/meshtastic)
- [GitHub Issues](https://github.com/meshtastic/gui/issues)

## Acknowledgments

Built on top of the excellent [Meshtastic Python library](https://github.com/meshtastic/python).