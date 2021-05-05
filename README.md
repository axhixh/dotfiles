# Configuration Files

## Steps
 1. You can install necessary apps by running `brew bundle`
 2. Need to manually do ln -s dotfiles/file ~/.file
 3. Install  vim-plugin [https://github.com/junegunn/vim-plug]
```shell
  # for vim
  sh curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  # for neovim
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
   Inside Vim/NeoVim run :PlugInstall or :PlugUpgrade
 4. Configure fish shell by running `ln -s ~/Projects/dotfiles/config/fish ~/.config`
