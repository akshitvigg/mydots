#!/bin/bash

# Get current volume %
volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{printf "%.0f\n", $1*100}')

# Get mute status
mute=$(wpctl get-mute @DEFAULT_AUDIO_SINK@)

if [ "$mute" = "true" ]; then
  icon="" # muted icon
  text="Muted"
else
  icon="" # speaker icon
  text="$volume%"
fi

# Send notification using swaync
swaync-client -t notification -i "$icon" -m "$text" -d 1000
