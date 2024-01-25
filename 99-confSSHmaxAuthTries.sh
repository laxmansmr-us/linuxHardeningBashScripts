#!/bin/bash

# 5.2.6 Ensure SSH PAM is enabled (Automated)

sed -i '/MaxAuthTries/ s./.*/MaxAuthTries 4/' /etc/ssh/sshd_config
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The MaxAuthTries value at /etc/ssh/sshd_config has been set to 4 successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed/alreadyExist to set The MaxAuthTries value at /etc/ssh/sshd_config to 4"
        
        MaxAuthTriesvalue=$(cat /etc/ssh/sshd_config | grep -i MaxAuthTries)
        echo " "
        echo "The MaxAuthTries value is: $MaxAuthTriesvalue"
    fi