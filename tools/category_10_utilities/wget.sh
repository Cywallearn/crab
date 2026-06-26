#!/bin/bash
source "$(dirname "$0")/../../config/colors.sh"
if ! command -v wget &>/dev/null; then echo -e "${C_RED}[!] wget not installed${C_RESET}"; exit 1; fi
echo -e "${C_BCYAN}Wget - Downloader${C_RESET}"
if [[ $# -eq 0 ]]; then
    echo -ne "${C_YELLOW}URL:${C_RESET} "; read -r url
    wget "$url"
else
    wget "$@"
fi