#!/bin/bash

swww query
if [ $? -eq 1 ]; then
  swww-daemon --format xrgb &

  swww img ~/.config/backgrounds/init.png \
    --transition-type "none" \
    --transition-duration 0
fi
