#!/bin/bash

# 2.2.12 Ensure Samba is not installed (Automated)

if [ rpm -q samba ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "samba package is installed, working on remving it now"

    yum remove samba

    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "samba package has been removed successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to remove samba"
    fi
else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "samba package is not installed already"
fi