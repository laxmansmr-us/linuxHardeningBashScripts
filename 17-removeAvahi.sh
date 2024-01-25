#!/bin/bash

# 2.2.3 Ensure Avahi Server is not installed (Automated)

if [ rpm -q avahi-autoipd avahi ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "avahi-autoipd avahi are installed, working on removing them now"

    systemctl stop avahi-daemon.socket avahi-daemon.service
    yum remove avahi-autoipd avahi

    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The avahi-autoipd avahi removed successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to remove the avahi-autoipd avahi"
    fi
else   
    echo " "
    echo "------------------------------------------------------------------------"
    echo "avahi-autoipd avahi are not installed already"
fi
