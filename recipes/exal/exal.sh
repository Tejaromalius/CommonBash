# >>> exal >>>
exal() {
  # check if 'exa' is installed
  if command -v exa &>/dev/null; then
    # if 'exa' is installed, run the desired command
    exa -l -a -L 2 -s name --group-directories-first "$@"
  else
    echo -e "\033[0;33m'exa' is not installed! please install it from 'https://github.com/ogham/exa#installation' and run again. \033[0;31maborting..\033[0m"
  fi
}
# <<< exal <<<