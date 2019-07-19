#!/usr/bin/env zsh
[ -n "$RYTH_ZSH_DEBUG" ] && echo "sourcing environment.zsh"

PATH=$HOME/bin:$PATH
mkdir -p $HOME/.cache/zsh/
HISTFILE=$HOME/.cache/zsh/history
setopt histignoredups
setopt sharehistory

export NVM_DIR=$HOME/.local/nvm

export KEYBASE_HOME=/keybase/private/rythmyr
export DOTFILES_GIT=$HOME/data/dotfiles
export SSH_ENV=$HOME/.ssh/env
