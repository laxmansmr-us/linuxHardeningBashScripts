#!/bin/bash

# 6.1.3 Ensure permissions on /etc/passwd are configured (Automated) Accepted

chown root:root /etc/passwd
if [ $? -eq 0 ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "the root user has been set as owner and group owner for /etc/passwd"
 else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "failed to set the root user as owner and group owner for /etc/passwd"  
fi

chmod 644 /etc/passwd
if [ $? -eq 0 ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "the permission for /etc/passwd has been changed to 644"
 else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "failed to set the permission for /etc/passwd to 644"
fi