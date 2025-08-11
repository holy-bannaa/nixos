#!/usr/bin/env bash

# WALLPAPERS PATH
wallDIR="$HOME/Pictures/wallpapers"
SCRIPTSDIR="$HOME/.config/hypr/scripts"

# variables
focused_monitor=$(hyprctl monitors | awk '/^Monitor/{name=$2} /focused: yes/{print name}')
# swww transition config
FPS=60
TYPE="any"
DURATION=1.5
BEZIER=".43,1.19,1,.4"
SWWW_PARAMS="--transition-fps $FPS --transition-type $TYPE --transition-duration $DURATION"

# place the path of the wallpapers into an array called PICS
mapfile -d '' PICS < <(find "${wallDIR}" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) -print0)

menu() {
	# Sort the PICS array
	IFS=$'\n' sorted_options=($(sort <<<"${PICS[*]}"))

	for pic_path in "${sorted_options[@]}"; do
		pic_name=$(basename "$pic_path")

		# Displaying .gif to indicate animated images
		if [[ ! "$pic_name" =~ \.gif$ ]]; then
			printf "%s\x00icon\x1f%s\n" "$(echo "$pic_name" | cut -d. -f1)" "$pic_path"
		else
			printf "%s\n" "$pic_name"
		fi
	done
}


main() {
    choice=$(menu | rofi -dmenu -config ~/.config/rofi/config.rasi) 
	#choice=$(menu | anyrun --plugins ~/.config/anyrun/plugins/libstdin.so)

	# Trim any potential whitespace or hidden characters
	choice=$(echo "$choice" | xargs)

	if [[ -z "$choice" ]]; then
		echo "No choice selected. Exiting."
		exit 0
	fi

	# Find the index of the selected file
	pic_index=-1
	for i in "${!PICS[@]}"; do
		filename=$(basename "${PICS[$i]}")
		if [[ "$filename" == "$choice"* ]]; then
			pic_index=$i
			break
		fi
	done

	if [[ $pic_index -ne -1 ]]; then
		swww img "${PICS[$pic_index]}" $SWWW_PARAMS
	else
		echo "Image not found."
		exit 1
	fi
}

main

wallPath=$(grep -v 'Lanczos3' "$HOME/.cache/swww/HDMI-A-1"| head -n 1)

wallust run $wallPath -s
rm $HOME/.config/rofi/wall
ln -s $wallPath $HOME/.config/rofi/wall

"$SCRIPTSDIR/refresh.sh"

exit 0
