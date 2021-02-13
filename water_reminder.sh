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

log_ok() {
	echo -e "${OK} $1"
}

log_err() {
	echo -e "\n${ERR} $1\n"
}

remind_me() {
	if [ -e "$(which notify-send)" ]
	then
		notify-send 'Water Reminder' 'Drink a cup of water!..'
	elif [ -e "$(which termux-notification)" ]
	then
		termux-notification -t 'Water Reminder' -c 'Drink a cup of water!..' --sound
	fi
}

play_mp3() {
	if [ -e "$(which ffplay)" ]
	then
		ffplay -nodisp -autoexit effect.mp3 >/dev/null 2>&1
	elif [ -e "$(which play)" ]
	then
		play effect.mp3 >/dev/null 2>&1
	fi
}

while :
do
	log_ok "Reminder played!.."
	play_mp3 && remind_me && log_ok "Drink a cup of water..."
	log_ok "Reminder set!.."
	sleep 30m
done
