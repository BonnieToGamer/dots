#!/usr/bin/env zx

const monitors = await $`hyprctl monitors -j`.json();
const current_monitor = monitors.find((monitor) => monitor["focused"]);
const width = current_monitor["width"];

const args = process.argv.slice(3);
const wofi_width = args[0];
const wofi_height = args[1];
const wofi_entries = args[2];

const total_width = width - wofi_width;

const selected = await $`echo -e ${wofi_entries} | wofi --width ${wofi_width} --height ${wofi_height} --dmenu --cache-file /dev/null --xoffset ${total_width} --yoffset 0 | awk '{print tolower($2)}'`;
echo(selected);