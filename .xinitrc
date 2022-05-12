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

exec i3

#hdmi-xrandr && feh --no-fehbg --bg-fill .config/wallpaper &
#unclutter &
#/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
#xmouserpasteblock &

#discord &

#DWM-LOCK=${XDG_RUNTIME_DIR}/dwm-lock
#touch ${DWM-LOCK}

#while [ -e ${DWM-LOCK} ]; do
	#dwm >/dev/null 2>&1
#done
