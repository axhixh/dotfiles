#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# shell variables
export PAGER=less
export EDITOR=nvim
export HISTSIZE=5000
export HISTFILESIZE=1000
export HISTCONTROL=ignoredups
export HISTIGNORE="&:ls:ll:la:l.:pwd:exit:clear"
export MAVEN_OPTS="-Xmx2g -Xms256m"
export GOPATH=~/go
export GRAALVM_HOME=~/graalvm-ce-1.0.0-rc7/Contents/Home
export PATH=$HOME/bin:/usr/local/bin:$PATH:~/go/bin:$GRAALVM_HOME/bin
export HOMEBREW_NO_ANALYTICS=1
export CDPATH=.:~:~/go/src/github.com/axhixh:~/work:~/Projects:~/go/src/github.com:~/Documentsc

case $(uname -s) in
    Darwin|FreeBSD) alias ls="ls -hFG" ;;
    Linux) alias ls="ls --color=always -hF" ;;
esac

case $(uname -s) in
    Darwin) alias gvim='open -a MacVim';;
esac

alias vim=nvim
alias diff="diff-so-fancy"
alias ll="ls -hl"
alias ..='cd ..'
alias ...='cd ../..'
alias df='df -h'
alias du='du -h -c'
alias du1='du -h -c -d 1'
alias mkdir='mkdir -p -v'
alias c='clear'
alias mci='mvn clean install'
alias k='kubectl'
alias incoming='tig ..origin/master'
alias dci="docker images | grep none | awk '{print $3}' | xargs docker rmi"
case $(uname -s) in
    Linux) alias cal='cal -3';;
esac

# OPAM configuration
. ~/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# prompt
PS1='[\u@\h \W]\$ ' # fallback
eval "$(starship init bash)"

