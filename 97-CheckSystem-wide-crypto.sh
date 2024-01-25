#!/bin/bash

# 5.2.6 Ensure SSH PAM is enabled (Automated)

sed -ri "s/^\s*(CRYPTO_POLICY\s*=.*)$/# \1/" /etc/sysconfig/sshd
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The CRYPTO_POLICY value at /etc/ssh/sshd_config has been hashed successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed/alreadyExist to set The CRYPTO_POLICY value at /etc/ssh/sshd_config to hashed"
        
        CRYPTO_POLICYvalue=$(cat /etc/ssh/sshd_config | grep -i CRYPTO_POLICY)
        echo " "
        echo "The CRYPTO_POLICY value is: $CRYPTO_POLICYvalue"
    fi

systemctl reload sshd
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The SSHD service has been reloaded successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to reload the SSHD service"
        
    fi