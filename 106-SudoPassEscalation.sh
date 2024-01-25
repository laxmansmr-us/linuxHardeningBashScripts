#!/bin/bash

# 5.3.4 Ensure users must provide password for escalation (Automated)

# Define the path to the sudoers file
SUDOERS_FILE="/etc/sudoers"

# Check if the sudoers file exists
if [ -e "$SUDOERS_FILE" ]; then
    # Create a backup of the sudoers file
    cp "$SUDOERS_FILE" "$SUDOERS_FILE2.bak"

    # Use sed to replace "NOPASSWD" with an empty string in each line
    sed -i 's/NOPASSWD//g' "$SUDOERS_FILE"
    
    # Check if sed was successful
    if [ $? -eq 0 ]; then
        echo " "
        echo "---------------------------------------------------"
        echo "Removed 'NOPASSWD' entries from the sudoers file."
    else
        echo " "
        echo "---------------------------------------------------"
        echo "Error: Failed to remove 'NOPASSWD' entries. Restoring the backup."
        mv "$SUDOERS_FILE2.bak" "$SUDOERS_FILE"
    fi
else
    echo " "
    echo "---------------------------------------------------"
    echo "Error: Sudoers file not found at $SUDOERS_FILE"
fi
