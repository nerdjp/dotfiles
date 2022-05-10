#!/bin/bash

if ! [ -v TODO_FILE ]; then TODO_FILE=~/.todo; fi

list() {
	grep "$*" $TODO_FILE
}

add() {
	echo "$*" >> $TODO_FILE
	sort -o $TODO_FILE $TODO_FILE
}

$@
