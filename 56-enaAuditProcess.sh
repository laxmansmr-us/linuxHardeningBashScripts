#!/bin/bash

# 4.1.1.3 Ensure auditing for processes that start prior to auditd is enabled (Automated)

if [ "find /boot -type f -name 'grubenv' -exec grep -P 'kernelopts=([^#\n\r]+\h+)?(audit=1)' {} \;" == "audit=1" ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "The auditing for processes that start prior is enabled already"

else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "The auditing for processes that start prior is disbaled, working on enable it now"

    grubby --update-kernel ALL --args 'audit=1'
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The auditing for processes that start prior is enabled successfully"
    else 
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to enable The auditing for processes that start prior"
    fi     
fi