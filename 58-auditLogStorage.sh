#!/bin/bash

# 4.1.2.1 Ensure audit log storage size is configured (Automated)

if [ "grep -w "^\s*max_log_file\s*=" /etc/audit/auditd.conf" == "8" ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "The audit log storage size is configured already to 8"
else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "The audit log storage size is NOT configured to 8, Working on set it now"

    sid -i '/max_log_file/ { s/.*/max_log_file = 8 }' /etc/audit/auditd.conf
        
    # check Previos command result
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The value of max_log_file has been set to 8 successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "Failed to set the max_log_file value to 8"
    fi
fi