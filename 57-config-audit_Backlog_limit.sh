#!/bin/bash

# 4.1.1.4 Ensure audit_backlog_limit is sufficient (Automated)

if [ "find /boot -type f -name 'grubenv' -exec grep -P'kernelopts=([^#\n\r]+\h+)?(audit_backlog_limit=\S+\b)' {} \;" == "8192" ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "audit_backlog_limit is sufficient already with 8192"
else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "audit_backlog_limit is NOT sufficient with 8192"    

    grubby --update-kernel ALL --args 'audit_backlog_limit=8192'
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The audit_backlog_limit has been set successfully with 8192"
    else 
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to set The audit_backlog_limit with 8192"
    fi  
fi