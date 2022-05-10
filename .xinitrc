#!/bin/sh

userresources=$HOME/.config/X11/xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
kbconf=$HOME/.config/config.xkb

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

if [ -f "$kbconf" ]; then
	xkbcomp "$kbconf" $DISPLAY
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

while true; do
	xsetroot -name "$( date +"%F %R" )"
	sleep 1m
done &

hdmi-xrandr && feh --no-fehbg --bg-fill .config/wallpaper &
discord &
unclutter &

DWM_LOCK="${XDG_RUNTIME_DIR}/.dwm-lock"
touch "${DWM_LOCK}"

while [ -e "$DWM_LOCK" ]; do
	dwm >/dev/null 2>&1
done
