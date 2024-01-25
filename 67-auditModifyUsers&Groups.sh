#!/bin/bash

# 4.1.3.8 Ensure events that modify user/group information are collected (Automated)

printf "





" >> /etc/audit/rules.d/50-identity.rules

if grep -i -r "\-w /etc/group \-p wa \-k identity" /etc/audit/rules.d/* || \
    grep -i -r "\-w /etc/passwd \-p wa \-k identity" /etc/audit/rules.d/* || \
    grep -i -r "\-w /etc/gshadow \-p wa \-k identity" /etc/audit/rules.d/* || \
    grep -i -r "\-w /etc/shadow \-p wa \-k identity" /etc/audit/rules.d/* || \
    grep -i -r "\-w /etc/security/opasswd \-p wa \-k identity" /etc/audit/rules.d/*; then

        
    echo " "
    echo "------------------------------------------------------------------------"
    echo "The Rules to Collect Modify users/groups is exist already, Nothing to do"

    # Check is reboot is required
    if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then printf "Reboot required to load rules\n"; fi

    exit 0

else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "The Rules to Collect Modify users/groups is not exist, working on set it now"


    printf "
-w /etc/group -p wa -k identity
-w /etc/passwd -p wa -k identity
-w /etc/gshadow -p wa -k identity
-w /etc/shadow -p wa -k identity
-w /etc/security/opasswd -p wa -k identity
" >> /etc/audit/rules.d/50-identity.rules


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

    # Check if reboot is required
    if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then printf "Reboot required to load rules\n"; fi
fi