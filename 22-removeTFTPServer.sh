#!/bin/bash

# 2.2.9 Ensure Ttftp-server Server is not installed (Automated)

if [ rpm -q tftp-server  ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "tftp-server package is installed, working on removing it now"

    yum remove tftp-server

    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The tftp-server package removed successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to remove tftp-server package"
    fi
else   
    echo " "
    echo "------------------------------------------------------------------------"
    echo "tftp-server package is not installed already"
fi

