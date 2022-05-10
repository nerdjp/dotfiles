#!/bin/bash

# Terminate already running bar instances
killall -9 -q polybar
killall -9 -q tiramisu

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
polybar top & disown
polybar bottom & disown
polybar alt-top & disown
polybar alt-bottom & disown
sleep 5
tiramisu-piped.sh & disown
