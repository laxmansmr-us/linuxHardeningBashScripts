#!/bin/bash

# 4.1.3.10 Ensure successful file system mounts are collected (Automated) 

UID_MIN=$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)

if grep -i -r "\-a always,exit \-F arch=b32 \-S mount \-F auid>=1000 \-F auid!=unset \-k mounts" /etc/audit/rules.d/* || \
    grep -i -r "\-a always,exit \-F arch=b64 \-S mount \-F auid>=1000 \-F auid!=unset \-k mounts" /etc/audit/rules.d/*; then

    
    echo " "
    echo "------------------------------------------------------------------------"
    echo "The Rules to collect successful file system mounts have configured already, Nothing to do"

    # Check is reboot is required
    if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then printf "Reboot required to load rules\n"; fi


else

    echo " "
    echo "------------------------------------------------------------------------"
    echo "The Rules to collect successful file system mounts have NOT configured, Working on set it now"

    printf "
-a always,exit -F arch=b32 -S mount -F auid>=1000 -F auid!=unset -k mounts
-a always,exit -F arch=b64 -S mount -F auid>=1000 -F auid!=unset -k mounts
" >> /etc/audit/rules.d/50-perm_mod.rules

    # Merge and load the rules into active configuration
    augenrules --load

    # Check previous command output
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "Merge and load the rules into active configuration has been set successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to set the Merge and load the rules into active configuration"  
        CONTINUE="YES"
    fi

    # Check is reboot is required
    if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then printf "Reboot required to load rules\n"; fi
fi