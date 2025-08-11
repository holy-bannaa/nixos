#!/usr/bin/env bash

SCRIPTSDIR=$HOME/.config/hypr/scripts

# Define file_exists function
file_exists() {
    if [ -e "$1" ]; then
        return 0  # File exists
    else
        return 1  # File does not exist
    fi
}

# restart cava
# pkill cava
# kitty --class cava --config ~/.config/kitty/cava.conf cava

# refresh kando
# kando --reload-menu-theme

# refresh tmux
tmux source-file ~/.config/tmux/tmux.conf

# relaunch swaync
sleep 0.5
swaync > /dev/null 2>&1 &

exit 0
