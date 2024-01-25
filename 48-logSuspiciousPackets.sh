#!/bin/bash

# 3.3.4 Ensure suspicious packets are logged (Automated)

# set net.ipv4.conf.all.log_martians = 1 value 
if [ $(sysctl -n net.ipv4.conf.all.log_martians) != "1" ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "the net.ipv4.conf.all.log_martians=1 value does not set, working on setting it now"

    printf "net.ipv4.conf.all.log_martians = 1\n" >> /etc/sysctl.d/60-netipv4_sysctl.conf
    if [ $? -eq 0 ]; then 
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The net.ipv4.conf.all.log_martians = 1 value has been set into /etc/sysctl.d/60-netipv4_sysctl.conf"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to set the net.ipv4.conf.all.log_martians = 1 value into /etc/sysctl.d/60-netipv4_sysctl.conf"
    fi

    # set the active kernel parameters
    sysctl -w net.ipv4.conf.all.log_martians=1
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The net.ipv4.conf.all.log_martians=1 value has been set as active kernel parameter successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to set the net.ipv4.conf.all.log_martians=1 value as active kernel parameter"
    fi

    # flush/reload the routing table 
    sysctl -w net.ipv4.route.flush=1
        echo " "
        echo "------------------------------------------------------------------------"
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
    echo "the net.ipv4.conf.all.log_martians value is equal to 1 already"
fi


# set net.ipv4.conf.default.log_martians = 1 value 
if [ $(sysctl -n net.ipv4.conf.default.log_martians) != "1" ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "the net.ipv4.conf.default.log_martians=1 value does not set, working on setting it now"

    printf "net.ipv4.conf.default.log_martians = 1\n" >> /etc/sysctl.d/60-netipv4_sysctl.conf
    if [ $? -eq 0 ]; then 
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The net.ipv4.conf.default.log_martians = 1 value has been set into /etc/sysctl.d/60-netipv4_sysctl.conf"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to set the net.ipv4.conf.default.log_martians = 1 value into /etc/sysctl.d/60-netipv4_sysctl.conf"
    fi

    # set the active kernel parameters
    sysctl -w net.ipv4.conf.default.log_martians=1
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The net.ipv4.conf.default.log_martians=1 value has been set as active kernel parameter successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to set the net.ipv4.conf.default.log_martians=1 value as active kernel parameter"
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
    echo "the net.ipv4.conf.default.log_martians value is equal to 1 already"
fi