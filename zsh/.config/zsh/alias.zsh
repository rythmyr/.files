local LS=$([[ $ISMAC ]] && echo "g")'ls'

alias ls="$LS --color=auto --group-directories-first"
alias ll="$LS --color=auto --group-directories-first -lh"
alias la="$LS --color=auto --group-directories-first -A"
alias lla="$LS --color=auto --group-directories-first -lhA"
alias bell='echo -e "\a"'

alias ce="$EDITOR $ZDOTDIR/.zshrc"
alias cr="RYTH_ZSH_DEBUG=true . $ZDOTDIR/.zshrc"

alias dot='cd $DOTFILES_GIT'
alias kb='cd $KEYBASE_HOME'
alias org='cd ~/data/org'

[[ -s "$HOME/scripts/source/pj.function.zsh" ]] && source "$HOME/scripts/source/pj.function.zsh"
