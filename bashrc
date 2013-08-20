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
export PATH=$HOME/bin:$PATH

case $(uname -s) in
    Darwin|FreeBSD) alias ls="ls -hFG" ;;
    Linux) alias ls="ls --color=always -hF" ;;
    NetBSD|OpenBSD) alias ls="ls -hF" ;;
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
alias cal='cal -3'

PS1='[\u@\h \W]\$ '
