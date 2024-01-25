#!/bin/bash

# 1.5.1 Ensure core dump storage is disabled (Automated)

if grep -i '^\s*storage\s*=\s*none' /etc/systemd/coredump.conf; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "the core dump storage is set to none already"
else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "The core dump not configred, Setting it to none now"

    sed -i '/Storage/ { s/.*/Storage=none/ }' /etc/systemd/coredump.conf
    
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The value set to none successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to set the core dump value"
    fi
fi