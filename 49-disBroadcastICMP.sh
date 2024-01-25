#!/bin/bash

# 3.3.5 Ensure broadcast ICMP requests are ignored (Automated)

if [ $(sysctl -n net.ipv4.icmp_echo_ignore_broadcasts) != "1" ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "the net.ipv4.icmp_echo_ignore_broadcasts=1 value does not set, working on setting it now"

    printf "net.ipv4.icmp_echo_ignore_broadcasts = 1\n" >> /etc/sysctl.d/60-netipv4_sysctl.conf
    if [ $? -eq 0 ]; then 
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The net.ipv4.icmp_echo_ignore_broadcasts = 1 value has been set into /etc/sysctl.d/60-netipv4_sysctl.conf"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to set thenet.ipv4.icmp_echo_ignore_broadcasts = 1 value into /etc/sysctl.d/60-netipv4_sysctl.conf"
    fi

    # set the active kernel parameters
    sysctl -w net.ipv4.icmp_echo_ignore_broadcasts=1
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The net.ipv4.icmp_echo_ignore_broadcasts=1 value has been set as active kernel parameter successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to set the net.ipv4.icmp_echo_ignore_broadcasts=1 value as active kernel parameter"
    fi

    sysctl -w net.ipv4.route.flush=1
    if [ $? -eq 0 ]; then
        echo "The Routing table has been flushed and reloaded successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to flush/reload the routing table"
    fi

else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "The net.ipv4.icmp_echo_ignore_broadcasts value is equal to 1 already"
fi  