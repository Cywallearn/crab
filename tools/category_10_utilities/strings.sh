#!/bin/bash
source "$(dirname "$0")/../../config/colors.sh"
if ! command -v strings &>/dev/null; then echo -e "${C_RED}[!] binutils not installed${C_RESET}"; exit 1; fi
echo -e "${C_BCYAN}Strings - Extract Printable Strings${C_RESET}"
if [[ $# -eq 0 ]]; then
    echo -ne "${C_YELLOW}File:${C_RESET} "; read -r f
    echo -ne "${C_YELLOW}Minimum length [4]:${C_RESET} "; read -r len
    len=${len:-4}
    strings -n "$len" "$f" | head -100
else
    strings "$@"
fi