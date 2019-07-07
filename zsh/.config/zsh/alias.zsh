#!/bin/zsh
echo "sourcing alias.zsh"

alias ls='ls --color=auto'
alias ll='ls --color=auto -lh'
alias la='ls --color=auto -a'
alias lla='ls --color=auto -lha'
alias bell='echo -e "\a"'

alias e="$EDITOR ~/.config/zsh/.zshrc"
alias s=". ~/.config/zsh/.zshrc"

#go to my dotfiles directory
#in a function just in case I change $DOTFILES_GIT elsewhere
function dot() {
    cd $DOTFILES_GIT
}

function kb() {
    cd $KEYBASE_HOME
}

function org() {
    cd ~/data/org
}
