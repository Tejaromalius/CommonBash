# >>> ezal >>>
ezal() {
  if command -v eza &>/dev/null; then
    eza -l -a -L 2 -s name --group-directories-first "$@"
  else
    echo -e "\033[0;33m'eza' is not installed! please install it from 'https://github.com/ogham/exa#installation' and run again. \033[0;31maborting..\033[0m"
  fi
}
# <<< ezal <<<
