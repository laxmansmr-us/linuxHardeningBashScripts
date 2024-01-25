#!/bin/bash

# 4.1.3.21 Ensure the running and on disk configuration is the same (Manual)


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
