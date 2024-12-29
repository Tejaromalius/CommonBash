# >>> seek >>>
function seek() {
  if [[ $1 == "-i" ]]; then
    shift
    find . -iname "*$1*" -exec du -xhs {} \; | grep -w "$1" | sort -hr | awk '
        BEGIN {
          reset="\033[0m";
          size_color="\033[1;35m"; # Green for sizes
        }
        {
          printf "%s%s%s\t%s\n", size_color, $1, reset, $2
        }
      '
  else
    find . -name "*$1*" -exec du -xhs {} \; | sort -hr | awk '
        BEGIN {
          reset="\033[0m";
          size_color="\033[1;35m"; # Green for sizes
        }
        {
          printf "%s%s%s\t%s\n", size_color, $1, reset, $2
        }
      '
  fi
}
# <<< seek <<<
