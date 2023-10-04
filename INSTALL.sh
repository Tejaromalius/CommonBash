#! /usr/bin/bash

bashrc_path="$HOME/.bashrc"
recipes_path="$HOME/.recipes"

# check recipe's existance
if ! grep -q -x "source $recipes_path" "$bashrc_path"; then
    printf "\nsource %s" "$recipes_path" >> "$bashrc_path"
fi

# read recipe's name
recipe="$1";

# download code from github repo
request_result="$(curl -sSL https://raw.githubusercontent.com/Tejaromalius/CommonBash/main/recipes/"$recipe"/"$recipe.sh")";
if [ "$request_result" != "404: Not Found" ]; then
    # recipe exists in repo
    # check output file's existence
    if [ ! -f "$recipes_path" ] > /dev/null; then
        # output doesn't exist. creating new one
        touch "$recipes_path"
    else
        # check recipe's existance
        if grep -q -w "$recipe" "$recipes_path"; then
            echo -e "\033[0;33m'$recipe' exists in ~/.recipes. \033[0;32mupdating..\033[0m"

            start_marker="# >>> $recipe >>>"
            end_marker="# <<< $recipe <<<"
            
            # remove the old recipe
            sed -i "/$start_marker/,/$end_marker/d" "$recipes_path"
        fi
    fi

    # append recipe to .recipes file
    printf "%s\n" "$request_result" >> "$recipes_path"
    echo -e "\033[0;32mdone! restart terminal and run '$recipe'! \033[0m"
else
    echo -e "\033[0;33m'$recipe' not found in repo. \033[0;31maborting..\033[0m"
fi
