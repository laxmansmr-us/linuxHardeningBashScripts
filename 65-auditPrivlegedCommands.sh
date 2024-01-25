#!/bin/bash

# 4.1.3.6 Ensure use of privileged commands are collected (Automated)

build_audit_rules()
(
    UID_MIN=$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)
    AUDIT_RULE_FILE="/etc/audit/rules.d/50-privileged.rules"
    NEW_DATA=()
    for PARTITION in $(findmnt -n -l -k -it $(awk '/nodev/ { print $2 }' /proc/filesystems | paste -sd,) | grep -Pv "noexec|nosuid" | awk '{print $1}'); do
        readarray -t DATA < <(find "${PARTITION}" -xdev -perm /6000 -type f | awk -v UID_MIN=${UID_MIN} '{print "-a always,exit -F path=" $1 " -F perm=x -F auid>="UID_MIN" -F auid!=unset -k privileged" }')
        for ENTRY in "${DATA[@]}"; do
            NEW_DATA+=("${ENTRY}")
        done
    done
    readarray &> /dev/null -t OLD_DATA < "${AUDIT_RULE_FILE}"
    COMBINED_DATA=( "${OLD_DATA[@]}" "${NEW_DATA[@]}" )
    printf '%s\n' "${COMBINED_DATA[@]}" | sort -u > "${AUDIT_RULE_FILE}"
)
build_audit_rules

# Check previous command output
if [ $? -eq 0 ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "The Audit rules for use of privileged commands has been set successfully under /etc/audit/rules.d/50-privileged.rules"
else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "failed to set the values of Audit rules for use of privileged commands under /etc/audit/rules.d/50-privileged.rules"
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
