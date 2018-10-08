if [[ -f $HOME/Documents/src/Python/vf-py/vf-comp.sh ]]
then
	source $HOME/Documents/src/Python/vf-py/vf-comp.sh
fi

#Une auto complétion pour les noms d'hôtes ssh :
if [[ "$SHELL" = "bash" || "$SHELL" = "/bin/bash" ]]
then
	if [ -f ~/.ssh/known_hosts ]
	then
		SSH_COMPLETE=( $(cat ~/.ssh/known_hosts | \
			cut -f 1 -d ' ' | \
			sed -e s/,.*//g | \
			uniq | \
			egrep -v [0123456789]) )
		complete -o default -W "${SSH_COMPLETE[*]}" ssh
	fi
fi

function list-theme {
	for f in ~/.oh-my-zsh/themes/*
	do
		basename $(echo ${f} | sed -e 's:.zsh-theme::')
	done
}

function ranger-cd {
	tempfile='/tmp/chosendir'
	/usr/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
	test -f "$tempfile" &&
		if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
			cd -- "$(cat "$tempfile")"
		fi
		rm -f -- "$tempfile"
}

bash() {
	NO_SWITCH="yes" command bash "$@"
}

restart () {
	exec $SHELL $SHELL_ARGS "$@"
}

plap() {
	emulate -L zsh
	if [[ $# = 0 ]] ; then
		echo "Usage:    $0 program"
		echo "Example:  $0 zsh"
		echo "Lists all occurrences of program in the current PATH."
	else
		ls -l ${^path}/*$1*(*N)
	fi
}

memusage() {
	ps aux | awk '{if (NR > 1) print $5;
			if (NR > 2) print "+"}
			END { print "p" }' | dc
}

## print hex value of a number
hex() {
	emulate -L zsh
	if [[ -n "$1" ]]; then
		printf "%x\n" $1
	else
		print 'Usage: hex <number-to-convert>'
		return 1
	fi
}

vimhelp () {
	vim -c "help $1" -c on -c "au! VimEnter *"
}

set_privoxy() {
	export http_proxy="http://127.0.0.1:8118"
	export https_proxy="https://127.0.0.1:8118"
	export ftp_proxy="ftp://127.0.0.1:8118"
}

unset_privoxy() {
	unset http_proxy https_proxy ftp_proxy
}

set_ensta() {
	export http_proxy="http://proxy.ensta.fr:8080"
	export https_proxy="https://proxy.ensta.fr:8080"
	export ftp_proxy="ftp://proxy.ensta.fr:8080"
}

unset_ensta() {
	unset http_proxy https_proxy ftp_proxy
}

function createClassPath() {
	for f in $*
	do
		CL="$CL:$f"
	done
	echo $CL
}

function w3mimg () {
	w3m -o imgdisplay=/usr/lib/w3m/w3mimgdisplay $1
}

function vimg () {
	kitty icat $1
}

function mdviewer() {
	pandoc $* | lynx -stdin
}

function upgrade_neovim() {
	export CC=gcc
	export CXX=g++
	unset LUA_PATH LUA_CPATH

	# Upgrading neovim itself:
	trizen -S --noconfirm neovim-git

	# Upgrading bindings:
	trizen -S --noconfirm neovim-remote python-neovim-git python2-neovim-git

	# Upgrading GUIs:
	trizen -S --noconfirm neovim-qt-git neovim-gtk-git eovim-git
}
