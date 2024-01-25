#!/bin/bash

# 5.2.3 Ensure permissions on SSH public host key files are configured (Automated)

find /etc/ssh -xdev -type f -name 'ssh_host_*_key.pub' -exec chmod u-x,go-wx {} \;
# Check previous command output
if [ $? -eq 0 ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "The permission has been set successfully as u-x,go-wx on ssh_host_*_key.pub"
else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "failed to set the permisssions as u-x,g-wx,o-rwx on ssh_host_*_key"
    CONTINUE="YES"
fi

find /etc/ssh -xdev -type f -name 'ssh_host_*_key.pub' -exec chown root:root {} \;
# Check previous command output
if [ $? -eq 0 ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "the root user has been set as Owner and group Owner for ssh_host_*_key.pub"
else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "failed to set the root user as Owner and group Owner for ssh_host_*_key.pub"
fi