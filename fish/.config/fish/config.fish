# since these aliases are shared with bash, not converting these to functions
if test -e ~/.aliases
    source ~/.aliases
end

if test -e $HOME/.config/fish/environment
    source $HOME/.config/fish/environment
end

fish_vi_key_bindings
set -e fish_greeting # remove default greeting

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '$HOME/.opam/opam-init/init.fish' && source '$HOME/.opam/opam-init/init.fish' >/dev/null 2>/dev/null; or true
# END opam configuration
