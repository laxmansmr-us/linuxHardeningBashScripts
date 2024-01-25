#!/bin/bash

# 2.3.5 Ensure LDAP client is not installed (Automated)

if [ rpm -q openldap-clients ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "openldap-clients package is installed, working on removing it now"

    yum remove openldap-clients

    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The openldap-clients package removed successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to remove openldap-clients package"
    fi
else   
    echo " "
    echo "------------------------------------------------------------------------"
    echo "openldap-clients package is not installed already"
fi
