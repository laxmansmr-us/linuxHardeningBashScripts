#!/bin/bash

# 6.1.7 Ensure permissions on /etc/passwd- are configured (Automated)
# The /etc/passwd- file contains backup user account information

chown root:root /etc/passwd-
if [ $? -eq 0 ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "the root user has been set as owner and group owner for /etc/passwd-"
 else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "failed to set the root user as owner and group owner for /etc/passwd-"  
fi

chmod u-x,go-wx /etc/passwd-
if [ $? -eq 0 ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "the permission for /etc/passwd- has been changed to u-x,go-wx"
 else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "failed to set the permission for /etc/passwd- to u-x,go-wx"
fi