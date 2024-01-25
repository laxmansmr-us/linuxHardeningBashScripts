#!/bin/bash

# 1.8.5 Ensure automatic mounting of removable media is disabled (Automated)

if [ "gsettings get org.gnome.desktop.media-handling automount" == "false" ]; then
    echo " "
    echo "------------------------------------------------------------------------"
    echo "The auto mount of removable media is enabled. Workin on disbaling it now"

    printf "[org/gnome/desktop/media-handling]\nautomount=false\nautomount-open=false"

    dconf update
    if [ $? -eq 0 ]; then
        echo " "
        echo "------------------------------------------------------------------------"
        echo "The auto mount of removable media has been disabled successfully"
    else    
        echo " "
        echo "------------------------------------------------------------------------"
        echo "failed to disable The auto mount of removable media"
    fi
else
    echo " "
    echo "------------------------------------------------------------------------"
    echo "The auto mount of removable media has been disbaled already"
fi
