#!/bin/bash

MONITOR=$(xrandr | grep -w connected | cut -f '1' -d ' ')
BRIGHTNESS=$(xrandr --verbose | grep -m 1 -i brightness | cut -f2 -d ' ')

if [ "$1" = '+' ]; then
  NEWBRIGHT=$(echo "$BRIGHTNESS + 0.05" | bc)
  if [ "$(echo "$NEWBRIGHT > 1.0" | bc)" -eq 1 ]; then
    NEWBRIGHT='1.0'
  fi
elif [ "$1" = '-' ]; then
  NEWBRIGHT=$(echo "$BRIGHTNESS - 0.05" | bc)
  if [ "$(echo "$NEWBRIGHT < 0.0" | bc)" -eq 1 ]; then
    NEWBRIGHT='0.0'
  fi
fi

xrandr --output "$MONITOR" --brightness "$NEWBRIGHT"
echo "$NEWBRIGHT"
