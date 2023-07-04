#!/usr/bin/env bash

getPrecentage=$(TARGET_PATH="."
top -l 1 | grep -E "^CPU" | grep -Eo '[^[:space:]]+%' | head -1 | sed 's/3\(.\)$/\1/' | cut -d "." -f1)

precentage=$(echo $getPrecentage)

sketchybar --set $NAME icon="" label="$precentage%"
