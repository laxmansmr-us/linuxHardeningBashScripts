#!/bin/bash

# 5.1.1 Ensure cron daemon is enabled (Automated)

# Check if crond service is running
if systemctl is-active --quiet crond; then

    echo " "
    echo "------------------------------------------------------------------------"
    echo "crond service is running."
else

    echo " "
    echo "------------------------------------------------------------------------"
    echo "crond service is not running. Starting it..."
    systemctl start crond

    # Check previous command output
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "crond service has been started successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to start crond service"
        CONTINUE="YES"
    fi
fi

# Check if crond service is enabled
if systemctl is-enabled --quiet crond; then

    echo " "
    echo "------------------------------------------------------------------------"
  echo "crond service is enabled."
else

    echo " "
    echo "------------------------------------------------------------------------"
    echo "crond service is not enabled. Enabling it..."
    systemctl enable crond

      # Check previous command output
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "crond service has been enabled successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to enable crond service"
    fi
fi
