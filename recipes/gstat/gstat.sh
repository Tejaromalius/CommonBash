# >>> gstat >>>
gstat() {
    # define color codes for formatting text
    RED='\033[0;31m'
    GREEN='\033[0;32m'
    YELLOW='\033[0;33m'
    BLUE='\033[0;34m'
    BOLD='\033[1m'
    RESET='\033[0m'
    # get the current Git branch's name.
    local branch
    branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    # check if the current directory is not a Git repository.
    if ! git rev-parse --is-inside-work-tree &>/dev/null; then
        echo -e "${RED}Not in a Git repository.${RESET}"
        return 1
    fi
    # declare variables to store information about branch status.
    local ahead behind staged modified untracked
    # get the number of commits ahead of the upstream branch.
    ahead=$(git rev-list --count HEAD..@"upstream" 2>/dev/null)
    # get the number of commits behind the upstream branch.
    behind=$(git rev-list --count @"upstream"..HEAD 2>/dev/null)
    # get the number of staged (indexed) files.
    staged=$(git diff --cached --numstat | wc -l)
    # get the number of modified but not staged files.
    modified=$(git diff --numstat | wc -l)
    # get the number of untracked files.
    untracked=$(git ls-files --others --exclude-standard | wc -l)
    # display branch name and status information.
    echo -e "${BOLD}Branch: ${BLUE}$branch${RESET}"
    if [[ -n "$ahead" ]]; then
        echo -e "${YELLOW}Ahead of upstream: ${ahead} commits${RESET}"
    fi
    if [[ -n "$behind" ]]; then
        echo -e "${YELLOW}Behind upstream: ${behind} commits${RESET}"
    fi
    echo
    echo -e "${GREEN}Staged: ${staged} files${RESET}"
    echo -e "${GREEN}Modified: ${modified} files${RESET}"
    echo -e "${RED}Untracked: ${untracked} files${RESET}"
    # get the short status of the working directory.
    local status
    status=$(git status --short)
    # display uncommitted changes if there are any.
    if [[ -n "$status" ]]; then
        echo -e "\n${BOLD}Changes:${RESET}\n$status"
    fi
}
# <<< gstat <<<
