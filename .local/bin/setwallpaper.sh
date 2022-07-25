#!/bin/sh

ln -sf $(readlink -f $1) ~/.config/wallpaper
feh --bg-fill --no-fehbg ~/.config/wallpaper
