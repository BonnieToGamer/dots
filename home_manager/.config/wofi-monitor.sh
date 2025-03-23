#!/bin/bash

current_monitor=$(hyprctl activeworkspace | grep -oP 'on monitor \K[^:]+')
resolution=$(hyprctl monitors | grep -A 1 "Monitor $current_monitor" | grep -oP '\d+x\d+' | head -n 1)

# Split the resolution into width and height
width=$(echo "$resolution" | cut -d'x' -f1)
# height=$(echo "$resolution" | cut -d'x' -f2)

wofi_width=$1
wofi_height=$2
wofi_entries=$3

width_difference=$((width - wofi_width))

selected=$(echo -e $wofi_entries | wofi --width $wofi_width --height $wofi_height --dmenu --cache-file /dev/null --xoffset $width_difference --yoffset 0 | awk '{print tolower($2)}')
echo $selected