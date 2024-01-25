#!/bin/bash

# Check if the 'at' package is installed
if ! rpm -q at &>/dev/null; then
    echo "'at' package is not installed. Installing..."
    # Install the 'at' package
    sudo yum install -y at
else
    echo "'at' package is already installed."
fi
