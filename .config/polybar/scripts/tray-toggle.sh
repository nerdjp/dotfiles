#!/bin/sh

tray_print() {
	if pgrep -f "polybar tray"; then
		echo ""
	else
		echo ""
	fi
}

tray_toggle() {
	traybar=$(pgrep -f "polybar tray")
	if [[ -z ${traybar} ]]; then
		polybar tray & disown
	else
		kill ${traybar}
	fi
}

case "$1" in
	--toggle)
		tray_toggle
		tray_print
		;;
	*)
		tray_print
		;;
esac
