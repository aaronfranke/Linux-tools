
#!/bin/bash

# Will attempt to look for "root" folder. 
# Either place "root" next to this script or else it'll search for 
# ../root, assuming this is run from the "all-distros" or "root" folders. 

# Additionally, will attempt to determine distro and copy from 
# "all-distros" folder and the relevant distro folder. 

if [ -d root ]; then
    cd root
fi
cd ..

echo " " 
if [ -d root ]; then # If root is found, proceed. Else, exit.

    if [ -d all-distros ]; then # If all-distros is found, proceed. Else, exit.
	sudo cp -R ./all-distros/* /etc/skel/
    else
	echo "Error: Failed to find the \"all-distros\" folder. " 
	echo "FAILED to execute the script! " 
	echo " " 
	exit 2
    fi

    if [ -f /usr/bin/apt ]; then # If Ubuntu, proceed. Else, continue.
	if [ -d ubuntu-only ]; then # If found, proceed. Else, exit.
	    sudo cp -R ./ubuntu-only/* /etc/skel/
        else
	    echo "Error: Failed to find the \"ubuntu-only\" folder. " 
	    echo "FAILED to execute the script! " 
	    echo " " 
	    exit 3
	fi
    fi

	# TODO: Do the same thing as above but for Arch.

    sudo cp -R ./root/* /

    # Cleans up if it accidentally copies itself to /
    if [ -f /copy-root-to-root.sh ]; then
        sudo rm /copy-root-to-root.sh
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







