#!/bin/bash

# 5.2.9 Ensure SSH PermitEmptyPasswords is disabled (Automated)

sed -i '/PermitEmptyPasswords/ { s./.*/PermitEmptyPasswords no }' /etc/ssh/sshd_config
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The PermitEmptyPasswords value at /etc/ssh/sshd_config has been set to no successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed/alreadyExist to set The PermitEmptyPasswords value at /etc/ssh/sshd_config to no"
        
        PermitEmptyPasswordsvalue=$(cat /etc/ssh/sshd_config | grep -i PermitEmptyPasswords)
        echo " "
        echo "The PermitEmptyPasswords value is: $PermitEmptyPasswordsvalue"
    fi