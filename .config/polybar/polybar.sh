#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
MONITOR=eDP1 polybar top & disown
MONITOR=eDP1 TRAYPOS=center polybar bottom & disown
# MONITOR=HDMI-1-0 polybar top & disown
# MONITOR=HDMI-1-0 polybar bottom & disown
