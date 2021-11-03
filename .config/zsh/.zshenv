#!/bin/zsh

export XDG_DATA_HOME="$HOME"/.local/share
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CACHE_HOME="$HOME"/.cache

export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="kitty"
export BROWSER="firefox"

export QT_QPA_PLATFORMTHEME="gtk2"
export PATH="$PATH:$HOME/.scripts:$HOME/.local/bin"
export RANGER_DEVICONS_SEPARATOR="  "

export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export WINEPREFIX="$XDG_DATA_HOME"/wineprefixes/default
export ANDROID_SDK_ROOT="$XDG_DATA_HOME"/android

export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export GTK_RC_FILES="$XDG_CONFIG_HOME"/gtk-1.0/gtkrc
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc

export USERXSESSION="$XDG_CACHE_HOME/X11/xsession"
export USERXSESSIONRC="$XDG_CACHE_HOME/X11/xsessionrc"
export ALTUSERXSESSION="$XDG_CACHE_HOME/X11/Xsession"

export WLR_DRM_NO_MODIFIERS=1
export LESSHISTFILE=-

[[ -f ~/.config/X11/xresources.tokyonight ]] && xrdb -load ~/.config/X11/xresources.tokyonight
