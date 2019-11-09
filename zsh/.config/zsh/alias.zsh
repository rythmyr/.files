alias ls='ls --color=auto'
alias ll='ls --color=auto -lh'
alias la='ls --color=auto -A'
alias lla='ls --color=auto -lhA'
alias bell='echo -e "\a"'

alias zsh-edit="$EDITOR $ZDOTDIR/.zshrc"
alias zsh-source="RYTH_ZSH_DEBUG=true . $ZDOTDIR/.zshrc"

alias dot='cd $DOTFILES_GIT'
alias kb='cd $KEYBASE_HOME'
alias org='cd ~/data/org'

function pj() {
    unset PROJECT
    unset PROJECT_DIR

    export PATH=${PATH_NOPROJ:-$PATH}

    unset PATH_NOPROJ

    cd $HOME/data/projects/$1
    [[ -e sourceme ]] && source sourceme
    [[ -d repo ]] && cd repo
}
