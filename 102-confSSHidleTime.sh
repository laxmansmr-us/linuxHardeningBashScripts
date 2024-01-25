#!/bin/bash

# 5.2.20 Ensure SSH Idle Timeout Interval is configured (Automated)

sed -i '/ClientAliveInterval/ s./.*/ClientAliveInterval 900/' /etc/ssh/sshd_config
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The ClientAliveInterval value at /etc/ssh/sshd_config has been set to 900 successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed/alreadyExist to set The ClientAliveInterval value at /etc/ssh/sshd_config to 900"
        
        ClientAliveIntervalvalue=$(cat /etc/ssh/sshd_config | grep -i ClientAliveInterval)
        echo " "
        echo "The ClientAliveInterval value is: $ClientAliveIntervalvalue"
    fi


sed -i '/ClientAliveCountMax/ { s./.*/ClientAliveCountMax 0 }' /etc/ssh/sshd_config
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The ClientAliveCountMax value at /etc/ssh/sshd_config has been set to 0 successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed/alreadyExist to set The ClientAliveCountMax value at /etc/ssh/sshd_config to 0"
        
        ClientAliveCountMaxvalue=$(cat /etc/ssh/sshd_config | grep -i ClientAliveCountMax)
        echo " "
        echo "The ClientAliveCountMax value is: $ClientAliveCountMaxvalue"
    fi