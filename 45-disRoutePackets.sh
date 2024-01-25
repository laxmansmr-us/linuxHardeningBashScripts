#!/bin/bash

# 3.3.1 Ensure source routed packets are not accepted (Automated)

# set the net.ipv4.conf.all.accept_source_route = 0 value
if [ $(sysctl -n net.ipv4.conf.all.accept_source_route) != "0" ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "the net.ipv4.conf.all.accept_source_route=0 value does not set, working on setting it now"

    printf "net.ipv4.conf.all.accept_source_route = 0\n" >> /etc/sysctl.d/60-netipv4_sysctl.conf
    if [ $? -eq 0 ]; then 
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The net.ipv4.conf.all.accept_source_route = 0 value has been set into /etc/sysctl.d/60-netipv4_sysctl.conf"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to set the net.ipv4.conf.all.accept_source_route = 0 value into /etc/sysctl.d/60-netipv4_sysctl.conf"
    fi

    # set as active kernel parameters
    sysctl -w net.ipv4.conf.all.accept_source_route=0
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The net.ipv4.conf.all.accept_source_route=0 value has been set as active kernel parameter successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to set the net.ipv4.conf.all.accept_source_route=0 value as active kernel parameter"
    fi

    # flush/reload the routing table 
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
    echo "The net.ipv4.conf.all.accept_source_route value is equal to 0 already"
fi

# set the net.ipv4.conf.default.accept_source_route = 0
if [ $(sysctl -n net.ipv4.conf.default.accept_source_route) != "0" ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "the net.ipv4.conf.default.accept_source_route=0 value does not set, working on setting it now"

    printf "net.ipv4.conf.default.accept_source_route = 0\n" >> /etc/sysctl.d/60-netipv4_sysctl.conf
    if [ $? -eq 0 ]; then 
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The net.ipv4.conf.default.accept_source_route = 0 value has been set into /etc/sysctl.d/60-netipv4_sysctl.conf"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to set the net.ipv4.conf.default.accept_source_route = 0 value into /etc/sysctl.d/60-netipv4_sysctl.conf"
    fi

    # set as active kernel parameters
    sysctl -w net.ipv4.conf.default.accept_source_route=0
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The sysctl -w net.ipv4.conf.default.accept_source_route=0 value has been set as active kernel parameter successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to set the net.ipv4.conf.default.accept_source_route=0 value as active kernel parameter"
    fi

    # flush/reload the routing table 
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
    echo "The net.ipv4.conf.default.accept_source_route value is equal to 0 already"
fi