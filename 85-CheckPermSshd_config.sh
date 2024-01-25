#!/bin/bash

# 5.2.1 Ensure permissions on /etc/ssh/sshd_config are configured (Automated)

chown root:root /etc/ssh/sshd_config
# Check previous command output
if [ $? -eq 0 ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "the root user has been set as Owner and group Owner for /etc/ssh/sshd_config"
else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "failed to set the root user as Owner and group Owner for /etc/ssh/sshd_config"
    CONTINUE="YES"
fi

chmod og-rwx /etc/ssh/sshd_config
# Check previous command output
if [ $? -eq 0 ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "The permission has been set successfully as og-rwx on /etc/ssh/sshd_config"
else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "failed to set the permisssions as og-rwx on /etc/ssh/sshd_config"
fi