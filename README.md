<div align="center">
<h1>
  <img src="https://github.com/Tejaromalius/CommonBash/blob/main/assets/icon.png" alt="Icon" width=10% />

  CommonBash
</h1>
<h3> Recipes for a Better Workflow </h3>

![GitHub Tag](https://img.shields.io/github/v/tag/Tejaromalius/CommonBash?label=Tag)
![GitHub License](https://img.shields.io/github/license/Tejaromalius/CommonBash?label=License)

</div>



The **CommonBash** project provides a flexible script installation and management system for Bash recipes. It allows users to _download_, _manage_, and _execute_ Bash utilities (called **recipes**) from a central repository. The system consists of two primary scripts and a set of recipes, making it easy to extend and customize Bash functionality.

### Features & Usage:
Run the script using:
```bash
common-bash [[OPTION]] [RECIPE_NAME]
```

#### Options:
- `[RECIPE_NAME]`: Fetch a specific recipe by name.
- `--all`: Fetch all recipes from the repository.
- `--list`: List all available recipes in the repository.
- `--delete [RECIPE_NAME]`: Delete a specific recipe.
- `--help`: Display usage information.


### Installation
The `INSTALL.sh` script is used to install the `common-bash` script to the user's system. This script also ensures that the user's environment is set up correctly for using CommonBash recipes:

    bash <(curl -sSL https://raw.githubusercontent.com/Tejaromalius/CommonBash/main/INSTALL.sh)

#### Functionality:
- Ensures the target directory (`~/.local/bin`) exists.
- Downloads the `common-bash` script into the directory.
- Makes the script executable.
- Checks if `~/.local/bin` is in the user's PATH. If not, adds it to the `~/.bashrc` file.

  > Remember to restart terminal once installed!

## Available Recipes

- [**condanv**](src/recipes/condanv/condanv.sh): Automatic detection and activation of Conda environments.
- [**ezal**](src/recipes/ezal/ezal.sh): Pre-configured 'eza' command for enhanced `ls` output.
- [**glog**](src/recipes/glog/glog.sh): Git extension for visually appealing waterfall logs.
- [**gstat**](src/recipes/gstat/gstat.sh): Git extension for a more readable status output.
- [**kync**](src/recipes/kync/kync.sh): Quickly synchronize Ubuntu's main theme accent with Asus keyboard colors.
- [**lsports**](src/recipes/lsports/lsports.sh): Display detailed information about active network ports.
- [**lsps**](src/recipes/lsps/lsps.sh): Manage processes. Use lsps-c for CPU-sorted processes and lsps-m for memory-sorted processes.
- [**myip**](src/recipes/myip/myip.sh): Quickly view your public IP address.
- [**npc**](src/recipes/npc/npc.sh): Remove all Python cache files (`__pycache__`) from the current directory.
- [**seek**](src/recipes/seek/seek.sh): Perform quick searches for files or directories.
- [**sizeof**](src/recipes/sizeof/sizeof.sh): Calculate and display the size of files and directories.
- [**snvim**](src/recipes/snvim/snvim.sh): Launch your pre-configured Neovim session with sudo privilege.
- [**tradency**](src/recipes/tradency/tradency.sh): List reverse dependencies for an installed package, highlighting all dependent packages in a formatted, numbered list.
- [**trash**](src/recipes/trash/trash.sh): Safely move files to a trash folder instead of deleting them.
- [**venv**](src/recipes/venv/venv.sh): Quickly create and activate Python virtual environments.

---
Icon design by @[Fuwa Team](https://iconscout.com/contributors/fuwa)