#!/bin/bash

# 2.3.6 Ensure TFTP client is not installed (Automated)

if [ rpm -q tftp ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "tftp package is installed, working on removing it now"

    yum remove tftp

    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The tftp package removed successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to remove tftp package"
    fi
else   
    echo " "
    echo "------------------------------------------------------------------------"
    echo "tftp package is not installed already"
fi
