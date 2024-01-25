#!/bin/bash

# 5.2.5 Ensure SSH LogLevel is appropriate (Automated)

sed -i '/LogLevel/ s./.*/LogLevel VERBOSE/' /etc/ssh/sshd_config
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The LogLevel value at /etc/ssh/sshd_config has been set to VERBOSE successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to set The LogLevel value at /etc/ssh/sshd_config to VERBOSE"
    fi