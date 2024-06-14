#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export HISTFILE="$XDG_STATE_HOME/bash/history"
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"

export EDITOR="nvim"
export https_proxy="http://127.0.0.1:7890"
export http_proxy="http://127.0.0.1:7890"
export all_proxy="socks5://127.0.0.1:7890"


if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
    exec startx
fi
