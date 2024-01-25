#!/bin/bash

# 5.2.7 Ensure SSH root login is disabled (Automated)

sed -i '/PermitRootLogin/ s./.*/PermitRootLogin no/' /etc/ssh/sshd_config
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The PermitRootLogin value at /etc/ssh/sshd_config has been set to no successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed/alreadyExist to set The PermitRootLogin value at /etc/ssh/sshd_config to no"
        
        PermitRootLoginvalue=$(cat /etc/ssh/sshd_config | grep -i PermitRootLogin)
        echo " "
        echo "The PermitRootLogin value is: $PermitRootLoginvalue"
    fi