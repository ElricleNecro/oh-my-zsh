PERL5LIB=$PERL5LIB:$HOME/.local/lib/
export PERL5LIB

# PAGER="$(which most) -s"
PAGER="$(which less)"
export PAGER

#MANPAGER="col -b | view -c 'set ft=man nomod nolist' -"
# MANPAGER=`which most`
# export MANPAGER

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

VISUAL=`which nvim`
export VISUAL

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
PATH="$HOME/.gem/ruby/2.3.0/bin:$PATH"
export PATH

LATEX_MK_DIR=/usr/share/latex-mk/
export LATEX_MK_DIR

LATEX_MK=/usr/bin/latex-mk
export LATEX_MK

PDFLATEX_FLAGS="-shell-escape"
export PDFLATEX_FLAGS

# TEXMFHOME="~/.texmf-var"
# export TEXMFHOME

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

BYOBU_CONFIG_DIR=$HOME/.byobu
export BYOBU_CONFIG_DIR

RUST_SRC_PATH="/usr/src/rust/src"
export RUST_SRC_PATH

R_LIBS_USER=/home/gplum/.local/lib/R
export R_LIBS_USER

# QT_STYLE_OVERRIDE=adwaita
# export QT_STYLE_OVERRIDE

QT_QPA_PLATFORMTHEME=qt5ct
export QT_QPA_PLATFORMTHEME

eval $(luarocks path)
