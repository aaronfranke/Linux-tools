
#!/bin/bash 

pacman -Syu --noconfirm 

pacman -S --noconfirm sudo 

sudo pacman -Syu --noconfirm 

sudo pacman -S --noconfirm xorg 

sudo pacman -S --noconfirm xorg-xinit 

sudo pacman -S --noconfirm xorg-xrandr 

sudo pacman -S --noconfirm xorg-server-utils 

sudo pacman -S --noconfirm lightdm 

sudo pacman -S --noconfirm lightdm-gtk-greeter 

sudo pacman -S --noconfirm lightdm-gtk-greeter-settings 

sudo pacman -S --noconfirm xfce4 

sudo pacman -Rs --noconfirm xfce4-appfinder 

sudo pacman -S --noconfirm xfce4-whiskermenu-plugin 

sudo pacman -S --noconfirm elementary-icon-theme

sudo systemctl enable lightdm.service 

sudo pacman -Syu --noconfirm 







