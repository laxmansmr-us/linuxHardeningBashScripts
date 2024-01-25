#!/bin/bash

# 4.1.3.4 Ensure events that modify date and time information are collected (Automated)

if grep -i -r "\-a always,exit \-F arch=b64 \-S adjtimex,settimeofday,clock_settime \-k time\-change" /etc/audit/rules.d/* || \
    grep -i -r "\-a always,exit \-F arch=b32 \-S adjtimex,settimeofday,clock_settime \-k time\-change" /etc/audit/rules.d/* || \
    grep -i -r "\-w /etc/localtime \-p wa \-k time\-change" /etc/audit/rules.d/*; then

        
    echo " "
    echo "------------------------------------------------------------------------"
    echo "The Rules to monitor event that modify date and time have configured already, Nothing to do"

    # Check if reboot is required
    if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then printf "Reboot required to load rules\n"; fi
    exit 0
else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "The Rules to monitor event that modify date and time Did NOT configured, Working to configure it now"

    printf "
-a always,exit -F arch=b64 -S adjtimex,settimeofday,clock_settime -k time-change
-a always,exit -F arch=b32 -S adjtimex,settimeofday,clock_settime -k time-change
-w /etc/localtime -p wa -k time-change
" >> /etc/audit/rules.d/50-time-change.rules

    # Check previous command output
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "the values have been set successfully at /etc/audit/rules.d/50-time-change.rules file"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to set the values at /etc/audit/rules.d/50-time-change.rules file"  
        CONTINUE="YES"
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