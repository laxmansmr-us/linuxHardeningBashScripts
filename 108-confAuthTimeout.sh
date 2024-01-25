#!/bin/bash

# 5.3.6 Ensure sudo authentication timeout is configured correctly (Automated)

# Define the path to the sudoers file
SUDOERS_FILE="/etc/sudoers"

# Check if the sudoers file exists
if [ -e "$SUDOERS_FILE" ]; then
    # Create a backup of the sudoers file
    cp "$SUDOERS_FILE" "$SUDOERS_FILE4.bak"

if visudo -c >/dev/null 2>&1; then
    # visudo syntax check successful, proceed with editing
    visudo -f /etc/sudoers.d/authTimeout_settings <<EOF
Defaults env_reset, timestamp_timeout=15
Defaults timestamp_timeout=15
Defaults env_reset
EOF
    echo " "
    echo "------------------------------------------------------------------------"
    echo "Changes applied successfully."
else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "Error: visudo syntax check failed. The changes were not applied."
    mv "$SUDOERS_FILE4.bak" "$SUDOERS_FILE"
    exit 1
fi

else 
    echo " "
    echo "------------------------------------------------------------------------"
    echo "/etc/sudoer file does not exist"