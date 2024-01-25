#!/bin/bash

# 5.2.8 Ensure SSH HostbasedAuthentication is disabled (Automated)

sed -i '/HostbasedAuthentication/ s./.*/HostbasedAuthentication no/' /etc/ssh/sshd_config
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The HostbasedAuthentication value at /etc/ssh/sshd_config has been set to no successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed/alreadyExist to set The HostbasedAuthentication value at /etc/ssh/sshd_config to no"
        
        HostbasedAuthenticationvalue=$(cat /etc/ssh/sshd_config | grep -i HostbasedAuthentication)
        echo " "
        echo "The HostbasedAuthentication value is: $HostbasedAuthenticationvalue"
    fi


# only password authentication or key-based authentication will be accepted.