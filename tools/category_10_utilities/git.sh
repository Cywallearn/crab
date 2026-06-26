#!/bin/bash
source "$(dirname "$0")/../../config/colors.sh"
if ! command -v git &>/dev/null; then echo -e "${C_RED}[!] git not installed${C_RESET}"; exit 1; fi
echo -e "${C_BCYAN}Git - Version Control${C_RESET}"
echo -e "Version: $(git --version)"
if [[ $# -eq 0 ]]; then
    echo -ne "${C_YELLOW}Git command:${C_RESET} "; read -r cmd
    git $cmd
else
    git "$@"
fi