#!/bin/bash

# 5.2.18 Ensure SSH MaxSessions is set to 10 or less (Automated)

sed -i '/MaxSessions/ s./.*/MaxSessions 10/' /etc/ssh/sshd_config
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The MaxSessions value at /etc/ssh/sshd_config has been set to 10 successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed/alreadyExist to set The MaxSessions value at /etc/ssh/sshd_config to 10"
        
        MaxSessionsvalue=$(cat /etc/ssh/sshd_config | grep -i MaxSessions)
        echo " "
        echo "The MaxSessions value is: $MaxSessionsvalue"
    fi