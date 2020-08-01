if [ -e "$(which git)" ]
then
	alias gitinit='git init .'
	alias gitstat='git status'
	alias gitadde='git add *'
	alias gitcomm='git commit -m'
	alias gitpush='git push -u'
	alias gitpsh='git push -u origin master'
	alias gitremadd='git remote add'
	alias gitcln='git clone'
	alias gitpull='git pull'
fi
alias ls='ls --color=auto'
alias ali='ls -alih'
alias grep='grep --color=auto'
alias getheads='curl -I'
alias upgrub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias relinux='sudo mkinitcpio -P'
alias sysctl='systemctl'
alias cls='clear'
if [ -e "$(which pacman)" ]
then
	alias pacup='sudo pacman -Syu'
	alias pacfnd='pacman -Ss'
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
	alias play3="ffplay -nodisp"
fi
if [ -e "$(which ffmpeg)" ]
then
	screen_res="1366x768"
	alias recsrc="ffmpeg -f x11grab -s '$screen_res' -i :0.0 \"$HOME/Videos/Recording$(date '+%M.%d').mp4\""
fi
if [ -e "$(which yapman.sh)" ] 
then
	alias yapman="yapman.sh"
fi
