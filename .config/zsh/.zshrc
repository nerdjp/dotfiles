# Created by newuser for 5.8

# Enable colors:
autoload -U colors && colors

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
HISTCONTROL=ereasedups

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char


# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Use ranger to switch directories and bind it to ctrl-o
ranger_cd() {
	temp_file="$(mktemp -t "ranger_cd.XXXXXXXXXX")"
	ranger --choosedir="$temp_file" -- "${@:-$PWD}"
	if chosen_dir="$(cat -- "$temp_file")" && [ -n "$chosen_dir" ] && [ "$chosen_dir" != "$PWD" ]; then
		cd -- "$chosen_dir"
	fi
	rm -f -- "$temp_file"
}
bindkey -s '^o' 'ranger_cd\n'
ranger_pushd() {
	temp_file="$(mktemp -t "ranger_cd.XXXXXXXXXX")"
	ranger --choosedir="$temp_file" -- "${@:-$PWD}"
	if chosen_dir="$(cat -- "$temp_file")" && [ -n "$chosen_dir" ] && [ "$chosen_dir" != "$PWD" ]; then
		pushd -- "$chosen_dir"
	fi
	rm -f -- "$temp_file"
}
bindkey -s '^O' 'ranger_pushd\n'
bindkey -s '^r' 'ranger\n'
bindkey -s '^n' 'setsid kitty -d $(pwd)\n'

bindkey -s '^z' 'bg && disown\n'

mkcd() {
	mkdir $1
	cd $1
}

retry() {
	local SLPT=5
	[ "$1" = "-t" ] && SLPT="$2" && shift 2
	while true; do
		$@ && break
		sleep "$SLPT"
	done
}

alias test_internet='retry ping google.com -c 1'

#alias ls='exa --group-directories-first -l'
#alias la='exa --group-directories-first -la'
alias ls='ls --group-directories-first --color=auto'
alias ll='ls -la --group-directories-first --color=auto'
alias la='ls -a --group-directories-first --color=auto'

LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=00:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.avif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:*~=00;90:*#=00;90:*.bak=00;90:*.old=00;90:*.orig=00;90:*.part=00;90:*.rej=00;90:*.swp=00;90:*.tmp=00;90:*.dpkg-dist=00;90:*.dpkg-old=00;90:*.ucf-dist=00;90:*.ucf-new=00;90:*.ucf-old=00;90:*.rpmnew=00;90:*.rpmorig=00;90:*.rpmsave=00;90:';
export LS_COLORS

alias less='less -R'

alias ci3='$EDITOR $HOME/.config/i3/config'
alias cpb='$EDITOR $HOME/.config/polybar/config.ini'
alias cpbm='$EDITOR $HOME/.config/polybar/modules.ini'
alias czsh='$EDITOR $HOME/.config/zsh/.zshrc'
alias cnv='$EDITOR $HOME/.config/nvim/init.vim'

alias r='ranger'

alias s='swallow'

alias dotfiles='/usr/bin/git --git-dir=$HOME/doc/dotfiles --work-tree=$HOME'

alias luamake=/home/nerdjp/dev/lua-language-server/3rd/luamake/luamake
alias clip='xclip -selection "clipboard"'

alias e='edit.sh'
alias c='config.sh'

pls() {
	sudo !!
}

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

setopt auto_cd

alias cp='cp -i'
alias mv='mv -i'

alias dcp='pwd | xclip -selection clipboard'

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

alias gs='git status'
alias gb='git branch'
alias gc='git checkout'
alias gp='git pull'

function smv() {
	[[ -n $1 ]] && mv $(\ls | fzf -m) $1
}

function gbc() {
	git branch $@ && git checkout $@
}

ZSH_AUTOSUGGEST_STRATEGY=(history completion)

alias ffmpeg='ffmpeg -hide_banner'
alias ffprobe='ffprobe -hide_banner'
alias iv='nsxiv'
alias grep='grep --color=auto'

# make kernel
# sync
# update
# myip
# open ports

#eval "$(starship init zsh)"
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats ' %b'

preexec_timer() { SECONDS=0 }
preexec_functions+=( preexec_timer )

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
PROMPT='%F{magenta}%n@%m%f %F{blue}%1~%f %(?,[,%F{red}[%f) '
RPROMPT=' %(?,],%F{red}]%f) %F{cyan}${vcs_info_msg_0_}%f'
#%1(S,took $(format-time $SECONDS),)'
#%F{magenta}%D{%I:%m %p}%f'

#paleofetch
