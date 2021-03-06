#!/bin/sh

if [[ $1 == "mount" ]]; then
	lsblk -lo name,label,uuid,type,mountpoint 	\
	| grep -v "disk \| part /\|sdb[2-3]"		\
	| sed -e '1d' -e 's/part\s$//g' 			\
	| awk '{print $1 "\t" $2}' 					\
	| dmenu 									\
	| awk '{print $1}' 							\
	| xargs -r -I _ udisksctl mount -b /dev/_ 	\
	| xargs -r -I _ notify-send -t 2000 "USB" "_"
elif [[ $1 == "unmount" ]]; then
	lsblk -lo name,label,uuid,type,mountpoint 	\
	| grep "/run/media/$USER" 					\
	| sed -e 's/part\s.run.media.*$//g' 		\
	| awk '{print $1 " "$2}' 					\
	| dmenu 									\
	| awk '{print $1}' 							\
	| xargs -r -I _ udisksctl unmount -b /dev/_	\
	| xargs -r -I _ notify-send -t 2000 "USB" "_"
fi

