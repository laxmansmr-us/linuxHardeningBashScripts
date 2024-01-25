#!/bin/bash

# 2.2.6 Ensure DNS Server is not installed (Automated)

if [ rpm -q bind  ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "bind package is installed, working on removing it now"

    yum remove bind

    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The bind package removed successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to remove bind package"
    fi
else   
    echo " "
    echo "------------------------------------------------------------------------"
    echo "bind package is not installed already"
fi