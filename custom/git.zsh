# Git (https://www.synbioz.com/blog/les_aliases_git_de_l_extreme):
alias state='git fetch --prune ; git fetch --tags ; clear && git branch -vv && git status'
# Mise à jour des branches, en indiquant celles qui n’existent plus en remote
# Mise à jour des tags
# Nettoyage de l’écran
# Affichage de la liste des branches locales, avec un niveau de détail suffisantgit status (enfin)
git-update() {
	branch=$1

	if [[ -z $branch ]]
	then
		branch=`git symbolic-ref HEAD | cut -d "/" -f 3-`
	else
		git checkout $branch
	fi

	git pull --rebase origin $branch
}
alias update='git-update'
# $ update      # git pull --rebase sur la branche courante
# $ update toto # git pull --rebase sur la branche toto, après s'être placé dessus
git-updates() {
	git stash && git-update "$@" && git stash pop
}
alias updates='git-updates'
alias tagz='git tag -l | sort -V'
alias nxtrlz='tagz | tail -n 1 && git log --oneline `tagz | tail -n 1`..HEAD'
# $ tagz   # mes tags, triés comme il se doit
# $ nxtrlz # le dernier tag, ainsi que la liste des commits ayant eu lieu depuis sur la branche courante
git-merged() {
	sourceBranch=`git symbolic-ref HEAD | cut -d "/" -f 3-`
	targetBranch=$1

	if [[ -z $targetBranch ]]
	then
		targetBranch='master'
	fi

	git-update $targetBranch && git branch -d $sourceBranch
}
alias merged='git-merged'
# $ merged         # se place sur master, la met à jour, et vire la branche sur laquelle vous étiez
# $ merged develop # pareil, mais avec develop au lieu de master
git-mergeds() {
	git stash && git-merged "$@" && git stash pop
}
alias mergeds='git-mergeds'
git-lstcmt() {
	git log --oneline $1 | grep -v fixup | head -n 1 | cut -d " " -f 1
}
alias lstcmt='git-lstcmt'
# $ lstcmt      # affiche le hash du dernier commit de la branche courante
# $ lstcmt toto # affiche le hash du dernier commit de la branche toto
git-logz() {
	nb=$2

	if [[ -z $nb ]]
	then
		nb=10
	fi

	git log --oneline $1 | head -n $nb
}
alias logz='git-logz'
# $ logz         # les 10 derniers commits de la branche courante, un par ligne (hash + message)
# $ logz toto    # pareil sur la branche toto
# $ logz HEAD 20 # les 20 derniers commits de la branche courante
# $ logz toto 20 # pareil sur la branche toto
git-rebase() {
	sourceBranch=`git symbolic-ref HEAD | cut -d "/" -f 3-`
	targetBranch=$1

	if [[ -z $targetBranch ]]
	then
		targetBranch='master'
	fi

	git-update $targetBranch && git checkout $sourceBranch && git rebase $targetBranch
}
alias rebase='git-rebase'
# $ rebase         # met à jour master et rebase la branche courante dessus
# $ rebase develop # pareil, mais avec develop au lieu de master
alias goon='git add . && git rebase --continue || git rebase --skip'
git-rebases() {
	git stash && git-rebase "$@" && git stash pop
}
alias rebases='git-rebases'
git-squash() {
	ref=$1

	if [[ -z $ref ]]
	then
		ref=`git log --oneline | grep -v fixup | head -n 2 | tail -n 1 | cut -d " " -f 1`
	fi

	git rebase -i --autosquash $ref
}
alias squash='git-squash'
git-fixup() {
	ref=$1

	if [[ -z $ref ]]
	then
		ref=`lstcmt`
	fi

	git commit --fixup $ref
}
alias fixup='git-fixup'
# $ fixup          # crée un commit d'ajustement destiné au dernier commit
# $ fixup abcd1234 # idem, en ciblant le hash fourni
alias fixupa='adal && fixup'
alias adal='git add --all .'
alias amend='git commit --amend --no-edit'
alias amenda='adal && amend'
alias yolo='git push origin HEAD --force-with-lease'
alias yoloc='amend && yolo'
alias yoloca='adal && yoloc'
# $ yoloc  # amende le dernier commit avec le contenu de la zone de staging, et pousse le tout en force
# $ yoloca # idem, mais ajoute d'abord vos modifications locales à la zone de staging ; à utiliser avec prudence !

