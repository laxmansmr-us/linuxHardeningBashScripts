#!/bin/bash

# 2.3.1 Ensure NIS Client is not installed (Automated)
# Network Information Service (NIS), which is a client-server directory service protocol for distributing system configuration

if [ rpm -q ypbind ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "ypbind package is installed, working on removing it now"

    yum remove ypbind

    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The ypbind package removed successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to remove ypbind package"
    fi
else   
    echo " "
    echo "------------------------------------------------------------------------"
    echo "ypbind package is not installed already"
fi
