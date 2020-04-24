#!/bin/bash 

echo 
echo "Note: This script is designed for new installs of Ubuntu 20.04 and flavors. " 
echo "If you already have a system with lots of custom repos, things may conflict. " 
echo "This script will execute in a few seconds unless you press Ctrl+Z to exit. " 
echo 
sudo sleep 10 # "sudo" before sleep elevates this script to sudo priviliges after the password prompt 

# Start with updates 

sudo apt update 
sudo apt upgrade -y 
sudo apt full-upgrade -y 

# Important stuff that should be done first 

sudo apt install -y apt-transport-https 
sudo apt install- y ca-certificates # Mono needs it 
sudo apt install -y dirmngr # Mono needs it 
sudo apt install- y gnupg # Mono needs it 


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


# Get rid of all existing Snap apps. WARNING: This is meant for new installs only! 

sudo apt purge -y snapd 
sudo apt install -y snapd 

# More updates 

sudo apt update 
sudo apt upgrade -y 
sudo apt full-upgrade -y 

# These packages should be installed first 

sudo apt install -y openssh-server # For accessing a computer remotely via SSH 

# Misc libraries, I recommend keeping everything here. 
# Many of these are already installed on Ubuntu, but we should 
# install them manually just in case this is some other distro 

sudo apt install -y cpp 
sudo apt install -y curl 
sudo apt install -y exfat-utils 
sudo apt install -y gcc g++ 
sudo apt install -y lib32z1
sudo apt install -y lib32ncurses5 
sudo apt install -y lib32stdc++6 
sudo apt install -y libc++1 
sudo apt install -y libcap2-bin 
sudo apt install -y libglib2.0-0 
sudo apt install -y net-tools # ifconfig
sudo apt install -y python3 

# Developer tools, useful for everyone, ex: for compiling software 

sudo apt install -y build-essential 
sudo apt install -y cmake 
sudo apt install -y git 

# Misc useful terminal stuff 

sudo apt install -y cmatrix 
sudo apt install -y cowsay 
sudo apt install -y dcfldd 
sudo apt install -y fortune-mod 
sudo apt install -y htop 
sudo apt install -y neofetch 
sudo apt install -y pv 

# Finish with updates, this time update certs too 

sudo update-ca-certificates -f 
sudo apt update 
sudo apt upgrade -y 
sudo apt full-upgrade -y 

echo 
echo "Successfully installed the programs! " 
echo "You may wish to reboot your system now. " 
echo 





