#!/bin/sh

dir=${XDG_RUNTIME_DIR}

# Creating the pipes
pipename="${dir}/polytiramisu-${$}"
mkfifo "${pipename}"

function cleanup() {
	rm "${pipename}"
}

trap cleanup EXIT

# How many seconds notification is displayed:
display_duration=10.0

# Maximum number of characters:
char_limit=75

# Replace app names with nerd font logos
use_nerd_font="false"

# Start a new tiramisu process:
while read -r line; do
	if [ "${#line}" -gt "$char_limit" ]; then
		line="$(echo "$line" | cut -c1-$((char_limit-1)))…"
	fi
	echo "$line"
	sleep "$display_duration"
	echo " "
done < "$pipename"
