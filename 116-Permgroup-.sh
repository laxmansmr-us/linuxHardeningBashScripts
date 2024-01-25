#!/bin/bash

# 6.1.9 Ensure permissions on /etc/group- are configured (Automated) 
# The /etc/group- file contains backup user account information

chown root:root /etc/group-
if [ $? -eq 0 ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "the root user has been set as owner and group owner for /etc/group-"
 else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "failed to set the root user as owner and group owner for /etc/group-"  
fi

chmod u-x,go-wx /etc/group-
if [ $? -eq 0 ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "the permission for /etc/group- has been changed to u-x,go-wx"
 else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "failed to set the permission for /etc/group- to u-x,go-wx"
fi