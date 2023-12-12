#!/bin/bash

swww init

DIR="$HOME/Wallpapers"
PICS=($(ls $DIR | grep -E "jpg|png"))
RANDOMPICS=${PICS[$RANDOM % ${#PICS[@]}]}

wal -i ${DIR}/${RANDOMPICS}
~/.config/hypr/scripts/restore-wallpaper.sh
pywalfox update
~/.config/mako/update-theme.sh
