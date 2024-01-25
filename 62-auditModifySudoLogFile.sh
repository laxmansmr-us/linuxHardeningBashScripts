#!/bin/bash

# 4.1.3.3 Ensure events that modify the sudo log file are collected (Automated) 

# grep the logfile PATH of sudoers | delete everything before logfile PATH and after
SUDO_LOG_FILE=$(grep -r logfile /etc/sudoers* | sed -e 's/.*logfile=//;s/,?.*//' -e 's/"//g')

# Check if SUDO_LOG_FILE is empty or not, if it is empty print
if [ -z "$SUDO_LOG_FILE" ]
then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "No Log File Set: No actions will be performed in this test case."
else
    CONTINUE="YES"
fi

# Check if the file contains the metioned line
if grep -i -r "\-w ${SUDO_LOG_FILE} \-p wa \-k sudo_log_file" /etc/audit/rules.d*; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "the logfile path is configred already, Nothing to do"
else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "the logfile path is Not configred, Working on set it now"   

    printf "-w ${SUDO_LOG_FILE} -p wa -k sudo_log_file" >> /etc/audit/rules.d/50-sudo.rules

    # check the output result
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The sudoers logfile path has been set sueccfully under /etc/audit/rules.d/50-sudo.rules*"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "Failed to set the logfile path under /etc/audit/rules.d/50-sudo.rules"    
    fi

    # Merge and load the rules into active configuration?
    augenrules --load

    # Check if reboot is required
    if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then printf "Reboot required to load rules\n"; fi
fi