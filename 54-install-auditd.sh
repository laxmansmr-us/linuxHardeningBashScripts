#!/bin/bash

# 4.1.1.1 Ensure auditd is installed (Automated)

if [ "rpm -q audit" ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "The audit is exist already"

else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "The audit is not exist, working on installing it now"

    yum install audit -y

    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "audit has been installed successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to install audit pacakge"
    fi
fi