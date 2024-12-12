# >>> lsports >>>
function lsports() {
  sudo lsof -i -P -n | grep LISTEN
}
# <<< lsports <<<
