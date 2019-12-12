#!/usr/bin/env zsh

function pj() {
    unset PROJECT
    unset PROJECT_DIR

    export PATH=${PATH_NOPROJ:-$PATH}

    unset PATH_NOPROJ

    cd $HOME/data/projects/$1
    [[ -s sourceme ]] && source sourceme
    [[ -d repo ]] && cd repo
}
