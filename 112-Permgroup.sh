#!/bin/bash

# 6.1.5 Ensure permissions on /etc/group are configured (Automated)

chown root:root /etc/group
if [ $? -eq 0 ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "the root user has been set as owner and group owner for /etc/group"
 else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "failed to set the root user as owner and group owner for /etc/group"  
fi

chmod u-x,g-wx,o-wx /etc/group
if [ $? -eq 0 ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "the permission for /etc/group has been changed to u-x,g-wx,o-wx"
 else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "failed to set the permission for /etc/group to u-x,g-wx,o-wx"
fi