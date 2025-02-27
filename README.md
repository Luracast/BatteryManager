# Battery Manager for macOS

Automated battery charge management system that protects your MacBook's battery health by maintaining optimal charge levels.

## Features
- Automatically enables charging when battery drops below 20%
- Disables charging when battery reaches 80%
- Runs continuously via launch agent (every 3 minutes)
- Includes installer package for easy deployment
- Self-contained installation with automatic shortcut configuration

## Installation

1. Build the installer package:
```bash
chmod +x build.sh
./build.sh
```

2. Install the package:
```bash
open BatteryManagerInstaller.pkg
```

The installer will:
- Copy launch agent to `~/Library/LaunchAgents`
- Load the background service
- Place shortcut on your Desktop for verification
- Automatically open the shortcut for initial configuration

## System Components

### `com.luracast.batterymanager.plist` (Launch Agent)
- Runs every 180 seconds (3 minutes)
- Executes the BatteryManager shortcut
- Automatic loading on system start
- Logs output to `/tmp/batterymanager.{out,err}`

### `postinstall` Script
- Installs launch agent to user's LaunchAgents directory
- Copies shortcut to Desktop
- Sets proper file permissions
- Loads the launch agent
- Clears file quarantine attributes

### `build.sh` Build Script
1. Signs all script files with developer ID
2. Creates installation package using pkgbuild
3. Sets proper permissions on package components

## Customization

To modify battery thresholds:
1. Open `BatteryManager.shortcut`
2. Edit the "If" conditions:
   - Change 20% (low threshold)
   - Change 80% (high threshold)
3. Rebuild and reinstall the package

## Troubleshooting

Check service status:
```bash
launchctl list | grep com.luracast.batterymanager
```

View logs:
```bash
tail -f /tmp/batterymanager.out /tmp/batterymanager.err
```

Uninstall:
```bash
launchctl remove com.luracast.batterymanager
rm ~/Library/LaunchAgents/com.luracast.batterymanager.plist
rm ~/Desktop/BatteryManager.shortcut
```

## License
MIT License - See [LICENSE](LICENSE) file for details
