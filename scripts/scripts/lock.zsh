#!/usr/bin/env zsh

B='#00000000'  # blank
C='#ffffff22'  # clear ish
D='#9575cdcc'  # default
T='#9575cdee'  # text
W='#880000bb'  # wrong
V='#bb00bbbb'  # verifying
BG='#301934'   # background color

local args=''


args+=" \"--insidevercolor=$C\""
args+=" \"--ringvercolor=$V\""

args+=" \"--insidewrongcolor=$C\""
args+=" \"--ringwrongcolor=$W\""
args+=" \"--insidecolor=$C\""
args+=" \"--ringcolor=$D\""
args+=" \"--linecolor=$B\""
args+=" \"--separatorcolor=$D\""

args+=" \"--verifcolor=$T\""
args+=" \"--wrongcolor=$T\""
args+=" \"--timecolor=$T\""
args+=" \"--datecolor=$T\""
args+=" \"--layoutcolor=$T\""
args+=" \"--keyhlcolor=$W\""
args+=" \"--bshlcolor=$W\""

args+=" \"--screen=1\""
args+=" \"--color=$BG\""
args+=" \"--clock\""
args+=" \"--indicator\""
args+=" \"--timestr=%H:%M:%S\""
args+=" \"--datestr=%B %d, %Y\""
args+=" \"--keylayout=2\""
args+=" \"--pass-media-keys\""
args+=" \"--ignore-empty-password\""

echo "i3lock $args"

eval "i3lock $args"

# --veriftext="Drinking verification can..."
# --wrongtext="Nope!"
# --textsize=20
# --modsize=10
# --timefont=comic-sans
# --datefont=monofur
# etc
