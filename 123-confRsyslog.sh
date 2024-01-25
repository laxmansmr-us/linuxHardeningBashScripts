#!/bin/bash

# configure rsyslog based

if grep -i '*.* @1.1.10.10:0' /etc/rsyslog.conf; then

    echo "INFO  The 1.1.10.10 IP has been configured already, Nothing to do"
else
    echo "INFO The 1.1.10.10 have not configured, Working on set it now"

    printf "
*.* @1.1.10.10:0" >> /etc/rsyslog.conf

    systemctl --now restart rsyslog
    if [ $? -eq 0 ]; then
        echo "INFO The 1.1.10.10 have configured Successfully to send rsyslog"
    else
        echo "INFO failed to set The 1.1.10.10 in rsys configurtions to send logs"
    fi 

fi