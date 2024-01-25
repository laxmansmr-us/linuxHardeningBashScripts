#!/bin/bash

# Set SELinux to Permissive Mode
echo " "
echo "------------------------------------------------------------------------"
echo "Setting SELinux to permissive mode..."
sudo setenforce 0

# check Previos command result
if [ $? -eq 0 ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "the SELinux has been set to Permissive mode Successfully"
else    
    echo " "
    echo "------------------------------------------------------------------------"
    echo "failed to set Permissive mode"
fi
