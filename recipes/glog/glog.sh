# >>> glog >>>
function glog() {
  if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "$(tput setaf 1)Warning: Not a Git repository.$(tput sgr0)"
    return 1
  fi
  git log --graph --abbrev-commit --decorate --pretty=oneline --format=format:'%C(auto)%C(dim white)%h %C(bold #6F2DC3)%an %C(auto)%d  %C(auto)%s %C(dim white)(%ad)%C(reset)' --date=format:'%Y/%m/%d %H:%M:%S' "$@"
}
# <<< glog <<<
