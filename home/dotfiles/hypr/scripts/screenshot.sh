#!/usr/bin/env bash

box() {
	hyprshot -m region -o ~/Pictures/Screenshots -z
}

screen() {
	hyprshot -m active -m output -o ~/Pictures/Screenshots
}

if [[ "$1" == "--box" ]]; then
	box
elif [[ "$1" == "--screen" ]]; then
	screen
fi

exit 0
