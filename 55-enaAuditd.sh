#!/bin/bash

# 4.1.1.2 Ensure auditd service is enabled (Automated)

if systemctl is-enabled auditd; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "The auditd serivce is enable already"

else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "The auditd serivce is not enabled, working on enabling it now"    

    # enabel the service
    systemctl --now enable auditd
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The auditd service is enabled successfully"
    else 
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to enable The auditd service"
    fi    
    
    # start the service
    systemctl --now start auditd
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The auditd service is started successfully"
    else 
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to start The auditd service"
    fi 
fi