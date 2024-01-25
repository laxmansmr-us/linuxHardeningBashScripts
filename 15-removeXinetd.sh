#!/bin/bash

# 2.2.1 Ensure xinetd is not installed (Automated)

if [ rpm -q xinetd ]; then 
    echo " "
    echo "------------------------------------------------------------------------"
    echo "xinetd is installed, working on removing it now"

    yum remove xinetd

    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "xinetd removed successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------" 
        echo "failed to remove xinetd"
    fi

else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "xinetd is not installed already"
fi