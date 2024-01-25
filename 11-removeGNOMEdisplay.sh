#!/bin/bash

# 1.8.1 Ensure GNOME Display Manager is removed (Manual)

if [ "rpm -q gdm" ]; then

    echo " "
    echo "------------------------------------------------------------------------"
    echo "The GNOME display package is exist, Working on remove it"

    # remove the package
    yum remove  gdm
    if [ $? -eq 0 ] ; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo " The GNOME display package has been removed successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------" 
        echo "failed to remove the GNOME display package"
    fi
else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "The GNOME display package is not installed already"       
fi