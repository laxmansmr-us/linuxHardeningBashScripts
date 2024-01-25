#!/bin/bash

# 3.2.2 Ensure packet redirect sending is disabled (Automated)

# set the net.ipv4.conf.all.send_redirects = 0 value

if [ $(sysctl -n net.ipv4.conf.all.send_redirects) != "0" ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "the net.ipv4.conf.all.send_redirects=0 value does not set, working on setting it now"    

    printf "net.ipv4.conf.all.send_redirects = 0" >> /etc/sysctl.d/60-netipv4_sysctl.conf

    if [ $? -eq 0 ]; then 
        echo " "
        echo "------------------------------------------------------------------------"
        echo "net.ipv4.conf.all.send_redirects = 0 value has been set into /etc/sysctl.d/60-netipv4_sysctl.conf"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to set the net.ipv4.conf.all.send_redirects = 0 value into /etc/sysctl.d/60-netipv4_sysctl.conf"
    fi    

    # set the active kernel parameter
    sysctl -w net.ipv4.conf.all.send_redirects=0
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The net.ipv4.conf.all.send_redirects=0 value has been set as active kernel parameter successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to set the net.ipv4.conf.all.send_redirects=0 value as active kernel parameter"
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
    echo "The net.ipv4.conf.all.send_redirects value is equal to 0 already"
fi


# set the net.ipv4.conf.default.send_redirects = 0 value

if [ $(sysctl -n net.ipv4.conf.default.send_redirects) != "0" ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "the net.ipv4.conf.default.send_redirects=0 value does not set, working on setting it now"    

    printf "net.ipv4.conf.default.send_redirects = 0" >> /etc/sysctl.d/60-netipv4_sysctl.conf

    if [ $? -eq 0 ]; then 
        echo " "
        echo "------------------------------------------------------------------------"
        echo "net.ipv4.conf.default.send_redirects = 0 value has been set into /etc/sysctl.d/60-netipv4_sysctl.conf"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to set the net.ipv4.conf.default.send_redirects = 0 value into /etc/sysctl.d/60-netipv4_sysctl.conf"
    fi    

    # set the active kernel parameter
    sysctl -w net.ipv4.conf.default.send_redirects=0
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The net.ipv4.conf.default.send_redirects=0 value has been set as active kernel parameter successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to set the net.ipv4.conf.default.send_redirects=0 value as active kernel parameter"
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
    echo "The net.ipv4.conf.default.send_redirects value is equal to 0 already"
fi