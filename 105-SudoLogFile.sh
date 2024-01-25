#!/bin/bash

# 5.3.3 Ensure sudo log file exists (Automated)

# Check if the script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "This script must be run as root or with sudo."
    exit 1
fi

SUDOERS_FILE="/etc/sudoers"
# Create a backup of the sudoers file
cp "$SUDOERS_FILE" "$SUDOERS_FILE1.bak"

# Use nano text editor to edit sudoers file
echo " "
echo "------------------------------------------------------------------------"
echo "Adding Defaults logfile=\"/var/log/sudo.log\" to sudoers file..."

if visudo -c >/dev/null 2>&1; then
    # visudo syntax check successful, proceed with editing
    visudo -f /etc/sudoers.d/pty_settings <<EOF
Defaults logfile="/var/log/sudo.log"
EOF
    echo " "
    echo "------------------------------------------------------------------------"
    echo "Changes applied successfully."
else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "Error: visudo syntax check failed. The changes were not applied."
    mv "$SUDOERS_FILE1.bak" "$SUDOERS_FILE"
    exit 1
fi
