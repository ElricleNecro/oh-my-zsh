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

if which kitty >/dev/null
then
	kitty + complete setup zsh | source /dev/stdin
fi

if [[ -z "${DEFAULT_PKG_MAN}" ]]
then
	export DEFAULT_PKG_MAN=yay
fi

open_with_fzf() {
    fd -t f -H -I | fzf -m --preview="xdg-mime query default {}" | xargs -ro -d "\n" xdg-open 2>&-
}

cd_with_fzf() {
    cd $HOME && cd "$(fd -t d | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden)"
}

pacs() {
    sudo pacman -Syy $(pacman -Ssq | fzf -m --preview="pacman -Si {}" --preview-window=:hidden --bind=space:toggle-preview)
}

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
	local old_path=$LUA_PATH
	local old_cpath=$LUA_CPATH
	unset LUA_PATH LUA_CPATH

	# Upgrading neovim itself:
	yay -S --noconfirm neovim-git

	# Upgrading bindings:
	yay -S --noconfirm neovim-remote python-pynvim

	# Upgrading GUIs:
	yay -S --noconfirm neovim-qt-git # neovim-gtk-git eovim-git

	nvim +PackerCompile +PackerSync +qa

	export LUA_PATH=$old_path
	export LUA_CPATH=$old_cpath
}

function pac-git-update() {
	local pkgcmd=${1:-${DEFAULT_PKG_MAN}}
	local exclude=${PACS_UPGRADE_EXCLUDE:-ckb-next-git|kitty-git|neovim-git|neovim-qt-git|qutebrowser-git}
	local pkgs=$(yay -Qs -- -git | grep -E '^local' | cut -f 1 -d ' ' | sed -e 's:local/::g' | grep -Ev "${exclude}")

	yay -S $(yay -Qs -- -git | grep -E '^local' | cut -f 1 -d ' ' | sed -e 's:local/::g' | grep -Ev "${exclude}")
}

function mkcd() {
	mkdir $1
	cd $1
}

ensure_path() {
    case ":$PATH:" in
        *:$1:*) ;;
        *) export PATH="$1:$PATH";;
    esac
}

ensure_path_end() {
    case ":$PATH:" in
        *:$1:*) ;;
        *) export PATH="$PATH:$1";;
    esac
}
