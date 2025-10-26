#!/bin/bash

# Get the current Spotify song only
song_info=$(playerctl --player=spotify metadata --format '  - {{title}}' 2>/dev/null)

# Check if a song is playing
if [[ -z "$song_info" ]]; then
  echo "" # Or put "No song playing"
else
  echo "$song_info"
fi
