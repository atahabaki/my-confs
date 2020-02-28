alias gitinit='git init .'
alias gitstat='git status'
alias gitadde='git add *'
alias gitcomm='git commit -m'
alias gitpush='git push -u'
alias gitremadd='git remote add'
alias gitcln='git clone'
alias gitpull='git pull'
alias ali='ls -alih'
alias grep='grep --color=auto'
alias getheads='curl -I'
alias upgrub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias relinux='sudo mkinitcpio -P'
alias sysctl='systemctl'
if [ -e "$(which pacman)" ]
then
	alias pacup='sudo pacman -Syu'
	alias pacfnd='pacman -Ss'
	alias pacfltr='pacman -Qs'
	alias pacrm='sudo pacman -Rss'
fi
if [ -e "$(which vim)" ]
then
	alias suvim='sudo vim'
fi
