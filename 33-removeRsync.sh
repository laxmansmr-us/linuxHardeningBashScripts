#!/bin/bash

# 2.2.20 Ensure rsync is not installed or the rsyncd service is masked (Automated)

if [ rpm -q rsync ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "rsync package is installed, working on removing it now"

    yum remove rsync

    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The rsync package removed successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to remove rsync package"
    fi
else   
    echo " "
    echo "------------------------------------------------------------------------"
    echo "rsync package is not installed already"
fi
