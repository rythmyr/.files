if [[ -z $TMUX && -o interactive ]]; then
    local sessions
    sessions=$(tmux list-sessions 2>/dev/null | grep -v attached)
    if [[ $? = 0 ]]; then
        session=$(echo $sessions | head -n 1 | cut -d: -f1) # might be a problem if session name has a colon
        tmux a -t $session
    else
        tmux
    fi
fi


[ -n "$RYTH_ZSH_DEBUG" ] && echo "sourcing .zshrc"
local files=(
    "environment.zsh"
    "completions.zsh"
    "alias.zsh"
    "keybinds.zsh"
    "local.zsh"
    "programs.zsh"
    "prompt.zsh"
)

for file in $files; do
    local fname=$ZDOTDIR/$file
    if [[ -r $fname ]]; then
        if [[ -n $RYTH_ZSH_DEBUG ]]; then
            echo "sourcing $file"
        fi
        source $fname
    fi
done
