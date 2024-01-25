#!/bin/bash

# CVE-2023-48795 | https://alas.aws.amazon.com/cve/html/CVE-2023-48795.html

if grep -i "Amazon linux" /etc/os-release; then
    echo " "
    echo "---------------------------------------"
    echo "The Machine OS is Amazon Linux, Will handel the subpolicy values and OpenSSH (CVE-2023-48795) by updating the OpenSSH Package"

    yum update openssh >> /var/log/amazon/ssm/documents/hardening.log

else    
    CONTINUE=YES
fi