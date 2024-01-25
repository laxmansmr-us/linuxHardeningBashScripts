#!/bin/bash

# 4.1.3.2 Ensure actions as another user are always logged (Automated)

if grep -i -r "\-a always,exit \-F arch=b64 \-C euid!=uid \-F auid!=unset \-S execve \-k user_emulation" /etc/audit/rules.d/* || \
    grep -i -r "\-a always,exit \-F arch=b32 \-C euid!=uid \-F auid!=unset \-S execve \-k user_emulation" /etc/audit/rules.d/*; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The audit of actions as another user is configured already"
else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "The audit of actions as another user is NOT configured"


    printf "
-a always,exit -F arch=b64 -C euid!=uid -F auid!=unset -S execve -k user_emulation
-a always,exit -F arch=b32 -C euid!=uid -F auid!=unset -S execve -k user_emulation" >> /etc/audit/rules.d/50-user_emulation.rules


    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "the audit actions as another user parameters has been set successfully at /etc/audit/rules.d/50-user_emulation.rules"   
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to set the audit actions as another user parameters at /etc/audit/rules.d/50-user_emulation.rules"  
    fi

    # Merge and load the rules into active configuration
    augenrules --load

    # check if rebooted is required
    if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then printf "Reboot required to load rules\n"; fi
    
fi