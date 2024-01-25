#!/bin/bash

# 3.3.2 Ensure ICMP redirects are not accepted (Automated)

# set the value of net.ipv4.conf.all.accept_redirects = 0
echo " "
echo "------------------------------------------------------------------------"
echo "Configuring IPv4 settings..."
echo "------------------------------------------------------------------------"

if [ $(sysctl -n net.ipv4.conf.all.accept_redirects) != "0" ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "the net.ipv4.conf.all.accept_redirects=0 value does not set, working on setting it now"

    printf "net.ipv4.conf.all.accept_redirects = 0\n" >> /etc/sysctl.d/60-netipv4_sysctl.conf
    if [ $? -eq 0 ]; then 
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The net.ipv4.conf.all.accept_redirects = 0 value has been set into /etc/sysctl.d/60-netipv4_sysctl.conf"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to set the net.ipv4.conf.all.accept_redirects = 0 value into /etc/sysctl.d/60-netipv4_sysctl.conf"
    fi

    # set as active kernel parameters
    sysctl -w net.ipv4.conf.all.accept_redirects=0
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The net.ipv4.conf.all.accept_redirects=0 value has been set as active kernel parameter successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to set the net.ipv4.conf.all.accept_redirects=0 value as active kernel parameter"
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
    echo "The net.ipv4.conf.all.accept_redirects value is equal to 0 already"
fi



# set the value of net.ipv4.conf.default.accept_redirects = 0

if [ $(sysctl -n net.ipv4.conf.default.accept_redirects) != "0" ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "the net.ipv4.conf.default.accept_redirects=0 value does not set, working on setting it now"

    printf "net.ipv4.conf.default.accept_redirects = 0\n" >> /etc/sysctl.d/60-netipv4_sysctl.conf
    if [ $? -eq 0 ]; then 
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The net.ipv4.conf.default.accept_redirects = 0 value has been set into /etc/sysctl.d/60-netipv4_sysctl.conf"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to set the net.ipv4.conf.default.accept_redirects = 0 value into /etc/sysctl.d/60-netipv4_sysctl.conf"
    fi

    # set as active kernel parameters
    sysctl -w net.ipv4.conf.default.accept_redirects=0
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The net.ipv4.conf.default.accept_redirects=0 value has been set as active kernel parameter successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to set the net.ipv4.conf.default.accept_redirects=0 value as active kernel parameter"
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
    echo "The net.ipv4.conf.default.accept_redirects value is equal to 0 already"
fi



# repeate the same above configs for IPv6
echo " "
echo "------------------------------------------------------------------------"
echo "Configuring IPv6 settings..."
echo "------------------------------------------------------------------------"


if [ $(sysctl -n net.ipv6.conf.all.accept_redirects) != "0" ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "the net.ipv6.conf.all.accept_redirects=0 value does not set, working on setting it now"

    printf "net.ipv6.conf.all.accept_redirects = 0\n" >> /etc/sysctl.d/60-netipv6_sysctl.conf
    if [ $? -eq 0 ]; then 
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The net.ipv6.conf.all.accept_redirects = 0 value has been set into /etc/sysctl.d/60-netipv6_sysctl.conf"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to set the net.ipv6.conf.all.accept_redirects = 0 value into /etc/sysctl.d/60-netipv6_sysctl.conf"
    fi

    # set as active kernel parameters
    sysctl -w net.ipv6.conf.all.accept_redirects=0
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The net.ipv6.conf.all.accept_redirects=0 value has been set as active kernel parameter successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to set the net.ipv6.conf.all.accept_redirects=0 value as active kernel parameter"
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
    echo "The net.ipv6.conf.all.accept_redirects value is equal to 0 already"
fi



# set the value of net.ipv6.conf.default.accept_redirects = 0

if [ $(sysctl -n net.ipv6.conf.default.accept_redirects) != "0" ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "the net.ipv6.conf.default.accept_redirects=0 value does not set, working on setting it now"

    printf "net.ipv6.conf.default.accept_redirects = 0\n" >> /etc/sysctl.d/60-netipv6_sysctl.conf
    if [ $? -eq 0 ]; then 
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The net.ipv6.conf.default.accept_redirects = 0 value has been set into /etc/sysctl.d/60-netipv6_sysctl.conf"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to set the net.ipv6.conf.default.accept_redirects = 0 value into /etc/sysctl.d/60-netipv6_sysctl.conf"
    fi

    # set as active kernel parameters
    sysctl -w net.ipv6.conf.default.accept_redirects=0
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The net.ipv6.conf.default.accept_redirects=0 value has been set as active kernel parameter successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to set the net.ipv6.conf.default.accept_redirects=0 value as active kernel parameter"
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
    echo "The net.ipv6.conf.default.accept_redirects value is equal to 0 already"
fi