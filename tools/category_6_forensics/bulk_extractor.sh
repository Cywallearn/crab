#!/bin/bash
# Cywallearn - CRAB v1 - Bulk Extractor
source "$(dirname "$0")/../../config/colors.sh"
if ! command -v bulk_extractor &>/dev/null; then echo -e "${C_RED}[!] bulk_extractor not installed${C_RESET}"; exit 1; fi
echo -e "${C_BCYAN}Bulk Extractor - Evidence Extraction${C_RESET}"
if [[ $# -eq 0 ]]; then
    echo -ne "${C_YELLOW}Image file:${C_RESET} "; read -r img
    echo -ne "${C_YELLOW}Output dir:${C_RESET} "; read -r out
    bulk_extractor -o "$out" "$img"
else bulk_extractor "$@"; fi