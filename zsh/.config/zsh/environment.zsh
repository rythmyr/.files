#====================#
# STANDARD VARIABLES #
#====================#

PATH=$HOME/bin:$PATH

export EDITOR=`which nvim`

# History options
mkdir -p $HOME/.cache/zsh/
HISTFILE=$HOME/.cache/zsh/history # save in a cache file instead of home directory (or $ZDOTDIR)
HISTSIZE=1000 # save 1000 commands in memory
SAVEHIST=1000 # also save 1000 commands to history file
setopt histignoredups    # don't save same command twice
setopt sharehistory      # share history between zsh sessions
setopt appendhistory     # append to the history file instead of overwriting it
setopt histignorespace   # don't save to history if command starts with a space
setopt histignorealldups # ignore ALL duplicate commands, not just consecutive ones

setopt nomatch     # if globs don't find anything, don't error
setopt promptsubst # expand variables/expressions in the prompt string
setopt globdots    # include hidden (dot) files in globs. Includes tab-completion

# NVM default is home directory. Bad.
export NVM_DIR=$HOME/.local/nvm

#==================#
# CUSTOM VARIABLES #
#==================#

export KEYBASE_HOME=/keybase/private/rythmyr
export DOTFILES_GIT=$HOME/.files
export SSH_ENV=$HOME/.ssh/env
