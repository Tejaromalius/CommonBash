# >>> lsdid >>>
lsdid() {
  # check if lsd is installed
  if command -v lsd &>/dev/null; then
    # if lsd is installed, run the desired command
    lsd --almost-all --long --icon-theme unicode --tree --depth 2 -X --group-directories-first --permission octal --blocks permission,user,git,size,date,name "$@"
  else
    echo -e "\033[0;33m'lsd' is not installed! please install it from 'https://github.com/lsd-rs/lsd' and run again. \033[0;31maborting..\033[0m"
  fi
}
# <<< lsdid <<<