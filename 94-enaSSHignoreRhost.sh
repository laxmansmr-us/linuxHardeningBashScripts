#!/bin/bash


# 5.2.11 Ensure SSH IgnoreRhosts is enabled (Automated)

sed -i '/IgnoreRhosts/ s./.*/IgnoreRhosts yes/' /etc/ssh/sshd_config
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The IgnoreRhosts value at /etc/ssh/sshd_config has been set to yes successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed/alreadyExist to set The IgnoreRhosts value at /etc/ssh/sshd_config to yes"
        
        IgnoreRhostsvalue=$(cat /etc/ssh/sshd_config | grep -i IgnoreRhosts)
        echo " "
        echo "The IgnoreRhosts value is: $IgnoreRhostsvalue"
    fi