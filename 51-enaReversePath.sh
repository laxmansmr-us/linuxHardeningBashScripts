#!/bin/bash

# 3.3.7 Ensure Reverse Path Filtering is enabled (Automated) 

# set the net.ipv4.conf.all.rp_filter = 1 value
if [ $(sysctl -n net.ipv4.conf.all.rp_filter) != "1" ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "the net.ipv4.conf.all.rp_filter = 1 value does not set, working on setting it now"
    
    printf "net.ipv4.conf.all.rp_filter = 1\n" >> /etc/sysctl.d/60-netipv4_sysctl.conf
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "the net.ipv4.conf.all.rp_filter = 1 value has been set successfully into /etc/sysctl.d/60-netipv4_sysctl.conf"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to set the net.ipv4.conf.all.rp_filter = 1 value into /etc/sysctl.d/60-netipv4_sysctl.conf"
    fi

    # set the active kernel parameters
    sysctl -w net.ipv4.conf.all.rp_filter=1
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The net.ipv4.conf.all.rp_filter=1 value has been set as active kernel parameter successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to set the net.ipv4.conf.all.rp_filter=1 value as active kernel parameter"
    fi

    # immediately flush and reload the routing table cache
    sysctl -w net.ipv4.route.flush=1
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The Routing table has been flushed and reloaded successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to flush/reload the routing table"
    fi

else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "The net.ipv4.conf.all.rp_filter value is equal to 1 already"
fi

# set the net.ipv4.conf.default.rp_filter = 1 value
if [ $(sysctl -n net.ipv4.conf.default.rp_filter) != "1" ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "the net.ipv4.conf.default.rp_filter = 1 value does not set, working on setting it now"
    
    printf "net.ipv4.conf.default.rp_filter = 1\n" >> /etc/sysctl.d/60-netipv4_sysctl.conf
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "the net.ipv4.conf.default.rp_filter = 1 value has been set successfully into /etc/sysctl.d/60-netipv4_sysctl.conf"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to set the net.ipv4.conf.default.rp_filter = 1 value into /etc/sysctl.d/60-netipv4_sysctl.conf"
    fi

    # set the active kernel parameters
    sysctl -w net.ipv4.conf.default.rp_filter=1
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The net.ipv4.conf.default.rp_filter=1 value has been set as active kernel parameter successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to set the net.ipv4.conf.default.rp_filter=1 value as active kernel parameter"
    fi

    # immediately flush and reload the routing table cache
    sysctl -w net.ipv4.route.flush=1
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The Routing table has been flushed and reloaded successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to flush/reload the routing table"
    fi

else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "The net.ipv4.conf.default.rp_filter value is equal to 1 already"
fi