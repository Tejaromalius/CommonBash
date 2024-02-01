# >>> gstat >>>
gstat() {
  if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "$(tput setaf 1)Warning: Not a Git repository.$(tput sgr0)"
    return 1
  fi

  branch=$(git symbolic-ref --short HEAD 2>/dev/null)

  echo "$(tput bold setaf 6)Branch: $branch$(tput sgr0)"
  echo

  changes_to_commit=$(git status --short | awk '/^[MADRCU]/ {
    color = "";
    if ($1 ~ /^M/) color = "\033[31m";   # Red for modified
    if ($1 ~ /^A/) color = "\033[32m";   # Green for added
    if ($1 ~ /^D/) color = "\033[31m";   # Red for deleted
    if ($1 ~ /^R/) color = "\033[33m";   # Yellow for renamed
    if ($1 ~ /^C/) color = "\033[33m";   # Yellow for copied
    if ($1 ~ /^U/) color = "\033[35m";   # Magenta for unmerged

    print "\t" color $0 "\033[0m";       # Reset color
}')

  changes_not_staged=$(git status --short | awk '/^.[MADRCU]/ {
    color = "";
    if ($1 ~ /^.?M/) color = "\033[31m";   # Red for modified
    if ($1 ~ /^.?A/) color = "\033[32m";   # Green for added
    if ($1 ~ /^.?D/) color = "\033[31m";   # Red for deleted
    if ($1 ~ /^.?R/) color = "\033[33m";   # Yellow for renamed
    if ($1 ~ /^.?C/) color = "\033[33m";   # Yellow for copied
    if ($1 ~ /^.?U/) color = "\033[35m";   # Magenta for unmerged

    print "\t" color $0 "\033[0m";       # Reset color
}')

  untracked_files=$(git status --porcelain=v1 | awk '/^\?\?/ {color = "\033[95m"; print "\t" color $0 "\033[0m"}')

  if [[ -n $changes_to_commit ]]; then
    echo "$(tput bold setaf 253)Changes to be committed:$(tput sgr0)"
    echo "$changes_to_commit"
    echo
  fi

  if [[ -n $changes_not_staged ]]; then
    echo "$(tput bold setaf 253)Changes not staged for commit:$(tput sgr0)"
    echo "$changes_not_staged"
    echo
  fi

  if [[ -n $untracked_files ]]; then
    echo "$(tput bold setaf 253)Untracked files:$(tput sgr0)"
    echo "$untracked_files"
    echo
  fi

  if [[ -z $changes_to_commit && -z $changes_not_staged && -z $untracked_files ]]; then
    echo "No changes."
  fi
}
# <<< gstat <<<
