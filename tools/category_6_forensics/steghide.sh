#!/bin/bash
# Cywallearn - CRAB v1 - Steghide
source "$(dirname "$0")/../../config/colors.sh"
if ! command -v steghide &>/dev/null; then echo -e "${C_RED}[!] steghide not installed${C_RESET}"; exit 1; fi
echo -e "${C_BCYAN}Steghide - Steganography${C_RESET}"
if [[ $# -eq 0 ]]; then
    echo -ne "${C_YELLOW}Image file:${C_RESET} "; read -r img
    echo -ne "${C_YELLOW}Extract? [y/N] (else embed):${C_RESET} "; read -r m
    if [[ "$m" =~ [yY] ]]; then steghide extract -sf "$img"; else steghide embed -cf "$img" -ef secret.txt; fi
else steghide "$@"; fi