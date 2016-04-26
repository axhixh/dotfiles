#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# shell variables
export PAGER=less
export EDITOR=vim
export HISTSIZE=5000
export HISTFILESIZE=1000
export HISTCONTROL=ignoredups
export HISTIGNORE="&:ls:ll:la:l.:pwd:exit:clear"
export MAVEN_OPTS="-Xmx2g -Xms256m"
export GOPATH=~/go
export PATH=$HOME/bin:/usr/local/bin:$PATH:~/go/bin
export HOMEBREW_NO_ANALYTICS=1
#export DOCKER_HOST=`docker-machine ip default`

case $(uname -s) in
    Darwin|FreeBSD) alias ls="ls -hFG" ;;
    Linux) alias ls="ls --color=always -hF" ;;
    NetBSD|OpenBSD) alias ls="ls -hF" ;;
esac

case $(uname -s) in
    Darwin) alias gvim='open -a MacVim';;
esac

alias ll="ls -hl"
alias ..='cd ..'
alias ...='cd ../..'
alias df='df -h'
alias du='du -h -c'
alias du1='du -h -c -d 1'
alias mkdir='mkdir -p -v'
alias c='clear'
alias mci='mvn clean install'
case $(uname -s) in
    Linux) alias cal='cal -3' ;;
esac
alias svn_incoming='svn log -r BASE:HEAD'

PS1='[\u@\h \W]\$ '

if [ -f ~/workspace/axhixh/oh-my-git/prompt.sh ]; then
    source ~/workspace/axhixh/oh-my-git/prompt.sh
fi

# OPAM configuration
. /Users/shresa/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

