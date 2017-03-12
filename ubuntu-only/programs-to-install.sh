
#!/bin/bash 

sudo dpkg --add-architecture i386 

sudo apt update 

sudo apt upgrade -y 

sudo apt dist-upgrade -y 

sudo apt full-upgrade -y 

wget https://dl.winehq.org/wine-builds/Release.key 

sudo apt-key add Release.key 

sudo rm -f Release.key 

ver=$(lsb_release -sr); if [ $ver != "16.10" -a $ver != "17.04" -a $ver != "16.04" ]; then ver=16.04; fi 

echo "deb http://download.opensuse.org/repositories/home:/strycore/xUbuntu_$ver/ ./" | sudo tee /etc/apt/sources.list.d/lutris.list 

wget -q http://download.opensuse.org/repositories/home:/strycore/xUbuntu_$ver/Release.key -O- | sudo apt-key add - 

curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - 

sudo apt-add-repository -y https://dl.winehq.org/wine-builds/ubuntu/ 

sudo add-apt-repository -y ppa:danielrichter2007/grub-customizer 

sudo add-apt-repository -y ppa:notepadqq-team/notepadqq 

sudo add-apt-repository -y ppa:webupd8team/java 

curl https://dl.itch.ovh/archive.key | sudo apt-key add - 

ITCHIO_DEB="deb https://dl.bintray.com/itchio/deb xenial main" 

echo $ITCHIO_DEB | sudo tee /etc/apt/sources.list.d/itchio.list 

wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"

sudo dpkg -i discord.deb

sudo rm -f discord.deb

sudo apt update 

sudo apt upgrade -y 

sudo apt dist-upgrade -y 

sudo apt full-upgrade -y 

sudo apt install -y apt-transport-https 

sudo apt install -y vlc 

sudo apt install -y nodejs 

sudo apt install -y screenfetch 

sudo apt install -y htop 

sudo apt install -y gksu 

sudo apt install -y openssh-server 

sudo apt install -y libtcmalloc-minimal4 

sudo apt install -y libdbusmenu-gtk4 

sudo apt install -y libdbusmenu-gtk4:i386 

sudo apt install -y lib32z1 

sudo apt install -y lib32ncurses5 

sudo apt install -y lib32stdc++6 

sudo apt install -y libopenal1 

sudo apt install -y libgtk* 

sudo apt install -y libsdl2* 

sudo apt install -y libsdl-ttf* 

sudo apt install -y liblua5* 

sudo apt install -y libcap2-bin 

sudo apt install -y vulkan-utils 

sudo apt install -y python-gpgme 

sudo apt install -y mono-complete 

sudo apt install -y mono-vbnc 

sudo apt install -y flac 

sudo apt install -y x264 

sudo apt install -y lame 

sudo apt install -y cmake 

sudo apt install -y build-essential 

sudo apt install -y exfat-* 

sudo apt install -y git 

sudo apt install -y aptitude 

sudo apt install -y smartmontools 

sudo apt install -y gsmartcontrol 

sudo apt install -y stress 

sudo apt install -y cmatrix 

sudo apt install -y pv 

sudo apt install -y cowsay 

sudo apt install -y fortune-mod 

sudo apt install -y openjdk-8-jre 

sudo apt install -y ubuntu-sso-client-qt 

sudo apt install -y software-center 

sudo apt install -y synaptic 

sudo apt install -y grub-customizer 

sudo apt install -y gparted 

sudo apt install -y icoutils 

sudo apt install -y dconf-editor 

sudo apt install -y mediainfo 

sudo apt install -y ffmpeg 

sudo apt install -y youtube-dl 

sudo apt install -y gnome-system-monitor 

sudo apt install -y baobab 

sudo apt install -y psensor 

sudo apt install -y engrampa 

sudo apt install -y nautilus 

sudo apt install -y pcmanfm 

sudo apt install -y gedit 

sudo apt install -y notepadqq 

sudo apt install -y qbittorrent 

sudo apt install -y firefox 

sudo apt install -y chromium-browser 

sudo apt install -y gimp 

sudo apt install -y libreoffice 

sudo apt install -y --install-recommends winehq-devel 

sudo apt install -y playonlinux 

sudo update-ca-certificates -f 

sudo setcap cap_sys_ptrace=eip /usr/bin/wineserver 

sudo setcap cap_sys_ptrace=eip /usr/bin/wine-preloader 

sudo apt install -y libdvd-pkg 

sudo apt install -y steam 

sudo apt install -y itch 

sudo apt update 

sudo apt upgrade -y 

sudo apt dist-upgrade -y 

sudo apt full-upgrade -y 

sudo rm -R /var/log/* 

sudo mkdir /var/log/apt 

echo " " 
echo "Successfully installed the programs! " 
echo "You may wish to reboot your system now. " 
echo " " 





