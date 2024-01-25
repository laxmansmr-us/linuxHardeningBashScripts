#!/bin/bash

# 2.2.7 Ensure FTP Server is not installed (Automated)

if [ rpm -q ftp  ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "ftp package is installed, working on removing it now"

    yum remove ftp

    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The ftp package removed successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to remove ftp package"
    fi
else   
    echo " "
    echo "------------------------------------------------------------------------"
    echo "ftp package is not installed already"
fi


# 2.2.8 Ensure VSFTP Server is not installed (Automated)

if [ "rpm -q vsftpd"  ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "vsftpd package is installed, working on removing it now"

    yum remove vsftpd

    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The vsftpd package removed successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to remove vsftpd package"
    fi
else   
    echo " "
    echo "------------------------------------------------------------------------"
    echo "vsftpd package is not installed already"
fi