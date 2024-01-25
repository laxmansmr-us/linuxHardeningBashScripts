#!/bin/bash

# 6.2.1 Ensure password fields are not empty (Automated)

users=$(awk -F: '($2 == "" ) { print $1 }' /etc/shadow)

if [ -z "$users" ]; then
    echo " "
    echo "--------------------------------------------------"
    echo "There's no users have empty password field in /etc/shadow file"
else
    echo " "
    echo "--------------------------------------------------"
    echo "The Following users have not password filed $users, Working on lock them now"

    for user in $users; do
        echo " "
        echo "--------------------------------------------------"
        echo "The Following users have not password filed: $users, Working on lock them now"

        passwd -l "$user"

        if [ $? -eq 0 ]; then
            echo "The follwoing user has been locked successfully: $user"
        else
            echo "failed to lock the following user : $user"
        fi

fi