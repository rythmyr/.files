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



[ -z "$RYTH_ZSH_NOFETCH" ] && neofetch

export RYTH_ZSH_NOFETCH="true"
