#!/bin/bash

# 2.2.13 Ensure HTTP Proxy Server is not installed (Automated)

if [ rpm -q squid  ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "squid package is installed, working on removing it now"

    yum remove squid

    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The squid package removed successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to remove squid package"
    fi
else   
    echo " "
    echo "------------------------------------------------------------------------"
    echo "squid package is not installed already"
fi

