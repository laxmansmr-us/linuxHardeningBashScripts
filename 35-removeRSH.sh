#!/bin/bash

# 2.3.2 Ensure rsh client is not installed (Automated)

if [ rpm -q rsh ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "rsh package is installed, working on removing it now"

    yum remove rsh

    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The rsh package removed successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to remove rsh package"
    fi
else   
    echo " "
    echo "------------------------------------------------------------------------"
    echo "rsh package is not installed already"
fi
