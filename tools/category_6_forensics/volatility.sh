#!/bin/bash
# Cywallearn - CRAB v1 - Volatility
# Memory forensics framework
source "$(dirname "$0")/../../config/colors.sh"
if ! command -v volatility &>/dev/null; then
    echo -e "${C_RED}[!] volatility not installed${C_RESET}"
    exit 1
fi
echo -e "${C_BCYAN}Volatility - Memory Forensics${C_RESET}"
echo -e "${C_YELLOW}Common: imageinfo, pslist, netscan, filescan, hivelist${C_RESET}"
if [[ $# -eq 0 ]]; then
    echo -ne "${C_YELLOW}Memory dump file:${C_RESET} "; read -r dump
    echo -ne "${C_YELLOW}Plugin (e.g., imageinfo):${C_RESET} "; read -r plugin
    volatility -f "$dump" "$plugin"
else
    volatility "$@"
fi