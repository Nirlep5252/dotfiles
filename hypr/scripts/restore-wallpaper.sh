#!/bin/bash

WALLPAPER=$(cat ~/.cache/wal/wal)
swww img ${WALLPAPER}\
  --transition-type wave\
  --transition-wave 20,20\
  --transition-fps 60\
  --transition-bezier 0.65,0,0.35,1\
  --transition-step 255\
  --transition-angle 225\
