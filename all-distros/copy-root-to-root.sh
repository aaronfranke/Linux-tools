#!/bin/bash

# Will attempt to look for "root" folder. 
# Either place this script next to or inside of "all-distros" or "root". 

# Additionally, will attempt to determine distro and copy from 
# "all-distros" folder and the relevant distro folder. 

if [ -d root ]; then
    cd root
fi
cd ..

echo " " 
if [ -d root ]; then # If root is found, proceed. Else, exit.

    sudo cp -R ./root/* /

    # Cleans up if it accidentally copies itself to /
    if [ -f /copy-root-to-root.sh ]; then
        sudo rm /copy-root-to-root.sh
    fi

    if [ -d all-distros ]; then # If all-distros is found, proceed. Else, exit.
	sudo cp -R ./all-distros/* /etc/skel/.local/bin/
    else
	echo "Error: Failed to find the \"all-distros\" folder. " 
	echo "PARTIAL success executing the script! " 
	echo " " 
	exit 2 # Don't proceed to copy "ubuntu-only"
	# Since that's unlikely if "all-distros" is not here.
    fi

    if [ -f /usr/bin/apt ]; then # If Ubuntu, proceed. Else, continue.
	if [ -d ubuntu-only ]; then # If found, proceed. Else, exit.
	    sudo cp -R ./ubuntu-only/* /etc/skel/.local/bin/
        else
	    echo "Error: Failed to find the \"ubuntu-only\" folder. " 
	    echo "PARTIAL success executing the script! " 
	    echo " " 
	    exit 3
	fi
    fi

    echo "Successfully executed the script! " 
    echo " " 
    exit 0
else
    echo "Error: Failed to find the \"root\" folder. " 
    echo "FAILED to execute the script! " 
    echo " " 
    exit 1
fi







