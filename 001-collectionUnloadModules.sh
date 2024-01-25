#!/bin/bash

cramfsModule=cramfs
squashfsModule=squashfs
udfMoudle=udf
usbModule=usb-storage

# 1.1.1.1 Ensure mounting of cramfs filesystems is disabled (Automated)
# 1.1.1.2 Ensure mounting of squashfs filesystems is disabled (Automated)
# 1.1.1.3 Ensure mounting of udf filesystems is disabled (Automated)
# 1.1.10 Disable USB Storage (Automated)

for module in $cramfsModule $squashfsModule $udfMoudle $usbModule; do

    # Check if modules are loaded
    if lsmod | grep -q $module; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "$module module is loaded, Unloading it now"

        # Unload the module
        rmmod $module

        if [ $? -eq 0 ]; then
            echo " "
            echo "------------------------------------------------------------------------"
            echo "$module module successfully unloaded"
        else
            echo " "
            echo "------------------------------------------------------------------------"
            echo "failed to unload $module module"
        fi
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "$module module is not loaded, already"
    fi


    # Check if The mdoule is blacklisted
    if grep -E "^blacklist\s+$module" /etc/modprobe.d/*; then

        echo " "
        echo "------------------------------------------------------------------------"
        echo "$module is blacklisted."
    else
        # Append to $module.conf file
        printf "install $module /bin/false\nblacklist $module\n" >> /etc/modprobe.d/$module.conf

        echo " "
        echo "------------------------------------------------------------------------"
        echo "$module has been added to the blacklist"
    fi
done