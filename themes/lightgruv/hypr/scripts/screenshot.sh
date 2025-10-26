#!/bin/bash

# Directory to save screenshots
DIR="$HOME/Pictures"
mkdir -p "$DIR"

# If argument is "full" → full screen
if [ "$1" == "full" ]; then
    grim "$DIR/screenshot_$(date +%F_%T).png"
else
    # Else → region select
    grim -g "$(slurp)" "$DIR/screenshot_$(date +%F_%T).png"
fi
