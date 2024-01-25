#!/bin/bash

# 3.4.1.1 Ensure firewalld is installed (Automated)

if [ "rpm -q firewalld iptables" ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "the firewalld/iptables packages are installed, working on uninstlling them now"

    yum remove firewalld iptables -y

    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "the firewalld/iptables packages has been removed successfully"
    else    
        echo "failed to uninstall firewalld/iptables"
    fi
else    
        echo " "
        echo "------------------------------------------------------------------------"
        echo "the firewalld/iptables packages are not exist already"
fi        