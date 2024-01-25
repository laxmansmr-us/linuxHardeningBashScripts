#!/bin/bash

# 1.1.1.1 Ensure mounting of cramfs filesystems is disabled (Automated)

# Check if the cramfs module is loaded
if lsmod | grep -q cramfs; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "cramfs module is loaded, Unloading it now"

    # Unload the cramfs module
    rmmod cramfs

    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "cramfs module successfully unloaded"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to unload cramfs module"
    fi
else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "cramfs module is not loaded"
fi


# Check if cramfs is blacklisted
if grep -E "^blacklist\s+cramfs" /etc/modprobe.d/*; then

    echo " "
    echo "------------------------------------------------------------------------"
    echo "cramfs is blacklisted."
else
    # Append to cramfs.conf
    printf "install cramfs /bin/false\nblacklist cramfs\n" >> /etc/modprobe.d/cramfs.conf

    echo " "
    echo "------------------------------------------------------------------------"
    echo "cramfs has been added to the blacklist"
fi
