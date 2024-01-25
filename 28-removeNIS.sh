#!/bin/bash

# 2.2.15 Ensure NIS server is not installed (Automated)

if [ rpm -q ypserv  ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "ypserv package is installed, working on removing it now"

    yum remove ypserv

    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The ypserv package removed successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to remove ypserv package"
    fi
else   
    echo " "
    echo "------------------------------------------------------------------------"
    echo "ypserv package is not installed already"
fi

