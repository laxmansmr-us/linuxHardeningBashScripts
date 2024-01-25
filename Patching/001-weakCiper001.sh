#!/bin/bash

# cve-2023-48795 | https://access.redhat.com/security/cve/cve-2023-48795
printf "
cipher@SSH = -CHACHA20-POLY1305
ssh_etm = 0" > /etc/crypto-policies/policies/modules/CVE-2023-48795.pmod

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
        echo "The subpolicy values has been applied successfully"
    else 
        echo "failed to set The subpolicy values"
    fi

# restart the sshd service 
systemctl restart sshd.service
    if [ $? -eq 0 ]; then
        echo "The SSHD service has been restarted successfully"
    else 
        echo "failed to restart the sshd servive"
    fi


# verification step | the above action should be remove the follwing lines from  /etc/crypto-policies/back-ends/opensshserver.config, /etc/crypto-policies/back-ends/openssh.config
echo "Verfiy The weakCipher are messing"

# Define the patterns to loop on
PATTERN1="chacha20-poly1305@openssh.com"
PATTERN2="hmac-sha2-512-etm@openssh.com"
PATTERN3="hmac-sha2-256-etm@openssh.com"
PATTERN4="hmac-sha1-etm@openssh.com"
PATTERN5="hmac-md5-etm@openssh.com"

for pattern in "$PATTERN1" "$PATTERN2" "$PATTERN3" "$PATTERN4" "$PATTERN5"; do
    if grep -i -r "$pattern" /etc/crypto-policies/back-ends/*; then
        echo "The WeakCiphers are still exist under /etc/crypto-policies/back-ends/*"
    else
        echo "The WeakCiphers are Missing successfully"
    fi
done


## Define the paths to the configuration files
#OPENSSH_CONFIG="/etc/crypto-policies/back-ends/openssh.config"
#OPENSSH_SERVER_CONFIG="/etc/crypto-policies/back-ends/opensshserver.config"
#
## Define the patterns to delete
#PATTERN1="chacha20-poly1305@openssh.com"
#PATTERN2="hmac-sha2-512-etm@openssh.com"
#PATTERN3="hmac-sha2-256-etm@openssh.com"
#PATTERN4="hmac-sha1-etm@openssh.com"
#PATTERN5="hmac-md5-etm@openssh.com"
#
## Function to delete pattern from file
#delete_pattern_from_file() {
#    local file=$1
#    local pattern=$2
#    sed -i "/$pattern/d" "$file"
#}
#
## Delete patterns from files
#for pattern in "$PATTERN1" "$PATTERN2" "$PATTERN3" "$PATTERN4" "$PATTERN5"; do
#    delete_pattern_from_file "$OPENSSH_CONFIG" "$pattern"
#    delete_pattern_from_file "$OPENSSH_SERVER_CONFIG" "$pattern"
#done
#
#echo "Patterns removed from configuration files."
