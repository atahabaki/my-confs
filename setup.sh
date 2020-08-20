if [ $# -gt 0 ]
then
	if [ $1 == "--here" ]
	then
		echo "Starting..."
		cp "$HOME/.bashrc" .
		cp "$HOME/.bash_aliases" .
		cp "$HOME/.bash_general" .
		cp "$HOME/.config/nvim/init.vim" .config/nvim/
		echo "Done!"
	else
		echo -e "Wrong argument passed. Take a quick look...\n"
		sed 's/\t/\ \ /g' setup.sh
	fi
else
	if [ -e "$HOME/.bashrc" ]
	then
		echo Shit
		if ! grep -qF `echo .bashrc` "$HOME/.bashrc"; then
			cat .bashrc >> "$HOME/.bashrc"
		fi
	else
		cp .bashrc $HOME
	fi

	if ! [ -e "$HOME/.bash_general" ]
	then
		cp .bash_general $HOME
	fi

	if ! [ -e "$HOME/.bash_aliases" ]
	then
		cp .bash_aliases $HOME
	fi

	if ! [ -e "$HOME/.config/nvim/init.vim" ]
	then
		mkdir -p "$HOME/.config/nvim/"
		cp .config/nvim/init.vim "$HOME/.config/nvim/"
	fi
fi
