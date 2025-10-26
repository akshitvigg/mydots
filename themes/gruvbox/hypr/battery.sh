#!/bin/bash

# Battery status loop for Hyprland + swaync
# Requires: acpi (sudo pacman -S acpi), libnotify (already installed usually)

BAT_PATH="/sys/class/power_supply/BAT0"
LOW=15
CRITICAL=5
FULL=100

while true; do
  if [[ -d "$BAT_PATH" ]]; then
    capacity=$(cat "$BAT_PATH/capacity")
    status=$(cat "$BAT_PATH/status")

    if [[ "$status" == "Charging" && $capacity -ge $FULL ]]; then
      notify-send -u normal "🔌 Battery Full" "You can unplug now."
      sleep 300 # only remind every 5 min
    elif [[ "$status" == "Discharging" && $capacity -le $LOW && $capacity -gt $CRITICAL ]]; then
      notify-send -u critical "⚠️ Battery Low" "Battery at ${capacity}%. Plug in!"
      sleep 120 # remind every 2 min
    elif [[ "$status" == "Discharging" && $capacity -le $CRITICAL ]]; then
      # Countdown before forced shutdown
      for i in {30..1}; do
        notify-send -u critical "🛑 Battery Critical" "Shutting down in $i sec!"
        sleep 1
        # cancel if user plugged in during countdown
        [[ "$(cat "$BAT_PATH/status")" == "Charging" ]] && break 2
      done
      systemctl poweroff
    fi
  fi
  sleep 30
done
