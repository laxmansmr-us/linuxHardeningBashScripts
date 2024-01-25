#!/bin/bash

# 4.1.3.7 Ensure unsuccessful file access attempts are collected (Automated)

UID_MIN=$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)

if grep -i -r "\-a always,exit \-F arch=b64 \-S creat,open,openat,truncate,ftruncate \-F exit=-EACCES \-F auid>=${UID_MIN} \-F auid!=unset \-k access" /etc/audit/rules.d/* || \
    grep -i -r "\-a always,exit \-F arch=b64 \-S creat,open,openat,truncate,ftruncate \-F exit=-EPERM \-F auid>=${UID_MIN} \-F auid!=unset \-k access" /etc/audit/rules.d/* || \
    grep -i -r "\-a always,exit \-F arch=b32 \-S creat,open,openat,truncate,ftruncate \-F exit=-EACCES \-F auid>=${UID_MIN} \-F auid!=unset \-k access" /etc/audit/rules.d/* || \
    grep -i -r "\-a always,exit \-F arch=b32 \-S creat,open,openat,truncate,ftruncate \-F exit=-EPERM \-F auid>=${UID_MIN} \-F auid!=unset \-k access" /etc/audit/rules.d/*; then

         
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The Rules to Collect the unsuccessful file access attempts is already exists, Nothing to do"

        # Check is reboot is required
        if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then printf "Reboot required to load rules\n"; fi

else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The Rules to Collect the unsuccessful file access attempts is NOT exist, Working on set it now"

        printf "
-a always,exit -F arch=b64 -S creat,open,openat,truncate,ftruncate -F exit=-EACCES -F auid>=${UID_MIN} -F auid!=unset -k access
-a always,exit -F arch=b64 -S creat,open,openat,truncate,ftruncate -F exit=-EPERM -F auid>=${UID_MIN} -F auid!=unset -k access
-a always,exit -F arch=b32 -S creat,open,openat,truncate,ftruncate -F exit=-EACCES -F auid>=${UID_MIN} -F auid!=unset -k access
-a always,exit -F arch=b32 -S creat,open,openat,truncate,ftruncate -F exit=-EPERM -F auid>=${UID_MIN} -F auid!=unset -k access
" >> /etc/audit/rules.d/50-access.rules


        # Check Previous command output
        if [ $? -eq 0 ]; then
            echo " "
            echo "------------------------------------------------------------------------"
            echo "Successfully added rule for collecting unsuccessful file access attempts."
        else
            echo " "
            echo "------------------------------------------------------------------------"
            echo "Failed to add rule for collecting unsuccessful file access attempts."
        fi

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