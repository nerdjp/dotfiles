#!/bin/sh
DIR=$(pwd)
if [[ -n "$1" ]]; then
	cd $1
fi 

FILES=$(fzf -m --preview='cat {}')

if [[ -n "$FILES" ]]; then
	$EDITOR "$FILES"
fi
cd $DIR
