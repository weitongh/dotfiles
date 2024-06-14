#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls="ls -lahAX --color=auto --group-directories-first"
alias grep="grep --color=auto"
alias vi="nvim"
alias sxiv="nsxiv -aq"

PS1="[\u@\h \W]\$ "

_set_prompt() {
    IFS=';' read -sdR -p $'\E[6n' ROW COL
    [ $COL -ne 1 ] && echo ''
}
PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }"_set_prompt"
