#!/usr/bin/env bash

CITY=$(awk -F= '/^\$CITY/ {gsub(/ /,"",$2); print $2}' ~/.config/hyprlock/hyprlock.conf)
COUNTRY=$(awk -F= '/^\$COUNTRY/ {gsub(/ /,"",$2); print $2}' ~/.config/hyprlock/hyprlock.conf)

# Fallbacks just in case
CITY=${CITY:-UnknownCity}
COUNTRY=${COUNTRY:-UnknownCountry}

# Fetch weather info
weather_info=$(curl -s --fail "https://wttr.in/$CITY?format=%c+%t" 2>/dev/null)

# Fallback if curl fails
if [[ -z "$weather_info" ]]; then
  weather_info="Weather info unavailable"
fi

echo "$weather_info"
