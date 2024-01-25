#!/bin/bash

# 4.1.3.14 Ensure events that modify the system's Mandatory Access Controls are collected (Automated)

if grep -i -r "\-w /etc/selinux \-p wa \-k MAC-policy" /etc/audit/rules.d/* || \
    grep -i -r "\-w /usr/share/selinux \-p wa \-k MAC-policy" /etc/audit/rules.d/*; then

 
    echo " "
    echo "------------------------------------------------------------------------"
    echo "The Rules to collect events that modify the system's Mandatory Access Controls have Configured already, Nothing to do"

    # Check is reboot is required
    if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then printf "Reboot required to load rules\n"; fi


else

    echo " "
    echo "------------------------------------------------------------------------"
    echo "The Rules to collect events that modify the system's Mandatory Access Controls have NOT configured, Working on set it now"

    printf "
-w /etc/selinux -p wa -k MAC-policy
-w /usr/share/selinux -p wa -k MAC-policy
" >> /etc/audit/rules.d/50-MAC-policy.rules


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