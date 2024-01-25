#!/bin/bash

# 1.1.9 Disable Automounting (Automated)

# Check if autofs service exist/enable 
if systemctl is-enabled autofs; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "autofs is enabled, remove the autofs package now"

    # remove autofs package
    yum -y autofs

    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "autofs package has been removed successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------" 
        echo "Failed to remove autofs package"
    fi
else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "autofs is not exist/enabled already"
fi