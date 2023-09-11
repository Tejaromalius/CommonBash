# CommonBash: Recipes for a Better Workflow
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
- [**activenv**](scripts/activenv/activenv.sh): automatic Conda environment detection & activation
- [**fancy-log**](scripts/fancy-log/fancy-log.sh): git extension for a clearer log display
