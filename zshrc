set -k
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export LC_CTYPE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export LANG=en_US.UTF-8

#export EDITOR="$(which emacsclient) -t"
export EDITOR="$(which vim)"
export CC=clang

export DISABLE_VENV_CD=1

export GOROOT=/usr/local/opt/go/libexec/
export GOPATH=~/dev/go

#LESSPIPE=`which src-hilite-lesspipe.sh`
#export LESSOPEN="| ${LESSPIPE} %s"
export LESSOPEN="|lesspipe.sh %s"
export LESS='-R'

unsetopt no_match

# ZSH_THEME="roman"
ZSH_THEME="robbyrussell"
DISABLE_AUTO_UPDATE=true


#FZF
FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
alias fzt="fzf-tmux"
FZF_COMPLETION_TRIGGER="@"

alias hist='history | grep'
alias lst='tree -L 2 $1'
alias get-vundle='git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle'
alias gmvault="~/src/gmvault/bin/gmvault"
alias nvi="knife node edit"
alias evi="knife environment edit"
alias vi="/usr/local/bin/vim"
alias e="$(which emacsclient) -nw"
# alias e="$(which vim)"
alias :e="$(which vim)"
alias :q="exit"
#alias less=vless
alias ptp='python3 -m ptpython'
alias ptp2='python -m ptpython'
alias sed=gsed
alias myip="curl -s http://checkip.amazonaws.com"
alias scheme='rlwrap -D 2 -m " \ " /usr/local/bin/scheme'
alias racket='rlwrap -D 2 -m " \ " /usr/local/bin/racket'
alias search='mdfind -onlyin .'
alias filemerge="open /Applications/Xcode.app/Contents/Applications/FileMerge.app/"
alias get_ssh_keys='for k in $(echo id_rsa personal_rsa bitbucket github devops_vpc_infra.pem); do ssh-add -K /Users/rzaytsev/.ssh/$k; done'

alias -s go="go run"
alias -s py="python3"



alias note='vim ~/notes/$(date +%Y-%m-%d).md -c "execute \"normal! Go$(date +%T)\<CR>========\<CR>\" | w! | startinsert"'
alias dbox='docker exec -t -i dropbox dropbox'

alias netstat="lsof -i -n -P | grep 'TCP\|UDP'| grep ESTABLISHED"

function dict(){
    open "dict://$1"
}

function get_aws_profile(){
    if [[ ! -z "$AWS_PROFILE" ]] && [[ "$AWS_PROFILE" != 'default' ]]; then printf "AWS:$AWS_PROFILE "; fi
}

functions run_tunnel(){
    ssh -f -N -D 7070 scw
}

alias gam='printf "using $OAUTHFILE\n\n"; python2 ~/src/gam/gam.py'
alias gam-exante='export OAUTHFILE=exante-oauth2.txt; gam'
alias gam-xcfd='export OAUTHFILE=xcfd-oauth2.txt; gam'
alias gam-insider='export OAUTHFILE=insider-oauth2.txt; gam'
alias gam-help='open https://github.com/jay0lee/GAM/wiki'

alias skype2="rm -f ~/Library/Application\ Support/Skype/Skype.pid; open -na /Applications/Skype-support.app/"
alias 'brew-up'='brew update && brew upgrade && brew cleanup -s --force'

alias weather="curl http://wttr.in/moscow"
alias moon="curl wttr.in/Moon"

alias torrent-move="find ~/Downloads -type f -name '*.torrent' -exec mv {} ~/Dropbox/torrents \;"

alias todo="vim ~/work/todo.md"

alias gs="tig status"

func today() {
/usr/local/bin/icalBuddy -n -npn -nc -iep "title,datetime" -ps "|=|" -po "datetime,title" -tf "=%H.%M" -df "" -eed eventsToday+ | awk -F "=" '{print substr($2,0,5)" : "$3}'
}
func next() {
/usr/local/bin/icalBuddy -n -npn -nc -iep "title,datetime" -ps "|=|" -po "datetime,title" \
  -tf "=%H.%M" -df "" -eed eventsToday+ | head -n 1 | awk -F "=" '{print substr($2,0,5)" : "$3}'
}

function tz(){
for location in $(cat ~/.tz_locations); do printf $fg[green]; printf $location$fg[blue] | awk -F  "/" '{printf $2 ": " }' | tr '_' ' '; TZ="$location" date; done
}


func nnn(){
    vim $(fzf --preview="cat {}" --preview-window=right:70%:wrap)
}

finction top_cmd(){
    history | awk '{a[$4]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head
}


HELPERS_MISA_REGION="eu-central-1"
source ~/work/helpers/all.sh

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


function lt() { ls -ltrsa "$@" | tail; }
function psgrep() { ps aux | grep -v grep | grep "$@" -i --color=auto; }
function fname() { find . -iname "*$@*"; }
function remove_lines_from() { grep -F -x -v -f $2 $1; }

fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --preview "echo {} | grep -o '[a-f0-9]\{7\}' | head -1 | xargs -I % sh -c 'git show --color=always %'" \
             --bind "enter:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

JIRA_URL="https://jira.aligntech.com"
JIRA_NAME="rzaytsev"

plugins=(git osx pip fasd bgnotify terraform docker golang)
source "$ZSH/oh-my-zsh.sh"
# vagrant knife colorize
#

# source ~/.oh-my-zsh/plugins/systemadmin/systemadmin.zsh

export WORKON_HOME=$HOME/.envs
export PROJECT_HOME=$HOME/src
#source /usr/local/bin/virtualenvwrapper.sh

#export EC2_HOME=/usr/local/ec2/$(ls /usr/local/ec2)
export JAVA_HOME=$(/usr/libexec/java_home)
export CHEF_HOME=/opt/chefdk/bin/

# User configuration
export LS_COLORS="di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:"
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Library/Frameworks/Python.framework/Versions/2.7/bin/:$EC2_HOME/bin:/usr/local/packer:$CHEF_HOME:$GOROOT/bin:$GOPATH/bin:/Users/rzaytsev/.chefdk/gem/ruby/2.3.0/bin:$HOME/.cargo/bin:/Users/rzaytsev/Library/Python/3.7/bin/"

export PATH="$PATH:/usr/local/opt/coreutils/bin"
export PATH="$PATH:$GOPATH/bin/"

export PYTHONPATH=$PYTHONPATH:/Users/roman/exante/support-utils/libs:/Users/roman/exante/infrastructure-bootstrap/policy

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z


# Start/attach to tmux on remote host
sss() {
    if [[ "$2" == "" ]]
    then
        echo "ssh & tmux on $1"
        cmd='tmux has-session -t $(whoami) && ln -sf $SSH_AUTH_SOCK $HOME/.ssh-auth-sock; env SSH_AUTH_SOCK=$HOME/.ssh-auth-sock tmux -2 attach -t $(whoami) || ln -sf $SSH_AUTH_SOCK $HOME/.ssh-auth-sock; env SSH_AUTH_SOCK=$HOME/.ssh-auth-sock tmux -2 new-session -s $(whoami) "sudo -s"'
        ssh -A "$1" -t "$cmd"
    else
        echo 'there are other args: $*. using plain ssh'
        ssh $*
    fi
}
compdef sss=ssh

sshs(){
    [[ $# -gt 1 ]] && ssh $* || ssh -A "$1" -t "sudo -s"
}
compdef sshs=ssh

# exante: get xen host by guest's name
# vm-host() {
#     USAGE="Usage: vm-host VM-hostname"
#     if [ -z "$1" ]; then
#         echo $USAGE
#         return
#     fi
#     dig +short -x $(ipcalc $(dig A +short $1)/23 | grep HostMin | awk '{print $2}'|sed -r 's/1$/2/') @marcus.ghcg.com | tee >(pbcopy)
# }
# compdef vm-host=ssh

# function promptFunc()
# {
#   # right before prompting for the next command, save the previous
#   # command in a file.
#   echo "$(date +%Y-%m-%d--%H-%M-%S) $PWD/ $(fc -l -1 | awk '{first = $1; $1 = ""; print $0; }')" >> ~/.full_history
# }

# PROMPT_COMMAND=promptFunc
# precmd() { eval "$PROMPT_COMMAND" }

# function histgrep {
#   cat ~/.full_history | grep "$@" | tail
# }

alias pwgen='pwgen -N 1 -B'

function ssh-copy-dotfiles(){
    ssh $1 "git clone --recursive https://github.com/rzaytsev/dotfiles .dotfiles; cd .dotfiles; make install; cd; vim -c PluginInstall -c qa!"
}

function notify() {
     terminal-notifier -activate com.googlecode.iterm2 -title "iTerm" -subtitle "A message from your shell:" -message "$@"
}

function add_to_top(){
    # FIX: check if file exists and $2 exists
	content=$(cat $1) # no cat abuse this time
	echo -en "$2\n$content" >$1
}

alias complete='echo $* > /dev/null'
#source ~/ops/infrastructure-misc/bash-functions.sh


function my-ips(){
    ifconfig | grep 'inet ' | grep -v 127.0.0.1 |awk '{print $2}'
    what-ip
}

alias ls_tree="ls -R | grep ':' | sed -e 's/://' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"

# function share-dotfiles(){
#   tar czf ~/src/dotfiles/dotfiles.tgz ~/src/dotfiles/.*
#   echo "curl -#L http://$(myip):8888/dotfiles.tgz | tar -xvzC . --strip-components 1 && echo done" >> ~/src/dotfiles/dotfiles
#   cd ~/src/dotfiles ; python -m SimpleHTTPServer 8888
#   rm ~/src/dotfiles/dotfiles.tgz
#

# function subscribe_list(){
#     for L in $(cat $1); do (echo $L; subscribe.py $L); done;
# }

#alias update_funds="ssh internal-gateways.prod.ghcg.com /usr/local/exante-utils/data_sheet_import.sh"

# finction update_hosts_completions(){
# zstyle ':completion:*:(ssh|scp|sftp|rsync|ping|host|mosh|traceroute|mtr|vm-host|chef-restart|graph):*' hosts $(cat ~/apd/hosts)
# }

#update_hosts_completions

# function update_apd_hosts(){
#     echo '' > ~/apd/hosts
#     aws --profile=dev route53 list-resource-record-sets --hosted-zone-id Z2KPF3BZ5F2KFH --output text | grep '\tA' | awk '{print $2}' | sed 's/.$//' | grep 'apda.co' | tr '\n' ' ' >> ~/apd/hosts # dev
#     aws --profile=dev route53 list-resource-record-sets --hosted-zone-id Z3TMF296I5UY5N --output text | grep '\tA' | awk '{print $2}' | sed 's/.$//' |  grep 'apda.co'| tr '\n' ' ' >> ~/apd/hosts # stage
#     aws --profile=prod route53 list-resource-record-sets --hosted-zone-id Z1YN4FVVPGC2RF --output text | grep '\tA' | awk '{print $2}' | sed 's/.$//' | grep 'apda.co' | tr '\n' ' ' >> ~/apd/hosts  # prod
#     update_hosts_completions
# }

compdef chef-restart=ssh
compdef vm-host=ssh

#You may need to manually set your language environment

#Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

function notes(){
    cd ~/notes
    vim +Files
}
alias n=notes

function clip { [ -t 0 ] && pbpaste || pbcopy;}

#if which tmux 2>&1 >/dev/null; then
#    if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
#        tmux attach -t hack || tmux new -s hack; exit
#    fi
#fi

function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# add awscli completion
source /usr/local/opt/awscli/libexec/bin/aws_zsh_completer.sh


export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
source ~/.align_aliases

# _knife-block_ps1 () {
# 	#Preserve exit
# 	local exit=$?

# 	#Get contents of symlink
# 	knifesymlink="$(readlink ${HOME}/.chef/knife.rb)"

# 	#If not a symlink or some other error then do nothing
# 	[ -z $knifesymlink ] && return $exit

# 	#Extract current knife
# 	[ -n "`$SHELL -c 'echo $ZSH_VERSION'`" ] && setopt KSH_ARRAYS BASH_REMATCH
# 	[[ $knifesymlink =~ ${HOME}/\.chef/knife-(.*)\.rb ]]
# 	currentknife=${BASH_REMATCH[1]}

# 	echo $currentknife
# 	return $exit
# }

#PROMPT="🔪 $(_knife-block_ps1)|"$PROMPT

# if [ -f ~/.chef/knife.rb ]; then
#   WHICH_KNIFE=$(command readlink ~/.chef/knife.rb | tr '/' ' ' |tr 'knife-' ' '| awk '{print $NF}' |tr '.rb' ' ' )
#   PROMPT="🔪 $WHICH_KNIFE|"$PROMPT
# fi

# alias l="pwd; echo '..'; ls -F | sort | cat"

alias getcm="curl -s 'http://whatthecommit.com/index.txt'"

alias ll="exa -l --git"
alias la="exa -la --git"
alias l="exa -1"


# added by Pew
source $(pew shell_config)

# ### PROCESS
# # mnemonic: [K]ill [P]rocess
# # show output of "ps -ef", use [tab] to select one or multiple entries
# # press [enter] to kill selected processes and go back to the process list.
# # or press [escape] to go back to the process list. Press [escape] twice to exit completely.

function  kp() {
    local pid=$(ps -ef | sed 1d | eval "fzf ${FZF_DEFAULT_OPTS} -m --header='[kill:process]'" | awk '{print $2}')
    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
        kp
    fi
}

### PATH
# mnemonic: [F]ind [P]ath
# list directories in $PATH, press [enter] on an entry to list the executables inside.
# press [escape] to go back to directory listing, [escape] twice to exit completely
function fp() {
    local loc=$(echo $PATH | sed -e $'s/:/\\\n/g' | eval "fzf ${FZF_DEFAULT_OPTS} --header='[find:path]'")
    if [[ -d $loc ]]; then
        echo "$(rg --files $loc | rev | cut -d"/" -f1 | rev)" | eval "fzf ${FZF_DEFAULT_OPTS} --header='[find:exe] => ${loc}' >/dev/null"
        fp
    fi
}



