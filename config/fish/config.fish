set -x PATH ~/bin/ $PATH 
set -U EDITOR nvim

# since these aliases are shared with bash, not converting these to functions
if test -e ~/.aliases
  source ~/.aliases
end

if test -e ~/.environment
  source ~/.environment
end
