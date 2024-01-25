#!/bin/bash

# 2.3.3 Ensure talk client is not installed (Automated)

if [ rpm -q talk ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "talk package is installed, working on removing it now"
    
    yum remove talk

    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The talk package removed successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to remove talk package"
    fi
else   
    echo " "
    echo "------------------------------------------------------------------------"
    echo "talk package is not installed"
fi
