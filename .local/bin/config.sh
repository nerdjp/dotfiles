#!/bin/sh

FILES=$(cat ~/.local/share/bookmarks | fzf)

if [[ -n "$FILES" ]]; then
	#$EDITOR "$FILES"
	$EDITOR $(echo $FILES | sed 's#~#/home/nerdjp#')
fi
