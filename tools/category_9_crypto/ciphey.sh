#!/bin/bash
# Cywallearn - CRAB v1 - Ciphey
source "$(dirname "$0")/../../config/colors.sh"
if ! command -v ciphey &>/dev/null; then echo -e "${C_RED}[!] ciphey not installed${C_RESET}"; exit 1; fi
echo -e "${C_BCYAN}Ciphey - Auto Decryption${C_RESET}"
if [[ $# -eq 0 ]]; then echo -ne "${C_YELLOW}Encrypted text:${C_RESET} "; read -r txt; ciphey -t "$txt"; else ciphey "$@"; fi