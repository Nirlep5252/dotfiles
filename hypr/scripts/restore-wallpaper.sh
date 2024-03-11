#!/bin/bash

hyprpaper

WALLPAPER=$(cat "/home/nirlep/.cache/wallpaper.txt")

hyprctl hyprpaper preload "$WALLPAPER"
hyprctl hyprpaper wallpaper "eDP-1,$WALLPAPER"

