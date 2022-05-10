#!/bin/bash

if [[ $# -eq 3 && -e $1 && -n $2 && $3 -gt 0 ]]; then
	echo "Adding the text $2 to $1 at size $3"
	convert "$1" -pointsize "$3" -coalesce -draw "gravity south fill black text 0,12 '$2' fill white text 1,11 '$2'" -layers Optimize output-"${1}"
fi
