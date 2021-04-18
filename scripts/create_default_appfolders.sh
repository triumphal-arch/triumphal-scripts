#!/bin/bash

create_app_folder () {
    name=$1
    categories=$2
    echo creating app folder $name
    prev=$(gsettings get org.gnome.desktop.app-folders folder-children)
    if [[ ! $prev == '@as []' ]]
    then # not empty, needs comma separation
        maybe_comma=", "
    fi
    gsettings set org.gnome.desktop.app-folders folder-children "${prev:0:-1}$maybe_comma'$name']"
    gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/$name/ name "'$name'"
    gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/$name/ translate true
    gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/$name/ categories "[$categories]"
}

create_app_folder Utilities "'X-GNOME-Utilities'"
create_app_folder Sundry "'Utility'"

# remove from user's autostart
rm -f $HOME/.config/autostart/create_default_appfolders.desktop
