#!/bin/bash

# 3.1.2 Ensure SCTP is disabled (Automated)

if [ lsmod | grep sctp ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "sctp module is loaded/enabled. working on removed & disabled it now"

    # unload sctp module
    rmmod sctp

    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "sctp module has been unloaded successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to unload the sctp moduel"
    fi

    # ensure that any attempt to load the sctp module results it does nothing
    printf "install sctp /bin/true" >> /etc/modprobe.d/sctp.conf

    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "sctp module has been Appended to /etc/modprobe.d/sctp.conf successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed Appended values into /etc/modprobe.d/sctp.conf"
    fi

else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "sctp module is unloaded already"
