#!/bin/sh

#Detect the name of the display in use
display=":$(/usr/bin/ls /tmp/.X11-unix/* | /usr/bin/sed 's#/tmp/.X11-unix/X##' | /usr/bin/head -n 1)"

#Detect the user using such display
user=$(/usr/bin/who | /usr/bin/grep '('$display')' | /usr/bin/awk '{print $1}' | /usr/bin/head -n 1)

#Detect the id of the user
uid=$(/usr/bin/id -u $user)

/usr/bin/sudo -u $user DISPLAY=$display DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$uid/bus /usr/bin/notify-send "USB Disconnected"
