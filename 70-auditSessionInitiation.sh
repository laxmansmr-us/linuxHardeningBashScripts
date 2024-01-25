#!/bin/bash

# 4.1.3.11 Ensure session initiation information is collected (Automated)


if grep -i -r "\-w /var/run/utmp \-p wa \-k session" /etc/audit/rules.d/* || \
    grep -i -r "\-w /var/log/wtmp \-p wa \-k session" /etc/audit/rules.d/* || \
    grep -i -r "\-w /var/log/btmp \-p wa \-k session" /etc/audit/rules.d/*; then

    echo " "
    echo "------------------------------------------------------------------------"
    echo "The Rules to collect session initiation information have configured already, Nothing to do"
    
    # Check is reboot is required
    if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then printf "Reboot required to load rules\n"; fi


else

    echo " "
    echo "------------------------------------------------------------------------"
    echo "The Rules to collect session initiation information have NOT configured. Working on set it now"

    printf "
-w /var/run/utmp -p wa -k session
-w /var/log/wtmp -p wa -k session
-w /var/log/btmp -p wa -k session
" >> /etc/audit/rules.d/50-session.rules


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
