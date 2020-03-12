autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '%b	%S' #using tabs intentionally here, better delimiters for parsing with cut
zstyle ':vcs_info:*' actionformats '%b	%S	%a'
zstyle ':vcs_info:*' enable git

# precmd is called right before the prompt
precmd() {
    vcs_info
}

# preexec is called right before a command gets called
preexec() {
}

# zsh has a vi mode built in, this shows whether I'm in insert mode or not
local function vi_mode_prompt_info() {
    # keymap is main by default, but doesn't get populated into keymap until the keymap switches
    # replace main/viins with INSERT
    # replace vicmd with NORMAL
    local MAP=${${${KEYMAP:-main}/(main|viins)/I}/vicmd/N}
    echo -n "%F{4}$MAP%f"
}

local function prompt_symlink_dir() {
    local realPwd
    local fakePwd

    realPwd=$(pwd -P)
    fakePwd=$(pwd -L)

    if [ $realPwd != $fakePwd ]; then
        echo -n "\n%F{13}│%f (%F{6}%~%f)"
    fi
}

local function prompt_dir() {
    local relativePath
    local projectDir
    local thisDir
    local realPwd

    relativePath="$(echo $1 | cut -f2)"

    realPwd=$(pwd -P)
    projectDir=${${${realPwd%$relativePath}%/}/$HOME/\~}

    if [[ -z $relativePath ]]; then
        echo -n "%F{5}$projectDir%f"
    else
        #only executes if in a git controlled directory

        # either pwd relative to $HOME or full path
        echo -n "%F{3}$projectDir%f"
        if [[ ! $relativePath = "." ]]; then
            echo -n "%F{4}/%f%B%F{5}$relativePath%f%b"
        fi
    fi
    echo -n "%F{5}/%f"
}

local function prompt_branch() {
    local branch=$(echo $1 | cut -f1)

    [[ $branch ]] && echo -n "%F{3}($branch)%f"
}

local function prompt_action() {
    # "rebase" or "merge", usually
    local action=$(echo $1 | cut -f3)

    [[ $action ]] && echo -n " %F{1}{$action}%f"
}

local function prompt_project() {
    local project=$PROJECT
    [[ $project ]] && echo -n "\n%F{15}[$project]%f "
}

# Updates editor information when the keymap changes.
function zle-keymap-select() {
    zle reset-prompt
    zle -R
}
zle -N zle-keymap-select

KEYTIMEOUT=4

PROMPT='$(prompt_project)
%B%F{13}┌%b%f$(vi_mode_prompt_info) $(prompt_dir "$vcs_info_msg_0_") $(prompt_symlink_dir)
%B%F{13}└>%f%b '
RPROMPT='$(prompt_branch "$vcs_info_msg_0_")$(prompt_action "$vcs_info_msg_0_")  %F{4}%*%f'

# Syntax hilighting
[ -s "$HOME/.config/zsh/lib/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && \. "$HOME/.config/zsh/lib/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
