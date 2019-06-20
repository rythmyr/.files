#!/bin/zsh

local INSTANCE=${1:-NOTES}
#force uppercase
INSTANCE=$INSTANCE:u

local function start_emacs() {
    emacsclient -c -s notes --alternate-editor="" -e "(set-frame-name '\"$INSTANCE\")" -e "(find-file \"/keybase/private/rythmyr/org/$INSTANCE:l.org\")" &
}

local function toggle_emacs() {
    i3-msg "[title=\"^$INSTANCE$\" class=\"^Emacs$\"] scratchpad show, resize set 90 ppt 90 ppt, move position center"
}

xdotool search --name "$INSTANCE" \
    && toggle_emacs\
    || start_emacs
