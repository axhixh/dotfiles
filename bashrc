#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# multiple Go versions
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# OPAM configuration
. ~/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

[[ -s "$HOME/.environment" ]] && source "$HOME/.environment"
[[ -s "$HOME/.aliases" ]] && source "$HOME/.aliases"

# prompt
PS1='[\u@\h \W]\$ ' # fallback
[[ -s "$HOME/.prompt.sh" ]] && source "$HOME/.prompt.sh"
