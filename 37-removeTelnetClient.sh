#!/bin/bash

# 2.3.4 Ensure telnet client is not installed (Automated)

if [ rpm -q telnet ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "telnet package is installed, working on removing it now"

    yum remove telnet

    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The telnet package removed successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to remove telnet package"
    fi
else   
    echo " "
    echo "------------------------------------------------------------------------"
    echo "telnet package is not installed alredy"
fi
