!#/bin/sh
eval $(rofi -dmenu) | xargs -I {} notify-send "{}"
