#!/bin/bash

# 5.2.12 Ensure SSH X11 forwarding is disabled (Automated)

sed -i '/X11Forwarding/ s./.*/X11Forwarding no/' /etc/ssh/sshd_config
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The X11Forwarding value at /etc/ssh/sshd_config has been set to no successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed/alreadyExist to set The X11Forwarding value at /etc/ssh/sshd_config to no"
        
        X11Forwardingvalue=$(cat /etc/ssh/sshd_config | grep -i X11Forwarding)
        echo " "
        echo "The X11Forwarding value is: $X11Forwardingvalue"
    fi