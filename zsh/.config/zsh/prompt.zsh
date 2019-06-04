#!/bin/zsh
echo "sourcing prompt.zsh"

setopt promptsubst

autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '%b	%S' #using tabs intentionally here, better delimiters for parsing with cut
zstyle ':vcs_info:*' actionformats '%b-%a	%S'
zstyle ':vcs_info:*' enable git

# precmd is called right before the prompt
precmd() {
    vcs_info
}

# preexec is called right before a command gets called
preexec() {
    
}

# zsh has a vi mode built in, this shows whether I'm in insert mode or not
vi_mode_prompt_info() {
    # keymap is main by default, but doesn't get populated into keymap until the keymap switches
    # replace main/viins with INSERT
    # replace vicmd with NORMAL
    local MAP=${${${KEYMAP:-main}/(main|viins)/I}/vicmd/N}
    echo -n "%F{4}$MAP%f"
}

local function prompt_dir() {
    local relativePath
    local projectDir
    local thisDir

    relativePath="$(echo $1 | cut -f2)"
    [ -z $relativePath ] && echo -n "%F{5}%~%f" && exit

    #only executes if in a git controlled directory

    # either pwd relative to $HOME or full path
    thisDir=${$(pwd)/$HOME/\~}
    # the thing passed in
    projectDir=${${thisDir%$relativePath}%/}
    echo -n "%F{3}$projectDir%f"
    [ ! $relativePath = "." ] && echo -n "%F{4}/%f%B%F{5}$relativePath%f%b"
}

local function prompt_branch() {
    local branch=$(echo $1 | cut -f1)

    [ $branch ] && echo -n "%F{3}($branch)%f"
}

# Updates editor information when the keymap changes.
function zle-keymap-select() {
    zle reset-prompt
    zle -R
}
zle -N zle-keymap-select

KEYTIMEOUT=4

PROMPT='
%B%F{13}┌%b%f$(vi_mode_prompt_info) $(prompt_dir "$vcs_info_msg_0_")
%B%F{13}└>%f%b '
RPROMPT='$(prompt_branch "$vcs_info_msg_0_")  %F{4}%*%f'


