#!/bin/bash

# Purge most high-level snap apps, but don't completely remove snapd, and keep `firmware-updater`.
if [ -f "/usr/bin/snap" ]; then
    echo "Removing snap packages..."
    sudo snap remove --purge firefox
    sudo snap remove --purge thunderbird
    sudo snap remove --purge snap-store
    # Optional desktop integration snaps, not required for snapd to function.
    sudo snap remove --purge desktop-security-center
    sudo snap remove --purge prompting-client
    sudo snap remove --purge snapd-desktop-integration
    # Leftover theme, not needed once no snap apps use it.
    sudo snap remove --purge gtk-common-themes
    # Intentionally keep `firmware-updater` since it's a useful tool only available as a snap.
    # This also implies keeping these dependencies: bare, core24, snapd, gnome-46-2404, mesa-2404.
    sudo snap refresh
fi
