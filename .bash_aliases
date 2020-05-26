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
	alias pacrm='sudo pacman -Rss'
	alias pacrmq='sudo pacman -Rsscnd'
fi
if [ -e "$(which nvim)" ]
then
	alias v='nvim'
	alias sv='sudo vim'
fi
if [ -e "$(which ffplay)" ]
then
	alias play3="ffplay -nodisp"
fi
