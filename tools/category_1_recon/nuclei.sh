#!/bin/bash
# Cywallearn - CRAB v1 - Nuclei
# Fast vulnerability scanner with YAML templates

source "$(dirname "$0")/../../config/colors.sh"

if ! command -v nuclei &>/dev/null; then
    echo -e "${C_RED}[!] nuclei not installed${C_RESET}"
    echo -e "${C_YELLOW}Install: go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest${C_RESET}"
    exit 1
fi

echo -e "${C_BCYAN}Nuclei - Vulnerability Scanner${C_RESET}"
echo -e "${C_BCYAN}────────────────────────────${C_RESET}"

if [[ $# -eq 0 ]]; then
    echo -ne "${C_YELLOW}Target URL:${C_RESET} "; read -r target
    echo -ne "${C_YELLOW}Severity [critical/high/medium/low/all]:${C_RESET} "; read -r sev
    sev=${sev:-critical,high}
    nuclei -u "$target" -severity "$sev" -stats
else
    nuclei "$@"
fi
