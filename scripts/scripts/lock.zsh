#!/usr/bin/env zsh

B='#00000000'  # blank
C='#ffffff22'  # clear ish
D='#9575cdcc'  # default
T='#9575cdee'  # text
W='#880000bb'  # wrong
V='#bb00bbbb'  # verifying
BG='#301934'   # background color

i3lock \
--insidevercolor=$C   \
--ringvercolor=$V     \
\
--insidewrongcolor=$C \
--ringwrongcolor=$W   \
\
--insidecolor=$C      \
--ringcolor=$D        \
--linecolor=$B        \
--separatorcolor=$D   \
\
--verifcolor=$T       \
--wrongcolor=$T       \
--timecolor=$T        \
--datecolor=$T        \
--layoutcolor=$T      \
--keyhlcolor=$W       \
--bshlcolor=$W        \
\
--screen 1            \
--color=$BG             \
--clock               \
--indicator           \
--timestr="%H:%M:%S"  \
--datestr="%B %d, %Y" \
--keylayout 2         \
-m                    \

# --veriftext="Drinking verification can..."
# --wrongtext="Nope!"
# --textsize=20
# --modsize=10
# --timefont=comic-sans
# --datefont=monofur
# etc
