# >>> lsps >>>
function lsps-c() {
  ps -U $USER -x --sort=-%cpu -u
}

function lsps-m() {
  ps -U $USER -x --sort=-%mem -u
}
# <<< lsps <<<
