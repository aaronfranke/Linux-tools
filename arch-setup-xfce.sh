
#!/bin/bash 

pacman -Syu 

pacman -S sudo 

sudo pacman -Syu 

sudo pacman -S openssh 

sudo pacman -S xorg 

sudo pacman -S xorg-xinit 

sudo pacman -S xorg-xrandr 

sudo pacman -S xorg-server-utils 

sudo pacman -S lightdm 

sudo pacman -S lightdm-gtk-greeter 

sudo pacman -S lightdm-gtk-greeter-settings 

sudo pacman -S xfce4 

sudo pacman -Rs xfce4-appfinder 

sudo pacman -S xfce4-whiskermenu-plugin 

sudo systemctl enable lightdm.service 

sudo pacman -Syu 







