#! /usr/bin/bash

bashrc_path="$HOME/.bashrc"
recipes_path="$HOME/.recipes"

if ! grep -q -x "source $recipes_path" "$bashrc_path"; then
    printf "\nsource %s" "$recipes_path" >> "$bashrc_path"
fi

recipe="$1";

request_result="$(curl -sSL https://raw.githubusercontent.com/Tejaromalius/CommonBash/main/recipes/"$recipe"/"$recipe.sh")";
if [ "$request_result" != "404: Not Found" ]; then
    if [ ! -f "$recipes_path" ] > /dev/null; then
        touch "$recipes_path"
    else
        if grep -q -w "$recipe" "$recipes_path"; then
            echo -e "\033[0;33m'$recipe' exists in ~/.recipes. \033[0;32mupdating..\033[0m"

            start_marker="# >>> $recipe >>>"
            end_marker="# <<< $recipe <<<"
            
            sed -i "/$start_marker/,/$end_marker/d" "$recipes_path"
        fi
    fi

    printf "%s\n" "$request_result" >> "$recipes_path"
    echo -e "\033[0;32mdone! restart terminal and run '$recipe'! \033[0m"
else
    echo -e "\033[0;33m'$recipe' not found in repo. \033[0;31maborting..\033[0m"
fi
