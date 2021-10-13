#!/bin/sh

bluetooth_print() {
	if bluetoothctl show | grep -q "Powered: no"; then
		echo "%{F#c0caf5}"
	else
		echo "%{F#7aa2f7}"
	fi
}

bluetooth_toggle() {
	if bluetoothctl show | grep -q "Powered: no"; then
		bluetoothctl -- power on
	else
		bluetoothctl -- power off
	fi
}

bluetooth_menu() {
	if bluetoothctl show | grep -q "Powered: no"; then
		bluetoothctl -- power on
		blueman-manager &
		bluetooth_print
	else
		blueman-manager &
	fi
}

case "$1" in
	--toggle)
		bluetooth_toggle
		bluetooth_print
		;;
	--menu)
		bluetooth_menu
		;;
	*)
		bluetooth_print
		;;
esac
