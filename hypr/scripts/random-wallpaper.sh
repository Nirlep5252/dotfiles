#!/bin/bash

swww init

DIR="$HOME/Wallpapers"
PICS=($(ls $DIR | grep -E "jpg|png"))
RANDOMPICS=${PICS[$RANDOM % ${#PICS[@]}]}

if [[ -z "$1" ]]; then
  WALL_PATH=${DIR}/${RANDOMPICS}
else
  WALL_PATH=$1
fi

echo $WALL_PATH
wal -i $WALL_PATH
~/.config/hypr/scripts/restore-wallpaper.sh
pywalfox update
~/.config/mako/update-theme.sh
