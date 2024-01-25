#!/bin/bash

# 4.1.3.1 Ensure changes to system administration scope (sudoers) is collected (Automated)

# take this script as a refrence 58-auditLogStorage.sh

if grep -i "\-w /etc/sudoers \-p wa \-k scope" /etc/audit/rules.d/* || \
   grep -i "\-w /etc/sudoers.d \-p wa \-k scope" /etc/audit/rules.d/*; then

    echo " "
    echo "------------------------------------------------------------------------"
    echo "The audit of sudoers scope is configured already"
    
else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "The audit of sudoers scope is NOT configured, working on configure it now"   

    printf "-w /etc/sudoers -p wa -k scope\n-w /etc/sudoers.d -p wa -k scope\n" >> /etc/audit/rules.d/50-scope.rules

    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "the audit of sudoers scope parameters has been set successfully at /etc/audit/rules.d/50-scope.rules"   
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to set the audit of sudoers scope parameters at /etc/audit/rules.d/50-scope.rules"  
    fi

    # Merge and load the rules into active configuration
    augenrules --load

    # check if rebooted is required
    if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then printf "Reboot required to load rules\n"; fi
fi