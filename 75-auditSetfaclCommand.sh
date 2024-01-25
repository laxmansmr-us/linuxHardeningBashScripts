#!/bin/bash

# 4.1.3.16 Ensure successful and unsuccessful attempts to use the setfacl command are recorded (Automated)

UID_MIN=$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)

if grep -i -r "\-a always,exit \-F path=/usr/bin/setfacl \-F perm=x \-F auid>=${UID_MIN} \-F auid!=unset \-k perm_chng" /etc/audit/rules.d/*; then

    echo " "
    echo "------------------------------------------------------------------------"
    echo "The Rules to collect successful and unsuccessful attempts to use the setfacl command have configured already, Nothing to do"

    # Check is reboot is required
    if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then printf "Reboot required to load rules\n"; fi


else

    echo " "
    echo "------------------------------------------------------------------------"
    echo "The Rules to collect successful and unsuccessful attempts to use the setfacl command have NOT configured, working on set in now"

    printf "
-a always,exit -F path=/usr/bin/setfacl -F perm=x -F auid>=${UID_MIN} -F auid!=unset -k perm_chng
" >> /etc/audit/rules.d/50-priv_cmd.rules


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