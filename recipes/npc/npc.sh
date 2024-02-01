# >>> npc >>>
npc() {
    local cache_directories=("__pycache__" ".pytest_cache" "")

    for directory in "${cache_directories[@]}"; do
        find . -maxdepth 5 -type d -name "$directory" -exec rm -r {} +
    done
    printf "\e[1;33mNo Python Cache directories anymore! \n\e[0m"
}
# <<< npc <<<
