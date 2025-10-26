#!/bin/bash
choice=$(echo -e "Shutdown\nReboot\nSuspend\nHibernate" | wofi --dmenu --prompt "Power")
case $choice in
Shutdown) systemctl poweroff ;;
Reboot) systemctl reboot ;;
Suspend) systemctl suspend ;;
Hibernate) systemctl hibernate ;;
esac
