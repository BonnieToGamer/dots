#!/usr/bin/env zx

const entries = " Logout\n Suspend\n󰑓 Reboot\n󰐥 Shutdown";
const selected = await $`$HOME/.config/wofi-monitor.mjs 250 100 ${entries}`.text();

if (selected.includes("logout"))
    await $`hyprctl dispatch exit`;
else if (selected.includes("suspend"))
    await $`exec systemctl suspend`;
else if (selected.includes("reboot"))
    await $`exec systemctl reboot`;
else if (selected.includes("shutdown"))
    await $`exec systemctl poweroff -i`;
