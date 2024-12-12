# >>> condanv >>>
conda_is_active=false

function condanv() {
  conda_exists() {
    if which conda &> /dev/null; then
      return 0
    else 
      return 1
    fi
  }

  environment_exists() {
    if [ -d ".condanv/conda-meta/" ]; then
      return 0
    else
      return 1
    fi
  }

  update_ps() {
    export PS2=$PS1
    PS1="(${PWD##*/}) $PS1"
  }

  reverse_ps() {
    PS1=$PS2
  }

  activate_conda() {
    conda activate ".condanv/"
    conda_is_active=true
  }

  deactivate_conda() {
    conda deactivate
    conda_is_active=false
  }

  create_environment() {
    conda create -p ".condanv/"
  }

  if conda_exists; then
    if ! $conda_is_active; then
      if environment_exists; then
        update_ps
        activate_conda
      else
        echo -n "Local environment does not exist. Do you want to create one (Y/n)? "
        read create_environment_input
        if [[ $create_environment_input =~ [y|Y] ]]; then
          create_environment
          update_ps
          activate_conda
        else
          return
        fi
      fi
    else
      deactivate_conda
      reverse_ps  
    fi
  else
    echo "Conda is not installed on device! Install before using 'condanv'"
    return
  fi
}
# <<< condanv <<<
