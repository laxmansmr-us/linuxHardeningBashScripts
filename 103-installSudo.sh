#!/bin/bash

# 5.3.1 Ensure sudo is installed (Automated) 

if rpm -q sudo; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "Sudo is already installed"
else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "sudo in not insalled, installing it.."

    yum install sudo -y

    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "Sudo has been installed successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to install the sudo"
    fi
fi