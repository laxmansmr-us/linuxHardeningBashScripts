#!/bin/bash

# 2.2.5 Ensure DHCP Server is not installed (Automated)

if [ rpm -q dhcp-server ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "dhcp-server is installed, working on removing it now"

    yum remove dhcp-server

    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The dhcp-server removed successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to remove the dhcp-server"
    fi
else   
    echo " "
    echo "------------------------------------------------------------------------"
    echo "dhcp-server is not installed already"
fi