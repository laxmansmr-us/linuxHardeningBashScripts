#!/bin/bash

# 4.1.3.19 Ensure kernel module loading unloading and modification is collected (Automated)

UID_MIN=$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)

if grep -i -r "-\a always,exit \-F arch=b64 \-S init_module,finit_module,delete_module,create_module,query_module \-F auid>=${UID_MIN} \-F auid!=unset \-k kernel_modules"  /etc/audit/rules.d/* || \
    grep -i -r "\-a always,exit \-F path=/usr/bin/kmod \-F perm=x \-F auid>=${UID_MIN} \-F auid!=unset \-k kernel_modules" /etc/audit/rules.d/*; then
 
    echo " "
    echo "------------------------------------------------------------------------"
    echo "The Rules to collect kernel module loading unloading and modification have configured already, Nothing to do"

    # Check is reboot is required
    if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then printf "Reboot required to load rules\n"; fi


else

    echo " "
    echo "------------------------------------------------------------------------"
    echo "The Rules to collect kernel module loading unloading and modification have NOT configured, Working on set it now"

    printf "
-a always,exit -F arch=b64 -S init_module,finit_module,delete_module,create_module,query_module -F auid>=${UID_MIN} -F auid!=unset -k kernel_modules
-a always,exit -F path=/usr/bin/kmod -F perm=x -F auid>=${UID_MIN} -F auid!=unset -k kernel_modules
" >> /etc/audit/rules.d/50-kernel_modules.rules


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