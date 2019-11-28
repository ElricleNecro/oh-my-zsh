_JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_AWT_WM_NONREPARENTING

AWT_TOOLKIT=MToolkit
export AWT_TOOLKIT

PERL5LIB=$PERL5LIB:$HOME/.local/lib/
export PERL5LIB

# PAGER="$(which most) -s"
PAGER="$(which less)"
export PAGER

#MANPAGER="col -b | view -c 'set ft=man nomod nolist' -"
# MANPAGER=`which most`
MANPAGER="nvim +set\ filetype=man -"
export MANPAGER

MOST_SWITCHES="-s"
export MOST_SWITCHES

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;33m'   
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export LESS_TERMCAP_ue=$'\E[0m'

# eval $($HOME/.lessfilter)

LESS="-R"
export LESS

LESSOPEN="| $HOME/.lessfilter %s"
LESSCHARSET=utf-8
export LESS LESSOPEN LESSCHARSET

EDITOR=`which nvim`
export EDITOR

if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
	export VISUAL="nvr -cc tabedit --remote-wait +'set bufhidden=wipe'"
else
	export VISUAL="nvim"
fi
alias v="$VISUAL"
# VISUAL=`which nvim`
# export VISUAL

eval $(TERM=xterm-256color dircolors)
LS_COLORS="$LS_COLORS:*.tex=02;31:*.tikz=01;31:*.pdf=02;38:*.dat=02;32:*.csv=02;33:*.bak*=02;36:*.res=02;34:*.JPG=01;35"
export LS_COLORS

GNUTERM="wxt"
export GNUTERM

GOPATH="$HOME/.local/lib/go:/usr/lib/go"
export GOPATH

GOBIN="$HOME/.local/lib/go/bin"
export GOBIN

GOARCH=amd64
export GOARCH

GOOS=linux
export GOOS

# PYTHONPATH="$PYTHONPATH:$HOME/.python_lib/"
# export PYTHONPATH

PYTHONSTARTUP=~/.pythonrc
export PYTHONSTARTUP

CC=gcc
export CC

CXX=clang++
export CXX

PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$HOME/.local/lib/pkgconfig"
export PKG_CONFIG_PATH

C_INCLUDE_PATH="$C_INCLUDE_PATH:$HOME/.local/include"
export C_INCLUDE_PATH

CPLUS_INCLUDE_PATH="$C_INCLUDE_PATH"
export CPLUS_INCLUDE_PATH

LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$HOME/.local/lib:."
export LD_LIBRARY_PATH

LD_RUN_PATH="$LD_RUN_PATH:$HOME/.local/lib"
export LD_RUN_PATH

# MANPATH="$MANPATH"
# export MANPATH
MANPATH="/usr/local/man:$MANPATH"
MANPATH="$HOME/.local/share/man:$MANPATH"
export MANPATH

PATH="$HOME/.local/bin:$PATH"
PATH="/usr/local/bin:$PATH"
PATH="$HOME/.local/lib/go/bin/:$PATH"
PATH="$HOME/.cargo/bin:$PATH"
PATH="$HOME/.gem/ruby/2.4.0/bin:$PATH"
PATH="$PATH:$HOME/.node_modules/bin"
export PATH

LATEX_MK_DIR=/usr/share/latex-mk/
export LATEX_MK_DIR

LATEX_MK=/usr/bin/latex-mk
export LATEX_MK

PDFLATEX_FLAGS="-shell-escape"
export PDFLATEX_FLAGS

TEXMFHOME="~/.texmf"
export TEXMFHOME

CUPS_SERVER=localhost
export CUPS_SERVER

P_USE_KERBAL_64=yes
export P_USE_KERBAL_64

RECORDER_DIR_TMP=$HOME/Vidéos/ScreenCast/tmp/
export RECORDER_DIR_TMP

RECORDER_DIR_OUT=$HOME/Vidéos/ScreenCast/
export RECORDER_DIR_OUT

BROWSER=$(which qutebrowser)
export BROWSER

BROWSERCLI=$(which w3m)
export BROWSERCLI

BYOBU_CONFIG_DIR=$HOME/.byobu
export BYOBU_CONFIG_DIR

# RUSTC_WRAPPER=sccache
# export RUSTC_WRAPPER

if which rustc > /dev/null 2>/dev/null
then
	RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
	export RUST_SRC_PATH
fi

R_LIBS_USER=/home/gplum/.local/lib/R
export R_LIBS_USER

# QT_STYLE_OVERRIDE=adwaita
# export QT_STYLE_OVERRIDE

QT_QPA_PLATFORMTHEME=qt5ct
export QT_QPA_PLATFORMTHEME

# if which luarocks > /dev/null
# then
	# eval $(luarocks path)
# fi

export XKB_DEFAULT_LAYOUT=fr,us
export XKB_DEFAULT_VARIANT=oss,
export XKB_DEFAULT_OPTIONS=grp:alt_shift_toggle,

export npm_config_prefix=$HOME/.node_modules

# XDG variables:
if [[ -z "$XDG_CONFIG_DIRS" ]]
then
	XDG_CONFIG_DIRS="/etc/xdg"
fi
XDG_CONFIG_DIRS="$XDG_CONFIG_DIRS:$HOME/.config"
export XDG_CONFIG_DIRS

export NVIM_GTK_NO_HEADERBAR=1
export NVIM_GTK_PREFER_DARK_THEME=1
