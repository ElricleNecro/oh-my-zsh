SPACESHIP_NNN_SHOW="${SPACESHIP_NNN_SHOW:=true}"
SPACESHIP_NNN_PREFIX="${SPACESHIP_NNN_PREFIX:="(nnn-level: "}"
SPACESHIP_NNN_SUFFIX="${SPACESHIP_NNN_SUFFIX:=") "}"

spaceship_nnn() {
	[[ $SPACESHIP_NNN_SHOW == false ]] && return
	([[ -z $SHLVL ]] || [[ $SHLVL -le 1 ]]) && return

	spaceship::section \
		"red" \
		"$SPACESHIP_NNN_PREFIX" \
		"$SHLVL" \
		"$SPACESHIP_NNN_SUFFIX"
}
