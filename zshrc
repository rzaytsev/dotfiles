if [ -f $HOME/.zshrc.mac ]
then
    source $HOME/.zshrc.mac
else

    ZSH=$HOME/.oh-my-zsh
    ZSH_THEME="example"
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
