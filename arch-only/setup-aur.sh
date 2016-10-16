
#!/bin/bash 

if [ "$(id -u)" == "0" ]; then
    echo "This script cannot be run as root. Run it as a normal user. "
    exit 1
fi

if ![ -f /usr/bin/sudo ]; then
    echo "The sudo package is required, but the script can't be run with sudo. "
    echo "Run \"su -c 'pacman -S sudo' && ./setup-aur.sh\". "
    exit 2
fi

cd ~

mkdir aur_temp

cd aur_temp

pacman -Syu --noconfirm 

pacman -S --noconfirm sudo 

sudo pacman -Syu --noconfirm 

sudo pacman -S --noconfirm binutils 

sudo pacman -S --noconfirm glib2 

sudo pacman -S --noconfirm gcc 

sudo pacman -S --noconfirm cmake 

sudo pacman -S --noconfirm wget

sudo pacman -S --noconfirm git 

sudo pacman -S --noconfirm base-devel 

sudo git clone https://aur.archlinux.org/package-query.git 

sudo chown -R $(whoami) package-query/ 

sudo chmod -R 7777 package-query/ 

cd package-query 

makepkg -si --noconfirm

cd .. 

sudo git clone https://aur.archlinux.org/yaourt.git 

sudo chown -R $(whoami) yaourt/ 

sudo chmod 7777 -R yaourt/ 

cd yaourt 

makepkg -si --noconfirm

echo "NOCONFIRM=1" >> ~/.yaourtrc
echo "BUILD_NOCONFIRM=1" >> ~/.yaourtrc
echo "EDITFILES=0" >> ~/.yaourtrc

cd ../.. 

sudo rm -R aur_temp

sudo pacman -Syu --noconfirm 

yaourt -S yaourt-gui

echo " "
echo "All done! "
echo " "









