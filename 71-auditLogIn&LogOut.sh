#!/bin/bash

# 4.1.3.12 Ensure login and logout events are collected (Automated)


if grep -i -r "-w /var/log/lastlog -p wa -k logins" /etc/audit/rules.d/* || \
    grep -i -r "-w /var/run/faillock -p wa -k logins" /etc/audit/rules.d/*; then

    echo " "
    echo "------------------------------------------------------------------------"
    echo "The Rules to collect login and logout events have configured already, Nothing to do"

 
    # Check is reboot is required
    if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then printf "Reboot required to load rules\n"; fi

else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "The Rules to collect login and logout events have NOT configured, Working on set it now"

    printf "
-w /var/log/lastlog -p wa -k logins
-w /var/run/faillock -p wa -k logins
" >> /etc/audit/rules.d/50-login.rules


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
