#!/bin/bash

# 5.1.2 Ensure permissions on /etc/crontab are configured (Automated)
# 5.1.3 Ensure permissions on /etc/cron.hourly are configured (Automated)
# 5.1.4 Ensure permissions on /etc/cron.daily are configured (Automated)
# 5.1.5 Ensure permissions on /etc/cron.weekly are configured (Automated)
# 5.1.6 Ensure permissions on /etc/cron.monthly are configured (Automated)
# 5.1.7 Ensure permissions on /etc/cron.d are configured (Automated)


chown root:root /etc/cron*

    # Check previous command output
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The root user has been set as Owner user/group on /etc/cron* successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to set the root as Owner user/group on /etc/cron*"
        CONTINUE="YES"
    fi


chmod og-rwx /etc/cron*

    # Check previous command output
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "remove the Read, Write, And execution permission from others and groups on /etc/cron* successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to remove the Read, Write, And execution permission from others and groups /etc/cron*"
    fi