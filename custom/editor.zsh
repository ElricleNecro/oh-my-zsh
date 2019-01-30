typeset -A EDIT_FILE=(n $HOME/.config/nvim/init.vim a $HOME/.config/awesome/rc.lua)

function edit() {
	if [[ -n "$EDIT_FILE[$1]" ]]
	then
		$EDITOR $EDIT_FILE[$1]
	else
		$EDITOR $@
	fi
}
