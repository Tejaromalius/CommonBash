# >>> myip >>>
function myip() {
  echo -e "\033[1mYour IP address is: \033[0m\033[92m$(curl -4 icanhazip.com)\033[0m"
}
# <<< myip <<<
