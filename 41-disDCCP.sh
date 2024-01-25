#!/bin/bash

# 3.1.3 Ensure DCCP is disabled (Automated)

if lsmod | grep dccp; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "dccp module is loaded/enabled. working on removed & disabled it now"

    # unload dccp module
    rmmod dccp

    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "dccp module has been unloaded successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to unload the dccp moduel"
    fi

    # ensure that any attempt to load the dccp module results it does nothing
    printf "install dccp /bin/true" >> /etc/modprobe.d/dccp.conf

    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "dccp module has been Appended to /etc/modprobe.d/dccp.conf successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed Appended values into /etc/modprobe.d/dccp.conf"
    fi
else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "dccp module is unloaded already, nothing to do"
fi
