#!/usr/bin/env bash
#
#
#MIT License
#
#Copyright (c) 2021 A. Taha Baki
#
#Permission is hereby granted, free of charge, to any person obtaining a copy
#of this software and associated documentation files (the "Software"), to deal
#in the Software without restriction, including without limitation the rights
#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#copies of the Software, and to permit persons to whom the Software is
#furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in all
#copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#SOFTWARE.
#

BOLDB="\033[1;34m"
BOLDR="\033[1;31m"
BOLDG="\033[1;32m"
BOLDY="\033[1;33m"
NORMAL="\033[0m"
OK="${BOLDG}[OK!]${NORMAL}"
ERR="${BOLDR}[ERR]${NORMAL}"
WRN="${BOLDY}[WRN]${NORMAL}"

# ARG0: ["both", "main", "hdmi"]
# SOUND: ["hdmi","main"]
main() {
	print_welcome
	if [ $# -ge 1 ]
	then
		if [ $# -eq 1 ]
		then
			first_arg "$1"
		elif [ $# -eq 2 ]
		then
			first_arg "$1"
			all_args "$2" "$1"
		else
			help_me
		fi
	else
		help_me
	fi
}

first_arg() {
	if [ "$1" == "hdmi" ]
	then
		only_hdmi
		hdmi_sound
	elif [ "$1" == "main" ]
	then
		only_pc
		main_sound
	elif [ "$1" == "both" ]
	then
		both_monitors
	else
		help_me
	fi
}

all_args() {
	if [ "$1" == "hdmi" ]
	then
		if [ "$2" == "main" ]
		then
			log_err "Switch back to main sound channel, 'cause of HDMI interface principles...\n      Can't send sound signal while HDMI is off."
			main_sound
		else
			hdmi_sound
		fi
	elif [ "$1" == "main" ]
	then
		main_sound
	else
		help_me
	fi
}

log_ok() {
	echo -e "${OK} $1"
}

log_err() {
	echo -e "\n${ERR} $1\n"
}

both_monitors() {
	xrandr --output HDMI1 --mode 1920x1080i --left-of LVDS1 && log_ok "HDMI1 is placed to left of LVDS1."
	xrandr --output LVDS1 --mode 1366x768 && log_ok "LVDS1 set to 1366x768 mode."
}

only_pc() {
	xrandr --output HDMI1 --off && log_ok "HDMI1 closed."
	xrandr --output LVDS1 --mode 1366x768 && log_ok "LVDS1 set to 1366x768 mode."
}

only_hdmi() {
	xrandr --output HDMI1 --mode 1920x1080i && log_ok "HDMI1 set to 1920x1080i mode."
	xrandr --output LVDS1 --off && log_ok "LVDS1 closed."
}

hdmi_sound() {
	pactl set-card-profile 0 "output:hdmi-stereo" && log_ok "Sound output set to hdmi (stereo mode)."
}

main_sound() {
	pactl set-card-profile 0 "output:analog-stereo+input:analog-stereo" && log_ok "Sound output set to pc (stereo+input mode)"
}

print_welcome() {
	echo -e "${BOLDB}
______ _______ __________________________
_  __ \`/_  __ \`__ \_  ___/__  __ \_  ___/
/ /_/ /_  / / / / /(__  )__  /_/ /(__  ) 
\__, / /_/ /_/ /_//____/ _  .___//____/  
  /_/                    /_/             

${BOLDG}(Quick Monitor & Sound Profile Switcher)${NORMAL} by ${BOLDR}@atahabaki${NORMAL}
"
}

help_me() {
	echo -e "
${BOLDB}Usage:${NORMAL}

qmsps [monitor] [sound_card]

monitors:   ["hdmi","main","both"]
sound_card: ["hdmi","main"]
"
}

main "${@}"
