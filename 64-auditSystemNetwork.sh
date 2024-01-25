#!/bin/bash

# 4.1.3.5 Ensure events that modify the system's network environment are collected (Automated)

if grep -i -r "\-a always,exit \-F arch=b64 \-S sethostname,setdomainname \-k system\-locale"  /etc/audit/rules.d/* || \
    grep -i -r "\-a always,exit \-F arch=b32 \-S sethostname,setdomainname \-k system\-locale" /etc/audit/rules.d/* || \
    grep -i -r "\-w /etc/issue \-p wa \-k system\-locale" /etc/audit/rules.d/* || \
    grep -i -r "\-w /etc/issue.net \-p wa \-k system\-locale" /etc/audit/rules.d/* || \
    grep -i -r "\-w /etc/hosts \-p wa \-k system\-locale" /etc/audit/rules.d/*
    grep -i -r "\-w /etc/sysconfig/network \-p wa \-k system\-locale" /etc/audit/rules.d/* || \
    grep -i -r "\-w /etc/sysconfig/network\-scripts/ \-p wa \-k system\-locale" /etc/audit/rules.d/*; then

    
    echo " "
    echo "------------------------------------------------------------------------"
    echo "The Rules to collect modify the system's network environment have configured already, Nothing to do"

    # Check is reboot is required
    if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then printf "Reboot required to load rules\n"; fi

    exit 0

else

    echo " "
    echo "------------------------------------------------------------------------"
    echo "The Rules to collect modify the system's network environment have NOT configured, Working on set it now"

    printf "
-a always,exit -F arch=b64 -S sethostname,setdomainname -k system-locale
-a always,exit -F arch=b32 -S sethostname,setdomainname -k system-locale
-w /etc/issue -p wa -k system-locale
-w /etc/issue.net -p wa -k system-locale
-w /etc/hosts -p wa -k system-locale
-w /etc/sysconfig/network -p wa -k system-locale
-w /etc/sysconfig/network-scripts/ -p wa -k system-locale
" >> /etc/audit/rules.d/50-system_local.rules

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