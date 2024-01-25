#!/bin/bash

# 3.1.1 Verify if IPv6 is enabled on the system (Manual)
# in our satuation will disable it 

if grep -i -r "net.ipv6.conf.all.disable_ipv6 = 1" /etc/sysctl.d/*; then

    echo " "
    echo "------------------------------------------------------------------------"
    echo "The ipv6 is disabled already, nothing to do" 
    exit 0
else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "No Configs has been set for disabling ipV6, working on configre it now"

    printf "
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
" >> /etc/sysctl.d/60-disable_ipv6.conf

    # Check the pevious command status
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The Following Parameters has been addedd successfully under /etc/sysctl.d/60-disable_ipv6.conf"
        echo "net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1"

    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to add the disable parameters under /etc/sysctl.d/60-disable_ipv6.conf"
    fi

    # Set the active kernel parameters
    sysctl -w net.ipv6.conf.all.disable_ipv6=1
    sysctl -w net.ipv6.conf.default.disable_ipv6=1

    # flush/reload the routing table 
    sysctl -w net.ipv6.route.flush=1
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The Routing table has been flushed and reloaded successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to flush/reload the routing table"
    fi
fi
