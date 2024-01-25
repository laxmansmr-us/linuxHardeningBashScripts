#!/bin/bash

# 2.2.4 Ensure CUPS is not installed (Automated)
# CUPS enabling a computer to act as a print server

if [ rpm -q cups ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "CUPS is installed, working on removing it now"

    yum remove cups

    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The CUPS removed successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to remove the CUPS"
    fi
else   
    echo " "
    echo "------------------------------------------------------------------------"
    echo "CUPS is not installed already"
fi