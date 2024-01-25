#!/bin/bash

# 1.9 Ensure updates, patches, and additional security software are installed (Manual)

if yum check-update; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "There are some updates out there, working on update them"

    yum update -y

    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "Updated successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "Failed to update "
    fi
else  
    echo " "  
    echo "------------------------------------------------------------------------"
    echo "The system is up to date already"
fi
