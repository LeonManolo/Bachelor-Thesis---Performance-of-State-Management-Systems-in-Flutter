# Script to disable or enable specific packages for a samsung galaxy s10 runnign LineageOS 20
# to run: lineageos_manage_android_packages.sh [disable|enable]

# Search for enabled packages: pm list packages -e | grep '<KEYWORD>'
# List of diabled packages: pm list packages -d
# List of enabled packages: pm list packages -e
# List of all packages: pm list packages

# sideloading magisk from recorvery mode: adb -d sideload Magisk-v27.0.apk

# requires root
adb root

# Determine the action based on input parameter or use default
ACTION=$1
PARSED_ACTION=""

if [ "$ACTION" = "disable" ]; then
  PARSED_ACTION="disable"
elif [ "$ACTION" = "enable" ]; then
  PARSED_ACTION="enable"
else
  echo "Action not specified, using default values"
fi

# Function to enable or disable a package
# true = enable, false = disable
manage_package() {
  local PACKAGE_NAME=$1
  local DEFAULT_ACTION=$2
  local CURRENT_ACTION=$PARSED_ACTION

  # Checks if the ACTION variable is empty (-z return true if the variable is empty)
  if [ -z "$CURRENT_ACTION" ]; then
    if [ "$DEFAULT_ACTION" = false ]; then
      CURRENT_ACTION="disable"
    else
      CURRENT_ACTION="enable"
    fi
  fi

  #echo "Attempting to $CURRENT_ACTION package: $PACKAGE_NAME"
  adb shell -t su -c "pm $CURRENT_ACTION $PACKAGE_NAME"
}

# ---- Lineage OS Packages ----

# List of packages with their default actions

# Recorder (App)
manage_package "org.lineageos.recorder" true

# Calendar (App)
manage_package "org.lineageos.etar" true

# Music (App)
manage_package "org.lineageos.eleven" true

# Gallery (App)
manage_package "com.android.gallery3d" true

# Calculator (App)
#manage_package "com.android.calculator2" false

# Samung Dolby Atmos Plugin
#manage_package "org.lineageos.dap" false



# ---- Android Packages ----

# Messaging (App)
manage_package "com.android.messaging" true

# Contacts (App)
manage_package "com.android.contacts" true

# Bluetooth
manage_package "com.android.bluetooth" true
# Bluetooth MIDI Service
manage_package "com.android.bluetoothmidiservice" true

# Quick Share/ Nearby Share?
manage_package "com.android.nearby.halfsheet" true

# NFC
manage_package "com.android.nfc" true

# NFC Tags
manage_package "com.android.apps.tag" true

# Android Q Easter Egg
manage_package "com.android.egg" true

# Android Home Screen Clock Widget
manage_package "com.android.deskclock" true

# SAVE UNITL HERE

# Default Print Service
manage_package "com.android.bips" true

# Print Spooler
manage_package "com.android.printspooler" true

# Wallpaper Picker
#manage_package "com.android.wallpaper" true

Fused Location ---- DISABLING THIS PACKAGE RESULTS IN A BOOT LOOP! ----
###manage_package "com.android.location.fused" true

# Basic Daydreams
manage_package "com.android.dreams.basic" true

# Photo Screensavers
manage_package "com.android.dreams.phototable" true

# Android AdServices
manage_package "com.android.adservices.api" true

# Captive Portal Login Service (Login public WiFi)
manage_package "com.android.captiveportallogin" true

adb unroot
echo "Script completed."