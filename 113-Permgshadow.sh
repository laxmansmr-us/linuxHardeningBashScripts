#!/bin/bash

# 6.1.6 Ensure permissions on /etc/gshadow are configured (Automated) 

chown root:root /etc/gshadow
if [ $? -eq 0 ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "the root user has been set as owner and gshadow owner for /etc/gshadow"
 else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "failed to set the root user as owner and gshadow owner for /etc/gshadow"  
fi

chmod 0000  /etc/gshadow
if [ $? -eq 0 ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "the permission for /etc/gshadow has been changed to 0000 "
 else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "failed to set the permission for /etc/gshadow to 0000 "
fi