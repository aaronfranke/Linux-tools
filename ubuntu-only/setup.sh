#!/bin/bash 

echo 
echo "Note: This script is designed for new installs of Ubuntu 18.04 and flavors. " 
echo "If you already have a system with lots of custom repos, things may conflict. " 
echo "This script will execute in a few seconds unless you press Ctrl+Z to exit. " 
echo 
sudo sleep 10 # "sudo" before sleep elevates this script to sudo priviliges after the password prompt 

# Start with updates 

sudo apt update 
sudo apt upgrade -y 
sudo apt full-upgrade -y 

# Important stuff that should be done first 

sudo dpkg --add-architecture i386 
sudo apt install -y apt-transport-https 
sudo apt install -y dirmngr # Mono needs it 


# Create "~/.local/bin" and put some scripts there 
# Ubuntu adds this to $PATH as long as it exists

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

# Add some useful aliases if there is not currently a ".bash_aliases" file 

if [ ! -f "$HOME/.bash_aliases" ]; then 
    if [ -f "../all-distros/bash_aliases" ]; then 
        cp "../all-distros/bash_aliases" "$HOME/.bash_aliases" 
    fi 
fi 


# Mono stuff 

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF 
echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list 
echo "deb https://download.mono-project.com/repo/ubuntu vs-bionic main" | sudo tee /etc/apt/sources.list.d/mono-official-vs.list 

# Wine stuff 

wget -nc https://dl.winehq.org/wine-builds/winehq.key 
sudo apt-key add winehq.key 
sudo rm -f winehq.key 
sudo add-apt-repository -y 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main' 
sudo add-apt-repository -y 'ppa:cybermax-dexter/sdl2-backport' # Consider removing in future 
sudo sed -i -e 's/scope = 1/scope = 0/g' /etc/sysctl.d/10-ptrace.conf 

# Other repos 

sudo add-apt-repository -y ppa:danielrichter2007/grub-customizer 
sudo add-apt-repository -y ppa:notepadqq-team/notepadqq 
sudo add-apt-repository -y ppa:graphics-drivers # Nvidia 

# Get rid of all existing Snap apps. WARNING: This is meant for new installs only! 

sudo apt purge -y snapd 
sudo apt install -y snapd 

# More updates 

sudo apt update 
sudo apt upgrade -y 
sudo apt full-upgrade -y 


# These packages should be installed first 

sudo apt install -y openssh-server # For accessing a computer remotely via SSH 
sudo apt install -y vlc # Depends on a lot of *specific versions* of libraries 

# Misc libraries, I recommend keeping everything here. 
# Many of these are already installed on Ubuntu, but we should 
# install them manually just in case this is some other distro 

sudo apt install -y cpp 
sudo apt install -y curl 
sudo apt install -y exfat-* 
sudo apt install -y flac 
sudo apt install -y gcc g++ 
sudo apt install -y lame 
sudo apt install -y lib32z1
sudo apt install -y lib32ncurses5 
sudo apt install -y lib32stdc++6 
sudo apt install -y libappindicator1 
sudo apt install -y libc++1 
sudo apt install -y libcap2-bin 
sudo apt install -y libdbusmenu-gtk4 
sudo apt install -y libdbusmenu-gtk4:i386 # Steam 
sudo apt install -y libfaudio0 # Wine 
sudo apt install -y libglib2.0-0 
sudo apt install -y libgnome-keyring-common 
sudo apt install -y libgnome-keyring-dev 
sudo apt install -y libgtk2.0-0:i386 # Steam controller
sudo apt install -y libgtk-3-0 
sudo apt install -y liblua5* 
sudo apt install -y libopenal1 
sudo apt install -y libsdl2* # Misc Steam games
sudo apt install -y libsdl-ttf* 
sudo apt install -y libtcmalloc-minimal4 # Portal 2 
sudo apt install -y libxtst6:i386 # Steam controller
sudo apt install -y mono-complete 
sudo apt install -y openjdk-8-jre 
sudo apt install -y python-minimal # GitKraken 
sudo apt install -y python 
sudo apt install -y python3 
sudo apt install -y python3-gpg # Dropbox 
sudo apt install -y vulkan-utils 
sudo apt install -y x264 

# Developer tools, useful for everyone, ex: for compiling software 

sudo apt install -y build-essential 
sudo apt install -y cmake 
sudo apt install -y git 

# Itch stuff 

wget -O itch-setup nuts.itch.zone/download 
chmod 777 itch-setup 
./itch-setup --silent & 

# GitKraken stuff 

wget -O gitkraken.deb "https://release.gitkraken.com/linux/gitkraken-amd64.deb" 
sudo dpkg -i gitkraken.deb
sudo rm -f gitkraken.deb

# Discord stuff 

wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb" 
sudo dpkg -i discord.deb
sudo rm -f discord.deb

# Misc useful terminal stuff 

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
sudo apt install -y youtube-dl 

# Small useful GUI programs 

sudo apt install -y baobab 
sudo apt install -y dconf-editor 
sudo apt install -y engrampa 
sudo apt install -y gnome-system-monitor 
sudo apt install -y gparted 
sudo apt install -y grub-customizer 
sudo apt install -y psensor 
sudo apt install -y pcmanfm 
sudo apt install -y notepadqq 
sudo apt install -y qbittorrent 

# Large useful GUI programs 

sudo apt install -y chromium-browser 
sudo apt install -y firefox 
sudo apt install -y gimp 
sudo apt install -y libreoffice 

# Things that should be installed last 

sudo apt install -y winehq-devel --install-recommends 
sudo apt install -y libdvd-pkg 
sudo dpkg-reconfigure libdvd-pkg 
sudo apt install -y steam 
sudo rm -f itch-setup # We want to wait a bit to remove the file 

# Finish with updates, this time update certs too 

sudo update-ca-certificates -f 
sudo apt update 
sudo apt upgrade -y 
sudo apt full-upgrade -y 

echo 
echo "Successfully installed the programs! " 
echo "You may wish to reboot your system now. " 
echo 





