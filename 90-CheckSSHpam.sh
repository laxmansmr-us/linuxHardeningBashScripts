#!/bin/bash

# 5.2.6 Ensure SSH PAM is enabled (Automated)

sed -i '/UsePAM/ s./.*/UsePAM yes/' /etc/ssh/sshd_config
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The UsePAM value at /etc/ssh/sshd_config has been set to yes successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed/alreadyExist to set The UsePAM value at /etc/ssh/sshd_config to yes"
        
        UsePAMvalue=$(cat /etc/ssh/sshd_config | grep -i usepam)
        echo " "
        echo "The UsePAM value is: $UsePAMvalue"
    fi