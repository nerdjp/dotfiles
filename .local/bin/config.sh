#!/bin/sh

SEL=$(fzf < ~/.local/share/bookmarks | sed "s#~#${HOME}#")

if [ -n "$SEL" ]; then
	[ -d "$SEL" ] && pushd ${SEL}
	[ -f "$SEL" ] && pushd ${SEL%/*} && $EDITOR $SEL && popd
fi
