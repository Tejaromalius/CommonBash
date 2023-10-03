# >>> condanv >>>
condanv() {
  # get information about the currently active conda environment.
  conda_info=$(conda info)

  # check if there is no active conda environment or if the active environment is 'none'.
  if [[ -z "$conda_info" || "$conda_info" == *"active environment : none"* ]]; then
    # find all subdirectories in the current directory.
    subdirectories=$(find "$PWD" -maxdepth 1 -mindepth 1 -type d)

    # loop through each subdirectory.
    for subdir in $subdirectories; do
      # check if the subdirectory contains a 'conda-meta' directory, indicating it's a conda environment.
      if [ -d "$subdir/conda-meta/" ]; then
        # set the secondary command prompt (PS2) to match the primary command prompt (PS1).
        export PS2=$PS1
        # update the primary command prompt (PS1) to display the current environment's name.
        PS1="(${PWD##*/}) $PS1"
        # activate the conda environment in the subdirectory.
        conda activate "$subdir"
        return
      fi
    done

    # get the base name of the current directory.
    current_dir_base=$(basename "$PWD")

    # check if an environment with the same name exists in conda.
    if conda info --envs | grep -qE "^\s*$current_dir_base\s"; then
      # activate the conda environment with the same name as the current directory.
      conda activate "$current_dir_base"
      # set the secondary command prompt (PS2) to match the primary command prompt (PS1).
      export PS2=$PS1
      # update the primary command prompt (PS1) to display the current environment's name.
      PS1="(${PWD##*/}) $PS1"
      return
    else
      # display an error message if the conda environment is not found.
      echo "conda environment '$current_dir_base' not found."
    fi
  else
    # deactivate the currently active conda environment.
    conda deactivate
    # restore the primary command prompt (PS1) to its original state.
    PS1=$PS2
    return
  fi
}
# <<< condanv <<<
