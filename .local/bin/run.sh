#!/bin/bash
#xhost +local:james
Xephyr :1 -ac -br -noreset -screen 1920x1080 &
sleep 1
while true; do
	DISPLAY=:1 $1
	sleep 0.5
done
