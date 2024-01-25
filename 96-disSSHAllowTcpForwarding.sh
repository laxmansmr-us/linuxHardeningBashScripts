#!/bin/bash

# 5.2.13 Ensure SSH AllowTcpForwarding is disabled (Automated)

sed -i '/AllowTcpForwarding/ s./.*/AllowTcpForwarding no/' /etc/ssh/sshd_config
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The AllowTcpForwarding value at /etc/ssh/sshd_config has been set to no successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed/alreadyExist to set The AllowTcpForwarding value at /etc/ssh/sshd_config to no"
        
        AllowTcpForwardingvalue=$(cat /etc/ssh/sshd_config | grep -i AllowTcpForwarding)
        echo " "
        echo "The AllowTcpForwarding value is: $AllowTcpForwardingvalue"
    fi