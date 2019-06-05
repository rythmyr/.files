

echo "sourcing .zshrc"
[ -s "$HOME/.config/zsh/environment.zsh" ] && \. "$HOME/.config/zsh/environment.zsh"
[ -s "$HOME/.config/zsh/completions.zsh" ] && \. "$HOME/.config/zsh/completions.zsh"
[ -s "$HOME/.config/zsh/alias.zsh" ] && \. "$HOME/.config/zsh/alias.zsh"
[ -s "$HOME/.config/zsh/local.zsh" ] && \. "$HOME/.config/zsh/local.zsh"
[ -s "$HOME/.config/zsh/programs.zsh" ] && \. "$HOME/.config/zsh/programs.zsh"
[ -s "$HOME/.config/zsh/prompt.zsh" ] && \. "$HOME/.config/zsh/prompt.zsh"

HISTFILE=~/.cache/zsh/history
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
setopt nomatch
setopt promptsubst
setopt histignorespace
setopt histignorealldups

bindkey -v
bindkey "^?" backward-delete-char


neofetch
