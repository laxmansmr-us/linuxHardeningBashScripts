#!/usr/bin/env bash

at_fix()
{
    if rpm -q at >/dev/null; then
        [ -e /etc/at.deny ] && rm -f /etc/at.deny

        # Check previous command output
        if [ $? -eq 0 ]; then
            echo " "
            echo "------------------------------------------------------------------------"
            echo "The /etc/at.deny file has been deleted successfully"
        else
            echo " "
            echo "------------------------------------------------------------------------"
            echo "The /etc/at.deny file dose not exit already"
            CONTINUE="YES"
        fi

        [ ! -e /etc/at.allow ] && touch /etc/at.allow

        # Check previous command output
        if [ $? -eq 0 ]; then
            echo " "
            echo "------------------------------------------------------------------------"
            echo "The /etc/at.allow file has been Created successfully"
        else
            echo " "
            echo "------------------------------------------------------------------------"
            echo "failed to create The /etc/at.allow file"
            CONTINUE="YES"
        fi

        # Set the permissions
        chown root:root /etc/at.allow

        # Check previous command output
        if [ $? -eq 0 ]; then
            echo " "
            echo "------------------------------------------------------------------------"
            echo "the root user has been set as Owner and group Owner for /etc/at.allow"
        else
            echo " "
            echo "------------------------------------------------------------------------"
            echo "failed to set the root user as Owner and group Owner for /etc/at.allow"
            CONTINUE="YES"
        fi


        chmod u-x,go-rwx /etc/at.allow
    else
        echo "at is not installed on the system"
    fi
}

# call the function
at_fix