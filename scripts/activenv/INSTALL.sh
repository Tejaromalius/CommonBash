# set recipe's name
recipe="activenv";
# go to the home directory
cd ~;
# check recipe's existance
if grep -q "$recipe" ~/.bashrc; then
    echo -e "\033[0;33mrecipe exists in ~/.bashrc. \033[0;31maborting..\033[0m"
else
    # recipe doesn't exist
    # download code from github repo and append to .bashrc
    curl -sSL https://raw.githubusercontent.com/Tejaromalius/CommonBash/main/scripts/$recipe/$recipe.sh >> .bashrc;
    # source the .bashrc
    source .bashrc;
    echo -e "\033[0;32mrecipe installed! restart terminal and use by running '$recipe'! \033[0m"
fi
