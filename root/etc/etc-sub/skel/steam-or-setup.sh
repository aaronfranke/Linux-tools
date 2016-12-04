
#!/bin/bash

# Script just skips to the bottom to launch Steam if Steam is installed. 

if [ ! -f "/usr/games/steam" ]; then
    if [ -f "/usr/share/applications/pcmanfm.desktop" ]; then
        xdg-mime default pcmanfm.desktop inode/directory
    fi
    cd "/etc/skel/.config/"
    notify-send "Sub Linux Setup" "Welcome to \"Sub Linux\" by aaronfranke\! \nPlease read the following short messages\. "
    sleep 11
    notify-send "Sub Linux Setup" "Because you just installed the system\, you need to run a script to finish the installation\. "
    sleep 11

    if [ ! -f "/etc/skel/.config/copy-root-to-root.sh" ]; then
        notify-send "Sub Linux Setup Error" "ERROR\! \/etc\/skel\/\.config\/copy-root-to-root\.sh doesn\'t exist\! "
        notify-send "Sub Linux Setup Error" "Please download a copy from https\:\/\/github\.com\/aaronfranke\/Linux\-tools "
        notify-send "Sub Linux Setup Error" "Download, extract, and place copy-root-to-root\.sh and root\/ in /etc/skel/.config/ "
        notify-send "Sub Linux Setup Error" "Firefox will open with the download in a moment\.\.\. "
        sleep 11
        firefox https://github.com/aaronfranke/Linux-tools/archive/master.zip &
        exit 1
    fi

    if [ ! -d "/etc/skel/programs-to-install.sh" ]; then
        notify-send "Sub Linux Setup Error" "ERROR\! \/etc\/skel\/\.config\/copy-root-to-root\.sh doesn\'t exist\! "
        notify-send "Sub Linux Setup Error" "Please download a copy from https\:\/\/github\.com\/aaronfranke\/Linux\-tools "
        notify-send "Sub Linux Setup Error" "Download, extract, and place programs-to-install\.sh in /etc/skel/ "
        notify-send "Sub Linux Setup Error" "Firefox will open with the download in a moment\.\.\. "
        sleep 11
        firefox https://github.com/aaronfranke/Linux-tools/archive/master.zip &
        exit 2
    fi

    notify-send "Sub Linux Setup" "All you have to do is enter your password in the following prompts\. "
    sleep 11
    notify-send "Sub Linux Setup" "Ensuring that the scripts are executable\.\.\. "
    sleep 2
    gksudo "chmod -R 7777 /etc/skel"
    notify-send "Sub Linux Setup" "Copying misc configuration files\.\.\. "
    sleep 2
    gksudo "x-terminal-emulator -e /etc/skel/.config/copy-root-to-root.sh"
    notify-send "Sub Linux Setup" "Checking misc programs and installing Steam\.\.\. "
    sleep 2
    gksudo "x-terminal-emulator -e /etc/skel/programs-to-install.sh"
    gksudo reboot
    exit 3
fi

sleep 3

/usr/games/steam %U -start steam://open/bigpicture

notify-send "Sub Linux" "Steam was ended or failed to start\, was this intentional or an error\? "


