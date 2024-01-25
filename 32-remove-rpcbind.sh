#!/bin/bash

# 2.2.19 Ensure rpcbind is not installed or the rpcbind services are masked (Automated)
# The package rpcbind is a server that converts Remote Procedure Call (RPC) program numbers into universal addresses. It is an essential part of the RPC system, which allows different software applications to communicate with each other by sending requests and receiving responses over a network.

if [ rpm -q rpcbind ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "rpcbind package is installed, working on removing it now"

    yum remove rpcbind

    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The rpcbind package removed successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to remove rpcbind package"
    fi
else   
    echo " "
    echo "------------------------------------------------------------------------"
    echo "rpcbind package is not installed already"
fi
