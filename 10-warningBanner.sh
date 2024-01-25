#!/bin/bash

# 1.7 Command Line Warning Banners

motd=/etc/motd
issue=/etc/issue
issue_net=/etc/issue.net

# Ensure the files are exist
for file in $motd $issue $issue_net; do

    if [ ! -e $file ]; then
        touch $file
    fi
done


if ! grep -q "matchBanner" $motd || \
     grep -q "matchBanner" $issue || \
     grep -q "matchBanner" $issue_net; then
    
    echo " "
    echo "------------------------------------------------------------------------"
    echo "The banner not exist, Appending it now"

    # Append the Banner with for loop
    for file in $motd $issue $issue_net; do
        echo '
    ###################################################################
    #                                                                 #
    #                                                                 #
    #                                                                 #
    # This system is for the use of authorized users only.            #
    # Individuals using this computer system without authority, or in #
    # excess of their authority, are subject to having all of their   #
    # activities on this system monitored and recorded by system      #
    # personnel.                                                      #
    #                                                                 #
    # In the course of monitoring individuals improperly using this   #
    # system, or in the course of system maintenance, the activities  #
    # of authorized users may also be monitored.                      #
    #                                                                 #
    # Anyone using this system expressly consents to such monitoring  #
    # and is advised that if such monitoring reveals possible         #
    # evidence of criminal activity, system personnel may provide the #
    # evidence of such monitoring to law enforcement officials.       #
    ###################################################################
    ' > "$file"
    done

    # check Previos command result
    if [ $? -eq 0 ]; then
        echo " "
        echo "----------------------------------------"
        echo "The Banner has been addedd successfully"
    else
        echo " "
        echo "----------------------------------------"
        echo "failed to add the banner"
    fi


else
    echo " "
    echo "----------------------------------------"
    echo "The banner is exist already"
fi

# set the permisions
echo " "
echo "----------------------------------------"
echo "Setting the root as owner, and exclude execution"
for perm in $motd $issue $issue_net; do
    chown root:root $perm
    chmod u-x,go-wx $perm
done

# check Previos command result
if [ $? -eq 0 ]; then
    echo " "
    echo "----------------------------------------"
    echo "Permisions has been set successfully"
else
    echo " "
    echo "----------------------------------------"
    echo "failed to set the permisions"
fi