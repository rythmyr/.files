#!/usr/bin/env zsh

[ -n "$RYTH_ZSH_DEBUG" ] && echo "sourcing ~/.zshenv"
export ZDOTDIR=$HOME/.config/zsh
export ISMAC=$([[ "Darwin" == $(uname) ]] && echo "yes")
