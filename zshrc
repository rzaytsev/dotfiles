if [ -f $HOME/.zshrc.mac ]
then
    source $HOME/.zshrc.mac
else
man() {
    env \
    LESS_TERMCAP_mb=$'\e[1;31m' \
    LESS_TERMCAP_md=$'\e[1;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[1;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[1;32m' \
    man "$@"
    }

    ZSH=$HOME/.oh-my-zsh
    ZSH_CUSTOM=$HOME/.zsh-custom
    ZSH_THEME="secwall"
    DISABLE_AUTO_UPDATE="true"
    plugins=(colored-man git python tmux systemadmin sudo history history-substring-search colorize)

    source $ZSH/oh-my-zsh.sh

    setopt hist_ignore_space
    setopt hist_ignore_all_dups

    bindkey '^[[A'  up-line-or-search
    bindkey '^[[B'  down-line-or-search

    export EDITOR=vim

    alias ll='ls -lah'
fi
