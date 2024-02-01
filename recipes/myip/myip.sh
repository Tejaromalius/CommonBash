# >>> myip >>>
myip() {
  echo -e "\033[1mYour IP address is: \033[0m\033[92m$(wget -qO- http://ipecho.net/plain)\033[0m"
}
# <<< myip <<<