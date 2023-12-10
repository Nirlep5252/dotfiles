#!/bin/bash

swww init

DIR="$HOME/Wallpapers"
PICS=($(ls $DIR | grep -E "jpg|png"))
RANDOMPICS=${PICS[$RANDOM % ${#PICS[@]}]}

swww img ${DIR}/${RANDOMPICS}\
  --transition-type grow\
  --transition-fps 60\
  --transition-duration 0.5\
  --transition-pos 0.810,0.972\
  --transition-bezier 0.65,0,0.35,1\
  --transition-step 255

wal -i ${DIR}/${RANDOMPICS}

pywalfox update
