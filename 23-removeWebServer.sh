#!/bin/bash

# 2.2.10 Ensure a web server is not installed (Automated)

if [ rpm -q httpd nginx ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "The httpd, nginx packages are installed, working on removing them now"

    yum remove httpd nginx

    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "httpd, nginx removed succesfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to remove httpd, nginx"
    fi
else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "httpd, nginx are not installed already"
fi