# Configuration Files

## Steps
 1. Check out to your `$HOME` folder. `git clone git@github.com:axhixh/dotfiles.git`
 2. You can install necessary apps by running `brew bundle`
 3. Use GNU Stow to link the dotfiles. For example, `stow helix`
    If you checked out to directory other than your home folder,
    you need to change the `stow` command:
    `stow -t $HOME helix`
