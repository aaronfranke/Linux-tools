#!/bin/bash

echo
echo "Note: This script is designed for new installs of Ubuntu 22.04 and flavors."
echo "If you already have a system with lots of custom repos, things may conflict."
echo "This script will execute in a few seconds unless you press Ctrl+Z to exit."
echo
sudo sleep 10 # sudo before sleep elevates this script to sudo priviliges after the password prompt.

# Start with updates.
sudo apt update
sudo apt upgrade -y
sudo apt full-upgrade -y

# Important stuff that should be done first.
sudo dpkg --add-architecture i386
sudo apt install -y apt-transport-https
sudo apt install -y ca-certificates # Mono needs it
sudo apt install -y dirmngr # Mono needs it
sudo apt install -y gnupg # Mono needs it


# Create "~/.local/bin" and put some scripts there
# Ubuntu adds this to $PATH as long as it exists.
if [ ! -d "$HOME/.local/bin" ]; then
    mkdir "$HOME/.local/bin"
fi
if [ -f "update.sh" ]; then
    cp update.sh "$HOME/.local/bin/update"
fi
if [ -d "../all-distros" ]; then
    cp "../all-distros/clearlogs.sh" "$HOME/.local/bin/clearlogs"
    cp "../all-distros/clearswap.sh" "$HOME/.local/bin/clearswap"
fi
chmod -R 775 "$HOME/.local/bin"

# Add some useful aliases if there is not currently a .bash_aliases file.
if [ ! -f "$HOME/.bash_aliases" ]; then
    if [ -f "../all-distros/bash_aliases" ]; then
        cp "../all-distros/bash_aliases" "$HOME/.bash_aliases"
    fi
fi

# Ubuntu dropped support for older SSL, but we need it for some apps.
wget -O libssl1.1.deb "http://security.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1l-1ubuntu1.2_amd64.deb"
if [ ! -f "libssl1.1.deb" ]; then
    echo "Failed to download libssl1.1"
    exit 1
fi
sudo dpkg -i libssl1.1.deb
sudo rm -f libssl1.1.deb

# Mono stuff.
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
echo "deb https://download.mono-project.com/repo/ubuntu vs-focal main" | sudo tee /etc/apt/sources.list.d/mono-official-vs.list

# Wine stuff.
sudo sed -i -e 's/scope = 1/scope = 0/g' /etc/sysctl.d/10-ptrace.conf

# More updates.
sudo apt update
sudo apt upgrade -y
sudo apt full-upgrade -y


# These packages should be installed first.
sudo apt install -y vlc # Depends on a lot of *specific versions* of libraries
sudo apt install -y flatpak # Used for installing other apps
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Misc libraries, I recommend keeping everything here.
# Many of these are already installed on Ubuntu, but we should
# install them manually just in case this is some other distro.
sudo apt install -y cpp
sudo apt install -y curl
sudo apt install -y dkms
sudo apt install -y flac
sudo apt install -y gconf-service # GitKraken
sudo apt install -y gconf2 # GitKraken
sudo apt install -y lame
sudo apt install -y lib32z1
sudo apt install -y lib32stdc++6
sudo apt install -y libappindicator1 # Chrome
sudo apt install -y libc++1
sudo apt install -y libcap2-bin
sudo apt install -y libcurl4-openssl-dev # Dotnet
sudo apt install -y libdbusmenu-gtk4
sudo apt install -y libfaudio0 # Wine
sudo apt install -y libglib2.0-0
sudo apt install -y libgtk2.0-0:i386 # Steam controller
sudo apt install -y libgtk-3-0
sudo apt install -y libindicator7 # Chrome
sudo apt install -y libkrb5-dev # Dotnet
sudo apt install -y libopenal1
sudo apt install -y libsdl2-2.0-0 # Misc Steam games
sudo apt install -y libsdl2-ttf-2.0-0
sudo apt install -y libsdl-ttf2.0-0
sudo apt install -y libssl-dev # Dotnet
sudo apt install -y libtcmalloc-minimal4 # Portal 2
sudo apt install -y libxss1 # Chrome
sudo apt install -y libxtst6:i386 # Steam controller
sudo apt install -y mono-complete
sudo apt install -y net-tools # ifconfig
sudo apt install -y nuget
sudo apt install -y openjdk-8-jre
sudo apt install -y python2-minimal # GitKraken
sudo apt install -y python3
sudo apt install -y python3-gpg # Dropbox
sudo apt install -y x264

# Developer tools, useful for everyone, ex: for compiling software.
sudo apt install -y build-essential
sudo apt install -y clang
sudo apt install -y cmake
sudo apt install -y gcc g++
sudo apt install -y git
sudo apt install -y pkg-config
sudo apt install -y scons
sudo apt install -y libx11-dev
sudo apt install -y libxcursor-dev
sudo apt install -y libxinerama-dev
sudo apt install -y libgl1-mesa-dev
sudo apt install -y libglu-dev
sudo apt install -y libasound2-dev
sudo apt install -y libpulse-dev
sudo apt install -y libudev-dev
sudo apt install -y libxi-dev
sudo apt install -y libxrandr-dev
sudo apt install -y yasm

# Itch stuff.
wget -O itch-setup nuts.itch.zone/download
chmod 777 itch-setup
./itch-setup --silent &

# GitKraken stuff.
wget -O gitkraken.deb "https://release.gitkraken.com/linux/gitkraken-amd64.deb"
sudo dpkg -i gitkraken.deb
sudo rm -f gitkraken.deb

# VS Code stuff.
wget -O code.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
sudo dpkg -i code.deb
sudo rm -f code.deb

# Chrome stuff.
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome-stable_current_amd64.deb
sudo rm -f google-chrome-stable_current_amd64.deb

# Misc useful terminal stuff.
sudo apt install -y cmatrix
sudo apt install -y cowsay
sudo apt install -y dcfldd
sudo apt install -y ffmpeg
sudo apt install -y fortune-mod
sudo apt install -y htop
sudo apt install -y icoutils
sudo apt install -y mediainfo
sudo apt install -y neofetch
sudo apt install -y pv
sudo apt install -y tldr
sudo apt install -y youtube-dl

# Check if Gnome exists. We'll use this later.
GNOME_EXISTED_BEFORE=0
if [ -f "/usr/bin/gnome-shell" ]; then
    GNOME_EXISTED_BEFORE=1
fi

# If Snap exists, replace Snap apps with other sources.
if [ -f "/usr/bin/snap" ]; then
    # Remove Snap apps.
    sudo snap remove snap-store
    sudo snap remove snapd-desktop-integration
    sudo snap remove firefox
    sudo snap remove gnome-3-38-2004
    sudo snap remove gtk-common-themes
    sudo snap remove bare
    sudo snap remove core20
    # Disable and purge Snap.
    sudo systemctl disable snapd.service
    sudo rm -Rf /var/cache/snapd/
    sudo apt purge snapd
    # Prevent accidentally reinstalling Snap.
    sudo apt-mark hold snapd
fi

# GNOME stuff.
if [[ "$GNOME_EXISTED_BEFORE" == 1 ]]; then
    sudo apt install -y gnome-core
    sudo apt install -y chrome-gnome-shell
    sudo apt install -y gnome-shell-extensions
    sudo apt install -y gnome-tweaks
    sudo apt install -y gnome-software-plugin-flatpak
fi

# Install useful GUI programs via Flatpak.
for f in com.discordapp.Discord org.gimp.GIMP org.kde.kdenlive com.obsproject.Studio com.slack.Slack; do
  flatpak install flathub --noninteractive -y $f
done

# Install useful GUI programs via apt.
sudo apt install -y baobab
sudo apt install -y dconf-editor
sudo apt install -y gnome-system-monitor
sudo apt install -y gparted
sudo apt install -y menulibre
sudo apt install -y pavucontrol
sudo apt install -y psensor
sudo apt install -y pcmanfm
sudo apt install -y qbittorrent

# Big things that should be installed last.
sudo apt install -y steam
sudo apt install -y wine
sudo rm -f itch-setup # We want to wait a bit to remove the file.

# Finish with updates, this time update certs too.
sudo update-ca-certificates -f
sudo apt update
sudo apt upgrade -y
sudo apt full-upgrade -y

echo
echo "Script has finished! You may wish to reboot your system now."
echo
