
#!/bin/bash 

echo 'I recommend you run "programs-to-install.sh" first!' 

sleep 3 

sudo add-apt-repository -y ppa:webupd8team/haguichi 

sudo apt update 

sudo apt upgrade -y 

sudo apt dist-upgrade -y 

sudo apt full-upgrade -y 

sudo apt install -y pcsx2 

sudo apt install -y dolphin-emu 

sudo apt install -y mednafen 

sudo apt install -y audacity 

sudo apt install -y virtualbox 

sudo apt install -y handbrake 

sudo apt install -y codeblocks 

sudo apt install -y brasero 

sudo apt install -y kdenlive 

sudo apt install -y haguichi 

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




