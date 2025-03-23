#!/bin/bash

entries=" Logout\n Suspend\n󰑓 Reboot\n󰐥 Shutdown"

selected=$($HOME/.config/wofi-monitor.sh 250 100 "$entries")

case $selected in
  logout)
    hyprctl dispatch exit;;
  suspend)
    exec systemctl suspend;;
  reboot)
    exec systemctl reboot;;
  shutdown)
    exec systemctl poweroff -i;;
esac