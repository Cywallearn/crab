#!/bin/bash
source "$(dirname "$0")/../../config/colors.sh"
if ! command -v vim &>/dev/null; then echo -e "${C_RED}[!] vim not installed${C_RESET}"; exit 1; fi
echo -e "${C_BCYAN}Vim - Text Editor${C_RESET}"
if [[ $# -eq 0 ]]; then vim; else vim "$@"; fi