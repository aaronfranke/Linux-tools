#!/bin/bash
if [ ! "$(id -u)" == "0" ]; then
    echo "This script must run as root. Use \`sudo su\`. "
    exit 1
fi
sleep 10
cd /usr/lib/vmware/modules/source
tar xf vmmon.tar
mv vmmon.tar vmmon.old.tar
sed -r -i -e 's/KERNEL_VERSION\(4, 6, 0\)/KERNEL_VERSION\(4, 9, 0\)/g' vmmon-only/linux/hostif.c
sed -r -i -e 's/retval = get_user_pages\(\(unsigned long\)uvAddr, numPages, 0, 0, ppages, NULL\);/retval = get_user_pages\(\(unsigned long\)uvAddr, numPages, 0, ppages, NULL\);/g' vmmon-only/linux/hostif.c
tar cf vmmon.tar vmmon-only
rm -r vmmon-only
tar xf vmnet.tar
mv vmnet.tar vmnet.old.tar
sed -r -i -e 's/KERNEL_VERSION\(4, 6, 0\)/KERNEL_VERSION\(4, 9, 0\)/g' vmnet-only/userif.c
sed -r -i -e 's/retval = get_user_pages\(addr, 1, 1, 0, \&page, NULL\);/retval = get_user_pages\(addr, 1, 0, \&page, NULL\);/g' vmnet-only/userif.c
tar cf vmnet.tar vmnet-only
rm -r vmnet-only
