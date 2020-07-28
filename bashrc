#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# shell variables
export PAGER=less
export EDITOR=nvim
export VISUAL=nvim
export HISTSIZE=5000
export HISTFILESIZE=1000
export HISTCONTROL=ignoredups
export HISTIGNORE="&:ls:ll:la:l.:pwd:exit:clear"
export MAVEN_OPTS="-Xmx2g -Xms256m"
export GOPATH=~/go
export PATH=$HOME/bin:/usr/local/bin:$PATH:~/go/bin:$GRAALVM_HOME/bin
export HOMEBREW_NO_ANALYTICS=1
export CDPATH=.:~:~/go/src/github.com/axhixh:~/Projects:~/go/src/github.com:~/Documents

# multiple Go versions
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# OPAM configuration
. ~/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

[[ -s "$HOME/.aliases" ]] && source "$HOME/.aliases"

# prompt
PS1='[\u@\h \W]\$ ' # fallback
[[ -s "$HOME/.prompt.sh" ]] && source "$HOME/.prompt.sh"
