#!/bin/sh

declare -A SOURCES

names=""
while read -r sink; do
	name="$(cut -d ' ' -f 2 <<< "${sink}")"
	names="${names}
${name}"
	SOURCES["$name"]="$(cut -d ' ' -f 1 <<< "${sink}")"
done <<< $(pactl list sinks short | cut -f 1,2 | sed 's/\s\?alsa.*\./ /')

CHOICE=$(tail -n +2 <<< ${names} | sort | dmenu -p "Choose audio output: " -i "$@")
[ -n "${CHOICE}" ] && pactl set-default-sink "${SOURCES[${CHOICE}]}"
