#!/bin/bash

# 2.2.11 Ensure IMAP and POP3 server is not installed (Automated)

if [ rpm -q dovecot cyrus-imapd ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "dovecot cyrus-imapd packages are installed, working on remving them now"

    yum remove dovecot cyrus-imapd

    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "dovecot cyrus-imapd packages have been removed successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to remove dovecot cyrus-imapd"
    fi
else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "dovecot cyrus-imapd packages are not installed already"
fi