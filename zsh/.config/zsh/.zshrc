[ -n "$RYTH_ZSH_DEBUG" ] && echo "sourcing .zshrc"
local files=(
    "environment.zsh"
    "completions.zsh"
    "alias.zsh"
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

HISTFILE=~/.cache/zsh/history
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
setopt nomatch
setopt promptsubst
setopt histignorespace
setopt histignorealldups
setopt globdots

bindkey -v
bindkey "^?" backward-delete-char

[ -s "$HOME/.config/zsh/lib/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && \. "$HOME/.config/zsh/lib/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"


[ -z "$RYTH_ZSH_NOFETCH" ] && neofetch
