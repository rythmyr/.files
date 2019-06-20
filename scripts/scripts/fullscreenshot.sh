#!/bin/bash

FOLDER=$HOME/data/images/screenshots/$(date +"%Y-%m")/
FILENAME=$(date +"%d-%H-%M-%S.png")

echo $FOLDER $FILENAME

mkdir -p $FOLDER && \
maim -l $FOLDER/$FILENAME && \
xclip -t image/png -selection clipboard -i $FOLDER/$FILENAME

