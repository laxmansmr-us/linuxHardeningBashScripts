#!/bin/bash

# 4.1.3.20 Ensure the audit configuration is immutable (Automated)

if grep -i -r "\-e 2" /etc/audit/rules.d/*; then

    echo " "
    echo "------------------------------------------------------------------------"
    echo "The Rules to Ensure the audit configuration is immutable have configured already, Nothing to do"

    # Check is reboot is required
    if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then printf "Reboot required to load rules\n"; fi


else

    echo " "
    echo "------------------------------------------------------------------------"
    echo "The Rules to Ensure the audit configuration is immutable have NOT configured, working on set it now"

    printf "
-e 2
" /etc/audit/rules.d/99-finalize.rules


    # Check previous command output
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "Ensure the audit configuration is imutable config has been set successfully"
    else
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to set the Ensure the audit configuration is imutable configs"
    fi
fi
