#!/bin/bash

# 1.5.2 Ensure core dump backtraces are disabled (Automated)

if grep -i '^\s*ProcessSizeMax\s*=\s*0' /etc/systemd/coredump.conf; then
    echo "The ProcessSizeMax has been set to 0 already"

else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "The ProcessSizeMax Didn't set to 0, Setting it now"
    
    # Replace the ProcessSizeMax value to 0
    sed -i '/ProcessSizeMax/ { s/.*/ProcessSizeMax=0 }' /etc/systemd/coredump.conf
    
    # check Previos command result
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The value of ProcessSizeMax has been set to 0 successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "Failed to set the ProcessSizeMax value to 0"
    fi
fi