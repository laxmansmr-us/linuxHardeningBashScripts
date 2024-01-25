#!/bin/bash

# 4.1.2.2 Ensure audit logs are not automatically deleted (Automated)

if [ "grep max_log_file_action /etc/audit/auditd.conf" == "keep_logs" ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "The audit logs are automatically deleted is configured already to keep_logs"
else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "The audit logs are automatically deleted is NOT configured to keep_logs, Working on set it now"

    sid -i '/max_log_file_action/ { s/.*max_log_file_action = keep_logs }' /etc/audit/auditd.conf
        
    # check Previos command result
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The value of max_log_file_action has been set to keep_logs successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "Failed to set the max_log_file_action value to keep_logs"
    fi
fi