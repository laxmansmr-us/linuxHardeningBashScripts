#!/bin/bash

# Check if Python 2 is installed
if ! command -v python2 &> /dev/null; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "Python 2 is not installed. Installing Python 2."

    yum install -y python2
    # check the output result
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The python2 package has been installed successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "Failed to install the python2 package."
    fi

else
    echo "The Python 2 is already installed, Nothing to do"
fi