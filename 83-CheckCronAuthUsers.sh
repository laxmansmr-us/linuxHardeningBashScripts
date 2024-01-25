#!/bin/bash
#!/usr/bin/env bash

# 5.1.8 Ensure cron is restricted to authorized users (Automated)

cron_fix()
{
if rpm -q cronie >/dev/null; then

    # Delete the cron.deny if exist
    [ -e /etc/cron.deny ] && rm -f /etc/cron.deny
    
    
    # Check previous command output
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The /etc/cron.deny file has been deleted successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The /etc/cron.deny file dose not exit already"
        CONTINUE="YES"
    fi

    # Create /etc/cron/allow if not exist
    [ ! -e /etc/cron.allow ] && touch /etc/cron.allow

    # Check previous command output
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The /etc/cron.allow file has been Created successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to create The /etc/cron.allow file"
        CONTINUE="YES"
    fi


    # Set permissions
    chown root:root /etc/cron.allow

    # Check previous command output
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "the root user has been set as Owner and group Owner for /etc/cron.allow"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to set the root user as Owner and group Owner for /etc/cron.allow"
        CONTINUE="YES"
    fi

    chmod u-x,go-rwx /etc/cron.allow

    # Check previous command output
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The permission has been set successfully as the u-x,go-rwx"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to set the permisssions as u-x,go-rwx"
        CONTINUE="YES"
    fi


else
    echo "cron is not installed on the system"
fi
}

# Call the function
cron_fix


## Explanation ##
# /etc/cron.allow: If this file exists, only users listed in it are allowed to use the cron service. 
# If the file doesn't exist, all users except those listed in /etc/cron.deny are permitted to use cron.