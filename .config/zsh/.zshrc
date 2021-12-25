# Created by newuser for 5.8

# Enable colors:
autoload -U colors && colors

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

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
bindkey -s '^r' 'ranger\n'

fd() {
	find $2 -iname "*$1*"
}
alias ls='exa --group-directories-first -l'
alias la='exa --group-directories-first -la'

alias ci3='$EDITOR $HOME/.config/i3/config'
alias cpb='$EDITOR $HOME/.config/polybar/config'
alias cpbm='$EDITOR $HOME/.config/polybar/modules'
alias czsh='$EDITOR $HOME/.config/zsh/.zshrc'
alias cnv='$EDITOR $HOME/.config/nvim/init.vim'

alias r='ranger'

alias dotfiles='/usr/bin/git --git-dir=$HOME/doc/dotfiles --work-tree=$HOME'

alias luamake=/home/nerdjp/dev/lua-language-server/3rd/luamake/luamake
alias clip='xclip -selection "clipboard"'

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

setopt auto_cd

alias cp='cp -i'
alias mv='mv -i'

alias dcp='pwd | xclip -selection clipboard'

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# ~/.zshrc
eval "$(starship init zsh)"
paleofetch
