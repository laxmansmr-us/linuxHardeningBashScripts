#!/bin/bash

# 2.2.16 Ensure telnet-server is not installed (Automated)

if [ rpm -q telnet-server  ]; then    
    echo " "
    echo "------------------------------------------------------------------------"
    echo "telnet-server package is installed, working on removing it now"

    yum remove telnet-server

    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The telnet-server package removed successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to remove telnet-server package"
    fi
else   
    echo " "
    echo "------------------------------------------------------------------------"
    echo "telnet-server package is not installed already"
fi

