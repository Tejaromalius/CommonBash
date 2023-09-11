# set recipe's name
recipe="fancy-log";
# go to the home directory
cd ~;
# download code from github repo and append to .bashrc
curl -sSL https://raw.githubusercontent.com/Tejaromalius/CommonBash/main/scripts/$recipe/$recipe.sh >> .bashrc;
# source the .bashrc
source .bashrc;
# recipe installed! restart terminal and use by running 'fancy-log'!"