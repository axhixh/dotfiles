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
export PATH=$PATH:$HOME/bin

case $(uname -s) in
    Darwin|FreeBSD)
        alias ls="ls -hFG"
    ;;
    Linux)
        alias ls="ls --color=always -hF"
    ;;
    NetBSD|OpenBSD)
        alias ls="ls -hF"
    ;;
esac

alias ll="ls -hl"
alias ..='cd ..'
alias ...='cd ../..'
alias df='df -h'
alias du='du -h -c'
alias mkdir='mkdir -p -v'

PS1='[\u@\h \W]\$ '
