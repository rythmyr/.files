bindkey -v
bindkey "^?" backward-delete-char


autoload -z edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
