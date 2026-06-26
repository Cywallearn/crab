#!/bin/bash
# Cywallearn - CRAB v1 - Subfinder
# Passive subdomain discovery tool

source "$(dirname "$0")/../../config/colors.sh"

if ! command -v subfinder &>/dev/null; then
    echo -e "${C_RED}[!] subfinder not installed${C_RESET}"
    echo -e "${C_YELLOW}Install: go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest${C_RESET}"
    exit 1
fi

echo -e "${C_BCYAN}Subfinder - Subdomain Discovery${C_RESET}"
echo -e "${C_BCYAN}──────────────────────────────${C_RESET}"

if [[ $# -eq 0 ]]; then
    echo -ne "${C_YELLOW}Domain:${C_RESET} "; read -r domain
    echo -ne "${C_YELLOW}Output file [subs.txt]:${C_RESET} "; read -r output
    output=${output:-subs.txt}
    subfinder -d "$domain" -o "$output"
    echo -e "${C_GREEN}[✓] Results saved to $output${C_RESET}"
else
    subfinder "$@"
fi
