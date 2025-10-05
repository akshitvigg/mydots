#!/bin/bash

# Get current brightness %
brightness=$(brightnessctl g)
max=$(brightnessctl m)
percent=$((brightness * 100 / max))

# Icon
icon="󰃟"

# Send notification using swaync
swaync-client -t notification -i "$icon" -m "$percent%" -d 1000
