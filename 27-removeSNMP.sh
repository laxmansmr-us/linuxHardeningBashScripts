#!/bin/bash

# 2.2.13 Ensure HTTP Proxy Server is not installed (Automated)

if [ rpm -q net-snmp ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "net-snmp package is installed, working on removing it now"

    yum remove net-snmp

    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The net-snmp package removed successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to remove net-snmp package"
    fi
else   
    echo " "
    echo "------------------------------------------------------------------------"
    echo "net-snmp package is not installed already"
fi

