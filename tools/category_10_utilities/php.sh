#!/bin/bash
source "$(dirname "$0")/../../config/colors.sh"
if ! command -v php &>/dev/null; then echo -e "${C_RED}[!] php not installed${C_RESET}"; exit 1; fi
echo -e "${C_BCYAN}PHP Server${C_RESET}"
if [[ $# -eq 0 ]]; then
    echo -ne "${C_YELLOW}Port [8080]:${C_RESET} "; read -r port
    port=${port:-8080}
    echo -e "${C_YELLOW}Starting PHP dev server on 0.0.0.0:$port${C_RESET}"
    php -S 0.0.0.0:"$port"
else
    php "$@"
fi