#!/usr/bin/env bash

# 3.1.4 Ensure wireless interfaces are disabled (Automated)

# Define a function for checking wireless is enabel or not
check_wireless () {

    if command -v nmcli >/dev/null 2>&1 ; then
        if nmcli radio all | grep -Eq '\s*\S+\s+disabled\s+\S+\s+disabled\b';
        then
            echo "Wireless is not enabled"
        else
            nmcli radio all
        fi
    elif [ -n "$(find /sys/class/net/*/ -type d -name wireless)" ]; 
    then
        t=0
        mname=$(for driverdir in $(find /sys/class/net/*/ -type d -name wireless | xargs -0 dirname); do basename "$(readlink -f "$driverdir"/device/driver/module)";done | sort -u)
        for dm in $mname; do
        if grep -Eq "^\s*install\s+$dm\s+/bin/(true|false)" /etc/modprobe.d/*.conf; 
        then
            /bin/true
        else
            echo "$dm is not disabled"
            t=1
        fi
        done
        [ "$t" -eq 0 ] && echo "Wireless is not enabled"
    else
        echo "Wireless is not enabled"
    fi
}


wirelessStatus=$(check_wireless)
stringMatch="Wireless is not enabled"


if [ "$wirelessStatus" != "$stringMatch" ]; then

    if command -v nmcli >/dev/null 2>&1 ; 
        then
            nmcli radio all off
    else
        if [ -n "$(find /sys/class/net/*/ -type d -name wireless)" ]; 
            then
            mname=$(for driverdir in $(find /sys/class/net/*/ -type d -name wireless | xargs -0 dirname); do basename "$(readlink -f "$driverdir"/device/driver/module)";done | sort -u)
            
            for dm in $mname; do
                echo "install $dm /bin/true" >> /etc/modprobe.d/disable_wireless.conf
            done
        fi
    fi

else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "The wireless has been disabeld already"
fi 