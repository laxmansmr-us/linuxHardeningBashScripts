#!/bin/bash

# 2.2.18 Ensure nfs-utils is not installed or the nfs-server service is masked (Automated)
#  The nfs-utils package contains utilities and daemons for using the Network File System (NFS), which is a distributed file system protocol allowing a user on a client computer to access files over a network much like local storage is accessed.

if [ rpm -q nfs-utils ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "nfs-utils package is installed, working on removing it now"

    yum remove nfs-utils

    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The nfs-utils package removed successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to remove nfs-utils package"
    fi
else   
    echo " "
    echo "------------------------------------------------------------------------"
    echo "nfs-utils package is not installed already"
fi
