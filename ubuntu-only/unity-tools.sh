
#!/bin/bash 

echo 'I recommend you run "programs-to-install.sh" first!' 

sleep 3 

sudo add-apt-repository -y ppa:variety/next 

sudo apt update 

sudo apt upgrade -y 

sudo apt dist-upgrade -y 

sudo apt full-upgrade -y 

sudo apt install -y ubuntu-desktop 

sudo apt install -y variety 

sudo apt install -y unity-tweak-tool 

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





