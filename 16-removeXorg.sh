#!/bin/bash

# 2.2.2 Ensure xorg-x11-server-common is not installed (Automated)

if [ rpm -q xorg-x11-server-common ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "xorg is installed, working on removing it now"

    yum remove xorg-x11-server-common

    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The xorg removed successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to remove the xorg"
    fi
else   
    echo " "
    echo "------------------------------------------------------------------------"
    echo "xorg is not installed already"
fi
