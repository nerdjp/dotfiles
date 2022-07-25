#!/bin/sh
pkill -f "ffmpeg.*vid/recording" && exit # If there's already a ffmpeg running

SELECTION=$(slop -l -c 0.3,0.3,0.3,0.5)
SIZE=$(echo "$SELECTION" | cut -d'+' -f1)
OFFSET=$(echo "$SELECTION" | cut -d'+' -f2,3)

ffmpeg -video_size "${SIZE}" -framerate 30 -f x11grab -i ${DISPLAY}+${OFFSET//\+/,} "${HOME}/vid/recording/$(date '+%F-%H-%M-%S').mp4" &>/dev/null &
