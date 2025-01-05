#! /bin/sh

chosen=$(printf "󰍃 Log Out\n  Suspend\n󰜉 Restart\n  Shutdown" | rofi -dmenu -i -theme-str '@import "/home/zeyten/.config/rofi/powermenu.rasi"')	

case "$chosen" in
 	"󰍃 Log Out") i3-msg exit ;;
	"  Suspend") i3lock-fancy ;;
	"󰜉 Restart") systemctl reboot ;;
	"  Shutdown") systemctl poweroff ;;
	*) exit 1 ;;
esac
