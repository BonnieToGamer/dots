#!/bin/bash

ON='{"text": "", "tooltip": "Toggle Speaker", "class": "on", "alt": "on"}'
OFF='{"text": "", "tooltip": "Toggle Speaker", "class": "off", "alt": "off"}'

STATE_FILE="$HOME/.config/speaker_state"
if [ ! -f "$STATE_FILE" ]; then
    echo $OFF > "$STATE_FILE"
fi

CURRENT_STATE=$(cat "$STATE_FILE")
sinks=$(wpctl status | sed -n '/^ ├─ Sinks:/,/^ ├─ Sources:/p')

if [ "$CURRENT_STATE" == "$OFF" ]; then
    speakers=$(echo "$sinks" | grep "Starship/Matisse HD Audio Controller Analog Stereo" | awk '{print $2}' | tr -d '.')
    echo "$ON" > "$STATE_FILE"
    wpctl set-default $speakers
else
    headphones=$(echo "$sinks" | grep "Razer BlackShark V2 Pro Analog Stereo" | awk '{print $2}' | tr -d '.')
    echo "$OFF" > "$STATE_FILE"
    wpctl set-default $headphones
fi