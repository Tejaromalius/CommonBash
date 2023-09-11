
# >>> fancy-log >>>
fancy-log() {
    git log --graph --abbrev-commit --decorate --pretty=oneline --format=format:'%C(auto)%C(dim white)%h %C(bold #6F2DC3)%an %C(auto)%d  %C(auto)%s %C(dim white)(%ad)%C(reset)' --date=format:'%Y/%m/%d %H:%M:%S'
}
# <<< fancy-log <<<
