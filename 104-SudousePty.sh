#!/bin/bash

# 5.3.2 Ensure sudo commands use pty (Automated) 

# Check if the script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "This script must be run as root or with sudo."
    exit 1
fi

# Define the line to add to sudoers
new_line="Defaults use_pty"
SUDOERS_FILE="/etc/sudoers"

# Create a backup of the sudoers file
cp "$SUDOERS_FILE" "$SUDOERS_FILE0.bak"

# Use nano text editor to edit sudoers file
echo " "
echo "------------------------------------------------------------------------"
echo "Adding '$new_line' to sudoers file..."

if visudo -c >/dev/null 2>&1; then
    # visudo syntax check successful, proceed with editing
    visudo -f /etc/sudoers.d/pty_settings <<EOF
$new_line
EOF
    echo " "
    echo "------------------------------------------------------------------------"
    echo "Changes applied successfully."
else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "Error: visudo syntax check failed. The changes were not applied."
    mv "$SUDOERS_FILE0.bak" "$SUDOERS_FILE"
    exit 1
fi
