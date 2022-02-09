#!/bin/sh

UPDATES=0
get_updates() { UPDATES=$(checkupdates | wc -l); }

while true; do
	get_updates

	if [ $UPDATES -gt 0 ]; then
		notify-send -u normal \
				"Packages Updates Available"\
				"There are new $UPDATES updates"
		while [ $UPDATES -gt 0 ]; do
			echo $UPDATES
			sleep 10
			get_updates
		done
	else
		echo $UPDATES
		sleep 21600
		get_updates
	fi
done
