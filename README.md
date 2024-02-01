# CommonBash: Recipes for a Better Workflow
![GitHub Tag](https://img.shields.io/github/v/tag/Tejaromalius/CommonBash?label=Tag)
![GitHub License](https://img.shields.io/github/license/Tejaromalius/CommonBash?label=License)


_CommonBash_ is a cookbook containing simple, yet, effective 'recipes' to improve the overall workflow in **Linux** environments.

## Installation
### Piece of cake method (aka easy way)
Replacing `recipes_name` with the actual name, run the following command in terminal:

    bash <(curl -sSL https://raw.githubusercontent.com/Tejaromalius/CommonBash/main/INSTALL.sh) recipes_name

### John Wick method (aka hard way)
To use these recipes for current user:
    
1. copy the bash script from an .sh file
2. paste to the end of `.bashrc` located in `/home/[your_username]/`
3. run `source .bashrc`
4. voila!

> Remember to restart terminal once installed!

## Available Recipes
- [**condanv**](recipes/condanv/condanv.sh): automatic Conda environment detection & activation
- [**glog**](recipes/glog/glog.sh): git extension for beautiful waterfall log
- [**gstat**](recipes/gstat/gstat.sh): git extension for clearer status
- [**exal**](recipes/exal/exal.sh): pre-configured 'exa' command for a sexy `ls` output
- [**npc**](recipes/npc/npc.sh): get rid of the all pycaches in the current directory
- [**myip**](recipes/myip/myip.sh): see your public ip address quickly