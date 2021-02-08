# since these aliases are shared with bash, not converting these to functions
if test -e ~/.aliases
  source ~/.aliases
end

if test -e ~/.rvm/bin/rvm
  rvm default
end

if test -e $HOME/.config/fish/environment
  source $HOME/.config/fish/environment
end

fish_vi_key_bindings
set -e fish_greeting # remove default greeting
