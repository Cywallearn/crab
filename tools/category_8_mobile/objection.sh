#!/bin/bash
# Cywallearn - CRAB v1 - Objection
source "$(dirname "$0")/../../config/colors.sh"
if ! command -v objection &>/dev/null; then echo -e "${C_RED}[!] objection not installed${C_RESET}"; exit 1; fi
echo -e "${C_BCYAN}Objection - Runtime Explorer${C_RESET}"
if [[ $# -eq 0 ]]; then echo -ne "${C_YELLOW}Package:${C_RESET} "; read -r pkg; objection -g "$pkg" explore; else objection "$@"; fi