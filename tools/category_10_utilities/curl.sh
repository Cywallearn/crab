#!/bin/bash
source "$(dirname "$0")/../../config/colors.sh"
if ! command -v curl &>/dev/null; then echo -e "${C_RED}[!] curl not installed${C_RESET}"; exit 1; fi
echo -e "${C_BCYAN}Curl - HTTP Client${C_RESET}"
if [[ $# -eq 0 ]]; then
    echo -ne "${C_YELLOW}URL:${C_RESET} "; read -r url
    curl -v "$url"
else
    curl "$@"
fi