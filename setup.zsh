#!/bin/zsh

if ! [ -x $(command -v px) ]> /dev/null; then
    echo "$0 requires stow to be installed. It should be available in your package manager, or via brew on mac."
    exit 127
fi

# make some directories that we don't want to be symlinks

# .config won't be a symlink since it is used in multiple packages here
# It also likely already exists anyway, but I'm still adding it
mkdir -p ~/.config

# emacs adds a bunch of crap in its installation directory (autosave lists, compiled elisp, bookmarks, etc)
# that I don't want committed
mkdir -p ~/.emacs.d/lib/

# I want to be able to add scripts locally without committing them as well
mkdir -p ~/scripts
mkdir -p ~/bin

# now we install all the stuff. Not sure if I want to do all at once or each in its individual operation
# If one of these fails due to conflict (user already has configuration) it will fail for all of them
stow compton emacs git i3 neofetch nvim rofi ssh termite tmux zsh
