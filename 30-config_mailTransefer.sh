#!/bin/bash

# 2.2.17 Ensure mail transfer agent is configured for local-only mode (Automated)

if [ rpm -q postfix ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "postfix package is installed, working on removing it now"

    yum remove postfix

    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The postfix package removed successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to remove postfix package"
    fi
else   
    echo " "
    echo "------------------------------------------------------------------------"
    echo "postfix package is not installed already"
fi

