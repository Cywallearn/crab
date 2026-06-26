#!/bin/bash
# Cywallearn - CRAB v1 - HashID
source "$(dirname "$0")/../../config/colors.sh"
if ! command -v hashid &>/dev/null; then echo -e "${C_RED}[!] hashid not installed${C_RESET}"; exit 1; fi
echo -e "${C_BCYAN}HashID - Hash Type Detection${C_RESET}"
if [[ $# -eq 0 ]]; then echo -ne "${C_YELLOW}Hash:${C_RESET} "; read -r hash; hashid -m "$hash"; else hashid "$@"; fi