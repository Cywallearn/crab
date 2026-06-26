#!/bin/bash
# Cywallearn - CRAB v1 - Binwalk
# Firmware analysis tool
source "$(dirname "$0")/../../config/colors.sh"
if ! command -v binwalk &>/dev/null; then
    echo -e "${C_RED}[!] binwalk not installed${C_RESET}"
    exit 1
fi
echo -e "${C_BCYAN}Binwalk - Firmware Analysis${C_RESET}"
if [[ $# -eq 0 ]]; then
    echo -ne "${C_YELLOW}Firmware file:${C_RESET} "; read -r file
    echo -ne "${C_YELLOW}Extract? [y/N]:${C_RESET} "; read -r ext
    if [[ "$ext" =~ [yY] ]]; then binwalk -Me "$file"; else binwalk "$file"; fi
else
    binwalk "$@"
fi