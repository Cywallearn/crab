#!/bin/bash
# Cywallearn - CRAB v1 - HTTPx
# Fast HTTP probe tool

source "$(dirname "$0")/../../config/colors.sh"

if ! command -v httpx &>/dev/null; then
    echo -e "${C_RED}[!] httpx not installed${C_RESET}"
    echo -e "${C_YELLOW}Install: go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest${C_RESET}"
    exit 1
fi

echo -e "${C_BCYAN}HTTPx - HTTP Probe${C_RESET}"
echo -e "${C_BCYAN}────────────────${C_RESET}"
echo -e "${C_YELLOW}Usage: cat urls.txt | httpx -status-code -title${C_RESET}"
echo

if [[ $# -eq 0 ]]; then
    echo -ne "${C_YELLOW}Target URL:${C_RESET} "; read -r target
    echo "$target" | httpx -status-code -title -content-type -follow-redirects
else
    httpx "$@"
fi
