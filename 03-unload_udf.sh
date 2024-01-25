#!/bin/bash

# 1.1.1.3 Ensure mounting of udf filesystems is disabled (Automated)

# Check if the udf module loaded
if lsmod | grep udf; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "udf module is loaded, Unloading it now"

    # Unload the udf module
    rmmod udf
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "udf module successfully inloaded"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to unload the udf module"
    fi
else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "udf module is not loaded"
fi


# Check if the udf module blacklisted
if grep -E "^blacklist[[:blank:]]*udf" /etc/modprobe.d/*; then 
    echo " "
    echo "------------------------------------------------------------------------"
    echo "udf is blacklisted"
else
    # Append to udf.conf
    printf "install udf /bin/false\nblacklist udf\n" >> /etc/modprobe.d/udf.conf

    echo " "
    echo "------------------------------------------------------------------------"
    echo "udf module has been added to the blacklist"
fi
