#!/bin/bash
# Cywallearn - CRAB v1 - HashRat
source "$(dirname "$0")/../../config/colors.sh"
echo -e "${C_BCYAN}HashRat - Hash Identifier${C_RESET}"
if [[ $# -eq 0 ]]; then echo -ne "${C_YELLOW}Hash:${C_RESET} "; read -r hash; hash-identifier "$hash" 2>/dev/null || hashid -m "$hash"; fi