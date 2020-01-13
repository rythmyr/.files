#!/usr/bin/env zsh

function pj() {
    # unset anything set in this function, resetting PATH if necessary
    unset PROJECT
    unset PROJECT_DIR

    export PATH="${PATH_NOPROJ:-$PATH}"

    unset PATH_NOPROJ

    # go to the directory (or the projects directory if not provided)
    cd ${PROJECTS_DIR:-"$HOME/data/projects/"}$1

    if [[ $1 ]]; then
        export PROJECT=$1
        export PROJECT_DIR=$PWD

        export PATH_NOPROJ="${PATH_NOPROJ:-$PATH}"
        export PATH="$PWD:$PATH_NOPROJ"

        [[ -d repo ]] && cd repo
    fi
}
