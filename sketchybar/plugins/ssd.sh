#!/usr/bin/env sh

TOPPROC=$(df -h "/" | awk 'NR==2{print $5}' | cut -c 1-4)
sketchybar --set $NAME icon="" label="$TOPPROC"
