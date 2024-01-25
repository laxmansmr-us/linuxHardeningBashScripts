#!/bin/bash

# 1.5.3 Ensure address space layout randomization (ASLR) is enabled

# Get the variable value only using -n option
if [ "$(sysctl -n kernel.randomize_va_space)" == "2" ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "The ASLR value has been set to 2 already"
else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "The ASLR value didn't set to 2, Setting it now."

    # setting the kernel parameters
    printf "kernel.randomize_va_space = 2\n" >> /etc/sysctl.d/60-kernel_sysctl.conf

    # check Previos command result
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "the 2 value has been added to /etc/sysctl.d/60-kernel_sysctl.conf file successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "Failed to add the 2 value for kernel.randomize_va_space"
    fi

    # set the active kernel parameter
    sysctl -w kernel.randomize_va_space=2

    # check Previos command result
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The kernel parameter has been activated successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "Failed to activated The kernel parameter"
    fi
fi