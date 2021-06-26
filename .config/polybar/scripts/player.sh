#!/bin/bash

# see man zscroll for documentation of the following parameters
zscroll -l 20 \
        --delay 0.0 \
        --scroll-padding "  " \
        --match-command "playerctl staus" \
        --match-text "Playing" "--scroll 1" \
        --match-text "Paused" "--scroll 0" \
        --update-check true "playerctl --player=spotifyd metadata --format \"{{ title }} - {{ artist }}\"" &

wait
