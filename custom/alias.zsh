alias xinit='startx ~/.xinitrc'

alias lumail2='lumail2 --load-file $HOME/.local/share/lumail2/lumail2.lua'

alias c='var=$(cal); echo -e "${var/ $(date +%-d) / $(echo -e "\033[01;31m$(date +%-d)\033[00m ")}"'
alias meteo='curl -4 wttr.in/Paris'

alias gnuplot='PAGER=less gnuplot'
alias pylab='/usr/bin/ipython --autoindent --no-banner --pylab=tk'
alias VerificationShell='ipython --profile=VerificationShell'
alias yorick='rlwrap -pcyan -c yorick'
alias urxvt='XMODIFIERS='' urxvt'

alias feh-all='feh --auto-zoom --thumbnails --title'
alias feh='feh -q -d'

alias cat='less -XF'

alias fortune='fortune 5% computers 15% ferengi_rules_of_acquisition 10% discworld 20% fr 10% futurama 2% linux 8% science 20% startrek 10% starwars'

alias temperature='sensors && sudo hddtemp /dev/sda'
alias dfc='dfc -T -o -f -w'
alias htop='htop || top'
alias j='jobs -l'

alias h='htop'

alias suspend='systemctl suspend && i3lock -i ~/Images/Wallpapers/DSCN0906.png -t -u -f'

alias su='su -l'

alias ls='ls --color=auto --group-directories-first'
alias l='ls -CF'
alias ll='ls -lh'
alias la='ls -A'
alias lla='ll -A'
alias lsnew="ls -rtlh *(D.om[1,10])"
alias lad='ls -d .*(/)'
alias lsa='ls -a .*(.)'
alias lse='ls -d *(/^F)'
alias lsold="ls -rtlh *(D.Om[1,10])"

alias tree='tree -I "build|*.egg-info|__pycache__|target"'

alias vi='nvim'

alias yu='yaourt -Syua'

alias mux='tmuxinator'

## global aliases (for those who like them) ##
alias -g '...'='../..'
alias -g '....'='../../..'
# alias -g BG='& exit'
alias -g WC='|wc -l'
alias -g G='|grep'
alias -g H='|head'
alias -g Hl=' --help |& less -r'
#alias -g K='|keep'
alias -g L='|less'
alias -g LL='|& less -r'
alias -g M='|most'
alias -g N='&>/dev/null'
#alias -g R='| tr A-z N-za-m'
alias -g SL='| sort | less'
alias -g S='| sort'
alias -g T='|tail'
alias -g V='| nvim -'

## instead of global aliase it might be better to use grmls $abk assoc array, whose contents are expanded after pressing ,.
#$abk[SnL]="| sort -n | less"

## get top 10 shell commands:
#alias top10='print -l ${(o)history%% *} | uniq -c | sort -nr | head -n 10'

## Execute \kbd{./configure}
#alias CO="./configure"

## Execute \kbd{./configure --help}
#alias CH="./configure --help"

#vim:ft=zsh
