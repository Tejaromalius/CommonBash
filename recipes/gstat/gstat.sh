# >>> gstat >>>
gstat() {
  # check if the current directory is a Git repository
  if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "$(tput setaf 1)Warning: Not a Git repository.$(tput sgr0)"
    return 1
  fi

  # get the current branch name
  branch=$(git symbolic-ref --short HEAD 2>/dev/null)

  # Display the branch name
  echo "$(tput bold setaf 6)Branch: $branch$(tput sgr0)"
  echo

  # check for changes to be committed
  changes_to_commit=$(git status --porcelain=v1 | awk '/^[MDRCTU] / {print "\t./" $2}')

  # check for changes not staged for commit
  changes_not_staged=$(git status --porcelain=v1 | awk '/^ [MDRCTU]/ {print "\t./" $2}')

  # check for untracked files
  untracked_files=$(git status --porcelain=v1 | awk '/^\?\?/ {print "\t./" $2}')

  # display categories with non-empty content
  if [[ -n $changes_to_commit ]]; then
    echo "$(tput bold setaf 2)Changes to be committed:$(tput sgr0)"
    echo "$changes_to_commit"
    echo
  fi

  if [[ -n $changes_not_staged ]]; then
    echo "$(tput bold setaf 1)Changes not staged for commit:$(tput sgr0)"
    echo "$changes_not_staged"
    echo
  fi

  if [[ -n $untracked_files ]]; then
    echo "$(tput setaf 3)Untracked files:$(tput sgr0)"
    echo "$untracked_files"
    echo
  fi

  # display a message if there are no changes
  if [[ -z $changes_to_commit && -z $changes_not_staged && -z $untracked_files ]]; then
    echo "No changes."
  fi
}
# <<< gstat <<<
