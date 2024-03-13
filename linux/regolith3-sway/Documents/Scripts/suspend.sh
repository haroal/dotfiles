#!/usr/bin/env bash

gtklock --background $(trawlcat regolith.lockscreen.wallpaper.file /dev/null) &
sleep 1
systemctl suspend
