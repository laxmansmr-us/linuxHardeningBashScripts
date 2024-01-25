#!/bin/bash

# 5.2.15 Ensure SSH warning banner is configured (Automated)

sed -i '/Banner/ s./.*/Banner /etc/issue.net/' /etc/ssh/sshd_config
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The Banner value at /etc/ssh/sshd_config has been set to Banner /etc/issue.net successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed/alreadyExist to set The Banner value at /etc/ssh/sshd_config to Banner /etc/issue.net"
        
        Bannervalue=$(cat /etc/ssh/sshd_config | grep -i Banner)
        echo " "
        echo "The Banner value is: $Bannervalue"
    fi