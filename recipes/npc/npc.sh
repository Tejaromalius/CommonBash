# >>> npc >>>
npc() {
    # define an array of directory names to remove
    local cache_directories=("__pycache__" ".pytest_cache" "")

    # iterate over each directory name
    for directory in "${cache_directories[@]}"; do
        # remove directory using the rm command
        find . -maxdepth 5 -type d -name "$directory" -exec rm -r {} +
    done
    printf "\e[1;33mNo Python Cache directories anymore! \n\e[0m"
}
# <<< npc <<<
