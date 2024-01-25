#!/bin/bash

# 5.2.19 Ensure SSH LoginGraceTime is set to one minute or less

sed -i '/LoginGraceTime/ s./.*/LoginGraceTime 60/' /etc/ssh/sshd_config
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The LoginGraceTime value at /etc/ssh/sshd_config has been set to 60 successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed/alreadyExist to set The LoginGraceTime value at /etc/ssh/sshd_config to 60"
        
        LoginGraceTimevalue=$(cat /etc/ssh/sshd_config | grep -i LoginGraceTime)
        echo " "
        echo "The LoginGraceTime value is: $LoginGraceTimevalue"
    fi