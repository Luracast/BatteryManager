#!/bin/bash
set -e
SRC_DIR="src"
SCRIPTS_DIR="scripts"
UNSIGNED_FILE="Battery Manager.shortcut"
SIGNED_FILE="BatteryManager.shortcut"

mkdir -p "$SCRIPTS_DIR"
shortcuts sign -m anyone -i "$SRC_DIR/$UNSIGNED_FILE" -o "$SCRIPTS_DIR/$SIGNED_FILE"

pkgbuild --nopayload \
         --identifier lib.arul.batterymanager \
         --version 1.0 \
         --scripts scripts \
         BatteryManagerInstaller.pkg