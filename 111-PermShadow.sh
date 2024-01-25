#!/bin/bash

# 6.1.3 Ensure permissions on /etc/shadow are configured (Automated) Accepted

chown root:root /etc/shadow
if [ $? -eq 0 ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "the root user has been set as owner and group owner for /etc/shadow"
 else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "failed to set the root user as owner and group owner for /etc/shadow"  
fi

chmod 0000 /etc/shadow
if [ $? -eq 0 ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "the permission for /etc/shadow has been changed to 0000"
 else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "failed to set the permission for /etc/shadow to 0000"
fi