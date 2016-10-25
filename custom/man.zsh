if [ "$OSTYPE[0,7]" = "solaris" ]
then
	if [ ! -x ${HOME}/.local/bin/nroff ]
	then
		mkdir -p ${HOME}/.local/bin
		cat > ${HOME}/.local/bin/nroff <<EOF
#!/bin/sh
if [ -n "\$_NROFF_U" -a "\$1,\$2,\$3" = "-u0,-Tlp,-man" ]; then
	shift
	exec $(which nroff) -u\${_NROFF_U} "\$@"
fi
#-- Some other invocation of nroff
exec $(which nroff) "\$@"
EOF
		chmod +x ${HOME}/.local/bin/nroff
	fi
fi

# man() {
      # env \
                # LESS_TERMCAP_mb=$(printf "\e[1;31m") \
	  # LESS_TERMCAP_md=$(printf "\e[1;31m") \
	  # LESS_TERMCAP_me=$(printf "\e[0m") \
	  # LESS_TERMCAP_se=$(printf "\e[0m") \
	  # LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
	  # LESS_TERMCAP_ue=$(printf "\e[0m") \
	  # LESS_TERMCAP_us=$(printf "\e[1;32m") \
	  # PAGER=/usr/bin/less \
	  # _NROFF_U=1 \
	  # PATH=${HOME}/.local/bin:${PATH} \
				     # man "$@"
# }
