# SVN
SPACESHIP_SVN_SHOW="${SPACESHIP_SVN_SHOW:=true}"
SPACESHIP_SVN_PREFIX="${SPACESHIP_SVN_PREFIX:="at "}"
SPACESHIP_SVN_SUFFIX="${SPACESHIP_SVN_SUFFIX:="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_SVN_SYMBOL="${SPACESHIP_SVN_SYMBOL:="r"}"
# SVN BRANCH
SPACESHIP_SVN_BRANCH_SHOW="${SPACESHIP_SVN_BRANCH_SHOW:=true}"
SPACESHIP_SVN_BRANCH_PREFIX="${SPACESHIP_SVN_BRANCH_PREFIX:="$SPACESHIP_SVN_SYMBOL"}"
SPACESHIP_SVN_BRANCH_SUFFIX="${SPACESHIP_SVN_BRANCH_SUFFIX:=""}"
SPACESHIP_SVN_BRANCH_COLOR="${SPACESHIP_SVN_BRANCH_COLOR:="magenta"}"
# SVN STATUS
SPACESHIP_SVN_STATUS_SHOW="${SPACESHIP_SVN_STATUS_SHOW:=true}"
SPACESHIP_SVN_STATUS_PREFIX="${SPACESHIP_SVN_STATUS_PREFIX:=" ["}"
SPACESHIP_SVN_STATUS_SUFFIX="${SPACESHIP_SVN_STATUS_SUFFIX:="]"}"
SPACESHIP_SVN_STATUS_COLOR="${SPACESHIP_SVN_STATUS_COLOR:="red"}"
SPACESHIP_SVN_STATUS_UNTRACKED="${SPACESHIP_SVN_STATUS_UNTRACKED:="?"}"
SPACESHIP_SVN_STATUS_ADDED="${SPACESHIP_SVN_STATUS_ADDED:="+"}"
SPACESHIP_SVN_STATUS_MODIFIED="${SPACESHIP_SVN_STATUS_MODIFIED:="!"}"
SPACESHIP_SVN_STATUS_RENAMED="${SPACESHIP_SVN_STATUS_RENAMED:="»"}"
SPACESHIP_SVN_STATUS_DELETED="${SPACESHIP_SVN_STATUS_DELETED:="✘"}"
SPACESHIP_SVN_STATUS_STASHED="${SPACESHIP_SVN_STATUS_STASHED:="$"}"
SPACESHIP_SVN_STATUS_UNMERGED="${SPACESHIP_SVN_STATUS_UNMERGED:="="}"
SPACESHIP_SVN_STATUS_AHEAD="${SPACESHIP_SVN_STATUS_AHEAD:="⇡"}"
SPACESHIP_SVN_STATUS_BEHIND="${SPACESHIP_SVN_STATUS_BEHIND:="⇣"}"
SPACESHIP_SVN_STATUS_DIVERGED="${SPACESHIP_SVN_STATUS_DIVERGED:="⇕"}"

_svn_get_path() {
	svn info | grep "URL" | grep -v "http" | cut -d'^' -f 2
}

_svn_get_branch() {
	_svn_get_path | grep "DPAC_" && echo "trunk" && return

	local type_svn = "$(_svn_get_path | cut -d'/' -f 2 | cut -d'_' -f 2)"
}

_is_svn() {
  svn info >/dev/null 2>&1
}

# SVN BRANCH
spaceship_svn_branch() {
  [[ $SPACEHIP_SVN_BRANCH_SHOW == false ]] && return

  _is_svn || return

  spaceship::section \
    "$SPACESHIP_SVN_BRANCH_COLOR" \
    "$SPACESHIP_SVN_BRANCH_PREFIX$(svn_get_rev_nr)$SPACESHIP_SVN_BRANCH_SUFFIX"
    # "$SPACESHIP_SVN_BRANCH_PREFIX$(svn_get_branch_name)$SPACESHIP_SVN_BRANCH_SUFFIX"
}

# SVN STATUS
spaceship_svn_status() {
  [[ $SPACESHIP_SVN_STATUS_SHOW == false ]] && return

  _is_svn || return

  ZSH_THEME_SVN_PROMPT_UNTRACKED=$SPACESHIP_SVN_STATUS_UNTRACKED
  ZSH_THEME_SVN_PROMPT_ADDED=$SPACESHIP_SVN_STATUS_ADDED
  ZSH_THEME_SVN_PROMPT_MODIFIED=$SPACESHIP_SVN_STATUS_MODIFIED
  ZSH_THEME_SVN_PROMPT_RENAMED=$SPACESHIP_SVN_STATUS_RENAMED
  ZSH_THEME_SVN_PROMPT_DELETED=$SPACESHIP_SVN_STATUS_DELETED
  ZSH_THEME_SVN_PROMPT_STASHED=$SPACESHIP_SVN_STATUS_STASHED
  ZSH_THEME_SVN_PROMPT_UNMERGED=$SPACESHIP_SVN_STATUS_UNMERGED
  ZSH_THEME_SVN_PROMPT_AHEAD=$SPACESHIP_SVN_STATUS_AHEAD
  ZSH_THEME_SVN_PROMPT_BEHIND=$SPACESHIP_SVN_STATUS_BEHIND
  ZSH_THEME_SVN_PROMPT_DIVERGED=$SPACESHIP_SVN_STATUS_DIVERGED

  ZSH_THEME_SVN_PROMPT_DIRTY=$SPACESHIP_SVN_STATUS_MODIFIED
  ZSH_THEME_SVN_PROMPT_CLEAN=" "

  local svn_status="$(svn_dirty)"

  if [[ -n $svn_status ]]; then
    # Status prefixes are colorized
    spaceship::section \
      "$SPACESHIP_SVN_STATUS_COLOR" \
      "$SPACESHIP_SVN_STATUS_PREFIX$svn_status$SPACESHIP_SVN_STATUS_SUFFIX"
  fi
}

# SVN
spaceship_svn() {
  [[ $SPACESHIP_SVN_SHOW == false ]] && return

  local svn_branch="$(spaceship_svn_branch)" svn_status="$(spaceship_svn_status)"

  [[ -z $svn_branch ]] && return

  spaceship::section \
    'white' \
    "$SPACESHIP_SVN_PREFIX" \
    "${svn_branch}${svn_status}" \
    "$SPACESHIP_SVN_SUFFIX"
}

