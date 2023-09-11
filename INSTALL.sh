# read recipe's name
recipe="$1";
# go to the home directory
cd ~;
# check recipe's existance
if grep -q -w "$recipe" ~/.bashrc; then
    echo -e "\033[0;33mrecipe exists in ~/.bashrc. \033[0;31maborting..\033[0m"
else
    # recipe doesn't exist
    # download code from github repo
    request_result="$(curl -sSL https://raw.githubusercontent.com/Tejaromalius/CommonBash/main/scripts/$recipe/$recipe.sh)";
    if [ "$request_result" != "404: Not Found" ]; then
        # recipe exists in repo
        # append recipe to .bashrc
        echo "$request_result" >> .bashrc;
        # source the .bashrc
        source .bashrc;
        echo -e "\033[0;32mrecipe installed! restart terminal and use by running '$recipe'! \033[0m"
    else
        echo -e "\033[0;33mrecipe not found in repo. \033[0;31maborting..\033[0m"
    fi
fi
