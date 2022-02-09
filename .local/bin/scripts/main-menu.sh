#!/bin/sh

if [[ $ROFI_RETV = 0 ]]; then
	echo -en "\0prompt\x1f\n"
	echo -en "\0no-custom\x1ftrue\n"

	echo -en "Launch Apps\0icon\x1flaunch\n"
	echo -en "Mount Android Phone\n"
	echo -en "Mount USB device\n"
	echo -en "Unmount Android Phone\n"
	echo -en "Unmount USB device\n"
	echo -en "Lock Screen\n"
	echo -en "Logout i3wm\n"
	echo -en "Restart PC\n"
	echo -en "Poweroff PC"
fi 

case "$@" in
	"Launch Apps")
		rofi -modi drun,run -show drun
		;;
	"Mount Android Phone")
		aft-mtp-mount ~/mount/phone
		;;
	"Mount USB device")
		mount-script mount
		;;
	"Unmount Android Phone")
		umount ~/mount/phone
		;;
	"Unmount USB device")
		mount-script unmount
		;;
	"Lock Screen")
		dm-tool lock
		;;
	"Logout i3wm")
		i3-msg exit
		;;
	"Restart PC")
		reboot
		;;
	"Poweroff PC")
		poweroff
		;;
	*)
		exit 0
		;;
esac
