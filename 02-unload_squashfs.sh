#!/bin/bash

# 1.1.1.2 Ensure mounting of squashfs filesystems is disabled (Automated)

# Check if the squashfs module is loaded
if lsmod | grep squashfs; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "squashfs module is loaded, Unloading it now"

    # remove the squashfs module
    rmmod squashfs
    
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "squashfs module successfully unloaded"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to unload the squashfs module"
    fi
else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "squashfs module is not loaded"
fi

# Check if the squashfs is blacklisted
if grep -E "^blacklist\s+squashfs" /etc/modprobe.d/*; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "squashfs is blacklisted"
else
    # Append to squashfs.conf
    printf "install squashfs /bin/false\nblacklist squashfs\n" >> /etc/modprobe.d/squashfs.conf

    echo " "
    echo "------------------------------------------------------------------------"
    echo "squashfs has been added to the blacklist"
fi