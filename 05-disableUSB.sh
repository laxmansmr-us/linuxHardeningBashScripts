#!/bin/bash

# 1.1.10 Disable USB Storage (Automated)

if grep -E "^install\s+usb-storage" /etc/modprobe.d/*; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "usb-storage is blacklisted."
else
    # Append to usb_storage.conf
    printf "install usb-storage /bin/true\n" >> /etc/modprobe.d/usb_storage.conf

    echo " "
    echo "------------------------------------------------------------------------"
    echo "usb-storage has been appended"
fi

# Check if USB module loaded
if lsmod | grep usb-storage; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "USB module is loaded, Unloaded now"

    # Unload usb-storage module
    rmmod usb-storage
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "USB module successfully unloaded"
    else
        echo " "
        echo "------------------------------------------------------------------------"    
        echo "Failed to unload USB module"
    fi
else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "usb-storage mdoule is not loaded already"
fi