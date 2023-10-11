# >>> condanv >>>
# this section is defining a function called "condanv" and setting an initial variable.
conda_is_active=false

# define the main function called "condanv".
condanv() {
  # define a function to check if Conda is installed.
  conda_exists() {
    if which conda &> /dev/null; then
      return 0 # conda is installed, return success.
    else 
      return 1 # conda is not installed, return failure.
    fi
  }

  # define a function to check if a Conda environment exists in the current directory.
  environment_exists() {
    if [ -d ".condanv/conda-meta/" ]; then
      return 0 # environment exists, return success.
    else
      return 1 # environment does not exist, return failure.
    fi
  }

  # define a function to update the bash prompt to show the current environment.
  update_ps() {
    export PS2=$PS1
    PS1="(${PWD##*/}) $PS1"
  }

  # define a function to revert the bash prompt to its previous state.
  reverse_ps() {
    PS1=$PS2
  }

  # define a function to activate the Conda environment.
  activate_conda() {
    conda activate ".condanv/"
    conda_is_active=true
  }

  # define a function to deactivate the Conda environment.
  deactivate_conda() {
    conda deactivate
    conda_is_active=false
  }

  # define a function to create a Conda environment.
  create_environment() {
    conda create -p ".condanv/"
  }

  # check if Conda is installed.
  if conda_exists; then
    # if Conda is installed, proceed with environment handling.
    if ! $conda_is_active; then
      # if the Conda environment is not currently active:
      if environment_exists; then
        # if an environment exists in the current directory, activate it.
        update_ps
        activate_conda
      else
        # if no environment exists, prompt the user to create one.
        echo -n "Local environment does not exist. Do you want to create one (Y/n)? "
        read create_environment_input
        if [[ $create_environment_input =~ [y|Y] ]]; then
          create_environment
          update_ps
          activate_conda
        else
          return # user chose not to create an environment, exit.
        fi
      fi
    else
      # if the Conda environment is active, deactivate it.
      deactivate_conda
      reverse_ps  
    fi
  else
    # if Conda is not installed, display a message.
    echo "Conda is not installed on device! Install before using 'condanv'"
    return # exit the function.
  fi
}
# <<< condanv <<<
