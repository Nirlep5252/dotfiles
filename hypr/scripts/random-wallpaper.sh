#!/bin/bash

hyprpaper

WALLPAPER="$(find ~/Wallpapers -type f -not -name "*.gif" | shuf -n 1)"
echo "INFO: Setting wallpaper \"$WALLPAPER\""

echo "$WALLPAPER" > "/home/nirlep/.cache/wallpaper.txt"

hyprctl hyprpaper preload "$WALLPAPER"
hyprctl hyprpaper wallpaper "eDP-1,$WALLPAPER"

