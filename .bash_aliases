if [ -e "$(which git)" ]
then
	alias gitinit='git init .'
	alias gitstat='git status'
	alias gitadde='git add *'
	alias git+='git add '
	alias git-='git diff '
	alias gitcomm='git commit -m'
	alias gitpush='git push -u'
	alias gitpsh='git push -u origin `get_git_branch`'
	alias gitremadd='git remote add'
	alias gitcln='git clone'
	alias gitpull='git pull'
	gitacomf() {
		git add "$1" && git commit -m "$2" "$1"
	}
	gitdelbr() {
		git push origin --delete "$1" && git branch -D "$1"
	}
fi
if [ -e "$(which startx)" ]
then
	alias stx="startx"
fi
if [ -e "$(which shutdown)" ]
then
	alias sdown="shutdown -P 0"
fi
alias ls='ls --color=auto'
alias l='ls -alih'
alias c='cd'
alias ..='cd ..'
mkcdir() {
	mkdir -p -- "$1" && cd -P -- "$1"
}
alias grep='grep --color=auto'
alias getheads='curl -I'
alias upgrub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias relinux='sudo mkinitcpio -P'
alias cls='clear'
if [ -e "$(which pacman)" ]
then
	alias pacup='sudo pacman -Syu'
	alias pacfnd='pacman -Ss'
	alias pacffl='sudo pacman -F'
	alias pacfltr='pacman -Qs'
	alias pacrm='sudo pacman -R'
	alias pacrmx='sudo pacman -Rns $(pacman -Qtdq)'
	alias pacc='sudo pacman -Sc'
	alias paccx='sudo pacman -Scc'
fi
if [ -e "$(which python3)" ]
then
	alias p3="python3"
	alias sp3="sudo python3"
fi
if [ -e "$(which youtube-dl)" ]
then
	alias ytdl="youtube-dl"
	alias ytdl3="ytdl -x --audio-format mp3 -o '%(title)s.%(ext)s'"
fi
if [ -e "$(which nvim)" ]
then
	alias v='nvim'
	alias sv='sudo nvim'
fi
if [ -e "$(which ffplay)" ]
then
	play3="ffplay -nodisp -autoexit"
	alias play3="${play3}"
	play3all() {
		IFS=$'\n'
		musics=(`find ~/Music/ -name *.mp3 | shuf -`)
		unset IFS
		for music in "${musics[@]}"; do $play3 "$music"; done
	}
fi
if [ -e "$(which ffmpeg)" ]
then
	screen_res="1366x768"
	alias recsxn="ffmpeg -f x11grab -s '$screen_res' -i :0.0 \"$HOME/Videos/Recording$(date $date_style).mp4\""
	grbsxn() {
		sleep_time=2
		date_style='+%Y%m%d_%H%M%S_%s'
		sleep $sleep_time && ffmpeg -f x11grab -video_size $screen_res -i $DISPLAY -vframes 1 "$HOME/Pictures/Screenshots/Screenshot_$(date $date_style).png"
	}
fi
if [ -e "$(which yapman.sh)" ] 
then
	alias yapman="yapman.sh"
fi
if [ -e "$(which apt)" ]
then
	alias aptup="sudo apt update && sudo apt dist-upgrade"
	alias aptins="sudo apt install"
	alias aptprg="sudo apt purge"
	alias aptrmx="sudo apt auto-remove"
fi
hwmon_pin=`ls /sys/devices/platform/asus-nb-wmi/hwmon`
if [ -e "/sys/devices/platform/asus-nb-wmi/hwmon/${hwmon_pin}/pwm1" ]
then
	alias fanfull="sudo -- sh -c 'echo 255 > /sys/devices/platform/asus-nb-wmi/hwmon/${hwmon_pin}/pwm1'"
	alias fanstop="sudo -- sh -c 'echo 0 > /sys/devices/platform/asus-nb-wmi/hwmon/${hwmon_pin}/pwm1'"
	alias fanauto="sudo -- sh -c 'echo 2 > /sys/devices/platform/asus-nb-wmi/hwmon/${hwmon_pin}/pwm1_enable'"
	alias fanman="sudo -- sh -c 'echo 1 > /sys/devices/platform/asus-nb-wmi/hwmon/${hwmon_pin}/pwm1_enable'"
fi
