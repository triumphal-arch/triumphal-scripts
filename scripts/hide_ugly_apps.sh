#!/bin/bash

local_apps_dir=$HOME/.local/share/applications
mkdir -p $local_apps_dir

blacklist="\
avahi-discover \
bssh \
bvnc \
fish \
htop \
lftp \
lstopo \
nm-connection-editor \
qv4l2 \
qvidcap \
stoken-gui \
stoken-gui-small \
"

for app in $blacklist
do
    desktop_file=/usr/share/applications/$app.desktop
    if [ -e $desktop_file ]
    then
        hidden_desktop_file=$local_apps_dir/$app.desktop
        cp $desktop_file $hidden_desktop_file
        echo NoDisplay=true >> $hidden_desktop_file
    fi
done

# remove from user's autostart
rm -f $HOME/.config/autostart/hide_ugly_apps.desktop
