# >>> condanv >>>
condanv() {
  # check if a directory is a conda environment
  is_conda_environment() {
    local subdir="$1"
    [ -d "$subdir/conda-meta/" ]
  }

  # activate a conda environment by name
  activate_conda_environment() {
    local env_name="$1"
    conda activate "$env_name"
  }

  # set the secondary command prompt (PS2) to match PS1
  set_ps2_to_ps1() {
    export PS2=$PS1
  }

  # update PS1 to display the current environment's name
  update_ps1() {
    local env_name="$1"
    PS1="($env_name) $PS1"
  }

  # deactivate the active conda environment and restore PS1
  deactivate_conda_environment() {
    conda deactivate
    PS1=$PS2
  }

  local conda_info=$(conda info)

  if [[ -z "$conda_info" || "$conda_info" == *"active environment : None"* ]]; then
    local subdirectories=$(find "$PWD" -maxdepth 1 -mindepth 1 -type d)

    for subdir in $subdirectories; do
      if is_conda_environment "$subdir"; then
        set_ps2_to_ps1
        update_ps1 "${PWD##*/}"
        activate_conda_environment "$subdir"
        return
      fi
    done

    local current_dir_base=$(basename "$PWD")

    if conda info --envs | grep -qE "^\s*$current_dir_base\s"; then
      activate_conda_environment "$current_dir_base"
      set_ps2_to_ps1
      update_ps1 "${PWD##*/}"
      return
    else
      echo "conda environment '$current_dir_base' not found."
    fi
  else
    deactivate_conda_environment
  fi
}
# <<< condanv <<<
