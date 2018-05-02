
#!/bin/bash

sudo apt update 

sudo apt upgrade -y 

sudo apt dist-upgrade -y 

sudo apt full-upgrade -y 

sudo rm -R /var/log/* 

sudo mkdir /var/log/apt 

echo " " 
echo "Successfully updated the system! " 
echo "You may wish to reboot your system now. " 
echo " " 





