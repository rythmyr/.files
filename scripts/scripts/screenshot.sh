#!/bin/bash

FOLDER=$HOME/data/images/screenshots/$(date +"%Y-%m")/
FILENAME=$(date +"%d-%H-%M-%S.png")

mkdir -p $FOLDER
# show a full screenshot in a feh window that spans all screens
# I have i3 set for class=feh and title=SCREENSHOT to automatically enable floating and move to 0 0
maim | feh - --no-xinerama --no-screen-clip --title=SCREENSHOT -x &
# wait for the feh window to appear
xdotool search --sync --name SCREENSHOT
# take a screenshot of the screenshot (which shows the cursor), and copy to clipboard
# IMPORTANT: set a blur/dim/etc exclude in your compositor for the window class 'slop'
# I have a blur for transparent windows and without that set, the entire screen blurs
maim -s -u $FOLDER/$FILENAME && \
xclip -t image/png -selection clipboard -i $FOLDER/$FILENAME
# ^^ copy to the clipboard
# close the feh window we opened
xdotool search --name SCREENSHOT windowclose
