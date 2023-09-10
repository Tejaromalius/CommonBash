# CommonBash: Recipes for a Better Workflow
_CommonBash_ is a cookbook containing simple, yet, effective 'recipes' to improve the overall workflow in **Linux** environments.

## Installation
### Piece of cake method (aka easy way)
Replacing [recipe's name], run the following command in terminal:

    curl -sSL https://raw.githubusercontent.com/Tejaromalius/CommonBash/main/scripts/[recipe's name]/INSTALL.sh | bash -i 

### John Wick method (aka hard way)
To use these recipes for current user:
    
1. copy the bash script from an .sh file
2. paste to the end of `.bashrc` located in `/home/[your_username]/`
3. run `source .bashrc`
4. voila!

> Remember to restart terminal once installed!

## Available Recipes
- [**activenv**](scripts/activenv/activenv.sh): automatic Conda environment detection & activation