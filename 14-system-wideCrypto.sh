#!bin/bash

# 1.10 Ensure system-wide crypto policy is not legacy (Automated) 

# Check if the package is installed
if ! rpm -q crypto-policies; then
    # Install the package
    sudo yum install -y crypto-policies
fi

if [ grep -E -i '^\s*LEGACY\s*(\s+#.*)?$' /etc/crypto-policies/config ]; then
    echo ""
    echo "--------------------------------------"
    echo "System-wide Crypto is configured on LEGACY, Working on configure it to DEFAULT"
    
    # set the wide system crypto to default
    update-crypto-policies --set DEFAULT

    # Check previous command result value
    if [ $? -eq 0 ]; then
        echo ""
        echo "--------------------------------------"
        echo "The DEFAULT value has been set successfully"
    else
        echo ""
        echo "--------------------------------------"
        echo "failed to set the DEFAULT value"
    fi

    # Run the following to make the updated system-wide crypto policy active
    update-crypto-policies

    # Check previous command result value
    if [ $? -eq 0 ]; then
        echo ""
        echo "--------------------------------------"
        echo "The DEFAULT value has been Updated successfully"
    else
        echo ""
        echo "--------------------------------------"
        echo "failed to Update the DEFAULT value"
    fi
else
    echo ""
    echo "--------------------------------------"
    echo "System-wide Crypto is Not configured on LEGACY already, Nothing to do"