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

# opam configuration
source /Users/ashrestha/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end    

if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end

set --erase _asdf_shims
