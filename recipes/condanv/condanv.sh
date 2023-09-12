# >>> condanv >>>
condanv() {
  # find all subdirectories in the current directory
  subdirectories=$(find "$PWD" -maxdepth 1 -mindepth 1 -type d)

  # loop through the subdirectories
  for subdir in $subdirectories; do
    # check if the subdirectory is a Conda environment
    if [ -d "$subdir/conda-meta/" ]; then
      # activate the Conda environment with the -p flag
      conda activate "$subdir"
      # echo "Activated Conda environment in subdirectory: $subdir"
      return  # exit the function after activation
    fi
  done

  # get the base name of the current directory
  current_dir_base=$(basename "$PWD")

  # check if a Conda environment with the same name exists
  if conda info --envs | grep -qE "^\s*$current_dir_base\s"; then
    # activate the Conda environment
    conda activate "$current_dir_base"
    # echo "Activated Conda environment: $current_dir_base"
    return
  else
    echo "Conda environment '$current_dir_base' not found."
  fi
}
# <<< condanv <<<
