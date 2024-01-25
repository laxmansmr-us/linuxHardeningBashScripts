#!/bin/bash

# cve-2023-48795 | https://access.redhat.com/security/cve/cve-2023-48795


if grep -i -r "cipher@SSH = -CHACHA20-POLY1305" /etc/crypto-policies/policies/modules/* || grep -i -r "cipher@SSH = -CHACHA20-POLY1305" /etc/crypto-policies/policies/modules/*; then
    echo " "
    echo "--------------------------------------------------"
    echo "The cipher@SSH = -CHACHA20-POLY1305  AND cipher@SSH = -CHACHA20-POLY1305 have been exists already, Nothing to do"
else
    echo " "
    echo "--------------------------------------------------"
    echo "The cipher@SSH = -CHACHA20-POLY1305  AND cipher@SSH = -CHACHA20-POLY1305 have NOT exist, Working on set it"

    printf "
cipher@SSH = -CHACHA20-POLY1305
ssh_etm = 0" >> /etc/crypto-policies/policies/modules/CVE-2023-48795.pmod

    if [ $? -eq 0 ]; then
        echo " "
        echo "--------------------------------------------------"
        echo "The cipher@SSH = -CHACHA20-POLY1305  AND ssh_etm = 0 values has been set successfully under /etc/crypto-policies/policies/modules/CVE-2023-48795.pmod file"
    else
        echo " "
        echo "--------------------------------------------------"
        echo "failed to set The cipher@SSH = -CHACHA20-POLY1305  AND ssh_etm = 0 values under /etc/crypto-policies/policies/modules/CVE-2023-48795.pmod file"
    fi

    # applying the resulting subpolicy with
    update-crypto-policies --set $(update-crypto-policies --show):CVE-2023-48795

    if [ $? -eq 0 ]; then
        echo " "
        echo "--------------------------------------------------"
        echo "The subpolicy values has been applied successfully"
        echo "    Note: System-wide crypto policies are applied on application start-up. It is recommended to restart the system for the change of policies to fully take place."
        echo "--------------------------------------------------"
        
        echo "Checking the configs are missing at the /etc/crypto-policies/back-ends/opensshserver.config, etc/crypto-policies/back-ends/openssh.config files"
        if grep -i "cipher@SSH = -CHACHA20-POLY1305" /etc/crypto-policies/back-ends/opensshserver.config || grep -i "ssh_etm = 0" /etc/crypto-policies/back-ends/opensshserver.config; then
            echo "the values are missing at /etc/crypto-policies/back-ends/opensshserver.config"
        else
            echo "The values is exist under /etc/crypto-policies/back-ends/opensshserver.config"
        fi

        if grep -i "cipher@SSH = -CHACHA20-POLY1305" /etc/crypto-policies/back-ends/openssh.config || grep -i "ssh_etm = 0" /etc/crypto-policies/back-ends/openssh.config; then
            echo "the values are missing at /etc/crypto-policies/back-ends/openssh.config"
    else
        echo "The values is exist under /etc/crypto-policies/back-ends/openssh.config"
    fi

    systemctl restart rsyslog.service
    if [ $? -eq 0 ]; then
        echo "The rsyslog.service has been restarted successfully"
    else
        echo "failed to restart the rsyslog.service"
    fi

    else
        echo " "
        echo "--------------------------------------------------"
        echo "failed to set the subpolicy values"
        fi    
fi