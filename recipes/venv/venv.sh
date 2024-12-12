# >>> venv >>>
function venv() {
  if ! [ -x "$(command -v virtualenv)" ]; then
    echo 'Error: virtualenv not installed.' >&2
    exit 1
  fi

  virtualenv .venv && . .venv/bin/activate
}
# <<< venv <<<
