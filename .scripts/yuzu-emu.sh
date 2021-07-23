#!/bin/sh

pgrep yuzu && killall -9 yuzu

prime-run /home/nerdjp/games/roms/nsw/yuzu-emu.AppImage
