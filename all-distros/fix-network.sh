
#!/bin/bash

# Arch
sudo systemctl stop dhcpcd
sudo systemctl start dhcpcd

# Ubuntu legacy
sudo /etc/init.d/network-manager restart

# Ubuntu systemd
sudo service network-manager restart

echo " " 
echo "The network manager has been restarted! " 
echo " " 


