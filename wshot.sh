#!/bin/bash

_() {
	gettext wshot "$1"
}

WshotApp() {
	local FILEDIR=/tmp
	local OPTION=()

	# Translation strings
	local _textOptions=$(_ "Options")
	local _grabMode=$(_ "Mode")
	local _fullScreen=$(_ "Full screen")
	local _selectedArea=$(_ "Selected area")
	local _selectedWindow=$(_ "Selected window")
	local _withCursor=$(_ "Include cursor")
	local _nope=$(_ "no")
	local _yep=$(_ "yes")
	local _delay=$(_ "Delay")
	local _destination=$(_ "Destination")
	local _saveFile=$(_ "Save file")
	local _clipboard=$(_ "Clipboard")
	local _customFilename=$(_ "Custom filename:")
	local _fileType=$(_ "File type")
	local _openSaved=$(_ "Open saved result?")
	local _shotToClip=$(_ "Screenshot copied to clipboard")
	local _savedAs=$(_ "Screenshot saved as")
	local _winDetectionError=$(_ "Compositor does not support automatic window detection.")

	local values=$(zenity \
		--window-icon=/usr/share/pixmaps/wshot.png \
		--title=Wshot \
		--text="$_textOptions" \
		--forms \
		--add-combo="$_grabMode" \
			--combo-values="$_fullScreen|$_selectedArea|$_selectedWindow" \
		--add-combo="$_delay" \
			--combo-values="0|2|4|6|8|10|15|20" \
		--add-combo="$_destination" \
			--combo-values="$_saveFile|$_clipboard" \
		--add-entry="$_customFilename" \
		--add-combo="$_fileType" \
			--combo-values="png|jpeg" \
		--add-checkbox="$_withCursor" \
		--add-checkbox="$_openSaved" \
	)

	local result=$?

	local mode=$(echo $values | cut -d '|' -f 1)
	local wait=$(echo $values | cut -d '|' -f 2)
	local destination=$(echo $values | cut -d '|' -f 3)
	local filename=$(echo $values | cut -d '|' -f 4)
	local filetype=$(echo $values | cut -d '|' -f 5)
	local cursor=$(echo $values | cut -d '|' -f 6)
	local open=$(echo $values | cut -d '|' -f 7)


	if [ "$result" -eq 1 ];then # selected cancel
		echo "Goodbye!"
		exit
	fi

	if [ ! -z "$cursor" ] &&	[ "$cursor" == true ];then
		OPTION+="-c"
	fi

	if [ ! -z "$wait" ];then
		sleep $wait
	fi

	if [ "$mode" == "$_fullScreen" ];then
		true
	elif [ "$mode" == "$_selectedWindow" ];then
		if pgrep -x sway > /dev/null; then
		GEO="$(swaymsg -t get_tree | jq -r '.. | select(.pid? and .visible?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"' | slurp)"
		elif pgrep -x wayfire > /dev/null; then
		GEO=$(wf-info |grep Geometry |cut -c 10-)
		else
		zenity \
			--title=Wshot \
			--width=1500 \
			--warning \
			--timeout 3 \
			--text="$_winDetectionError"
		GEO="$(slurp)"
		fi
	elif [ "$mode" == "$_selectedArea" ];then
		GEO="$(slurp)"
	fi

	if [ -z "$filename" ];then
		filename=screenshot_$(date +%F_%H.%M.%S)
	fi

	if [ -z "$destination" ] || [ "$destination" == "$_clipboard" ];then
		if [ -z "$GEO" ]; then
			grim $OPTION -t $filetype - | wl-copy;
		else
			grim $OPTION -t $filetype -g "$GEO" - | wl-copy;
		fi
		notify-send -t 3000 -a Wshot -i /usr/share/pixmaps/wshot.png "$_shotToClip"
	else
		if [ -z "$GEO" ]; then
			grim $OPTION -t $filetype $FILEDIR/$filename.$filetype
		else
			grim $OPTION -t $filetype -g "$GEO" $FILEDIR/$filename.$filetype
		fi
		if [ "$open" == true ]; then
		xdg-open $FILEDIR/$filename.$filetype
		else
			notify-send -t 3000 -a Wshot -i /usr/share/pixmaps/wshot.png	"$_savedAs $FILEDIR/$filename.$filetype"
		fi
	fi
}

WshotApp
