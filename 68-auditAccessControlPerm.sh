#!/bin/bash

# 4.1.3.9 Ensure discretionary access control permission modification events are collected (Automated) 

UID_MIN=$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)

if grep -i -r "\-a always,exit \-F arch=b64 \-S chmod,fchmod,fchmodat \-F auid>=${UID_MIN} \-F auid!=unset \-F key=perm_mod" /etc/audit/rules.d/* || \
    grep -i -r "\-a always,exit \-F arch=b64 \-S chown,fchown,lchown,fchownat \-F auid>=${UID_MIN} \-F auid!=unset \-F key=perm_mod" /etc/audit/rules.d/* || \
    grep -i -r "\-a always,exit \-F arch=b32 \-S chmod,fchmod,fchmodat \-F auid>=${UID_MIN} \-F auid!=unset \-F key=perm_mod" /etc/audit/rules.d/* || \
    grep -i -r "\-a always,exit \-F arch=b32 \-S lchown,fchown,chown,fchownat \-F auid>=${UID_MIN} \-F auid!=unset \-F key=perm_mod" /etc/audit/rules.d/* || \
    grep -i -r "\-a always,exit \-F arch=b64 \-S setxattr,lsetxattr,fsetxattr,removexattr,lremovexattr,fremovexattr \-F auid>=${UID_MIN} \-F auid!=unset \-F key=perm_mod" /etc/audit/rules.d/* || \
    grep -i -r "\-a always,exit \-F arch=b32 \-S setxattr,lsetxattr,fsetxattr,removexattr,lremovexattr,fremovexattr \-F auid>=${UID_MIN} \-F auid!=unset \-F key=perm_mod" /etc/audit/rules.d/*; then


    echo " "
    echo "------------------------------------------------------------------------"
    echo "The Rules to collect access control permissions modifications have configured already, Nothing to do"

    # Check is reboot is required
    if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then printf "Reboot required to load rules\n"; fi

else

    echo " "
    echo "------------------------------------------------------------------------"
    echo "The Rules to collect access control permissions modifications have NOT configured, working to set it now"


    printf "
-a always,exit -F arch=b64 -S chmod,fchmod,fchmodat -F auid>=${UID_MIN} -F auid!=unset -F key=perm_mod
-a always,exit -F arch=b64 -S chown,fchown,lchown,fchownat -F auid>=${UID_MIN} -F auid!=unset -F key=perm_mod
-a always,exit -F arch=b32 -S chmod,fchmod,fchmodat -F auid>=${UID_MIN} -F auid!=unset -F key=perm_mod
-a always,exit -F arch=b32 -S lchown,fchown,chown,fchownat -F auid>=${UID_MIN} -F auid!=unset -F key=perm_mod 
-a always,exit -F arch=b64 -S setxattr,lsetxattr,fsetxattr,removexattr,lremovexattr,fremovexattr -F auid>=${UID_MIN} -F auid!=unset -F key=perm_mod
-a always,exit -F arch=b32 -S setxattr,lsetxattr,fsetxattr,removexattr,lremovexattr,fremovexattr -F auid>=${UID_MIN} -F auid!=unset -F key=perm_mod
" >> /etc/audit/rules.d/50-perm_mod.rules


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