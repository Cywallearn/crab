#!/bin/bash
# Cywallearn - CRAB v1 - ExifTool - Metadata analysis
source "$(dirname "$0")/../../config/colors.sh"
if ! command -v exiftool &>/dev/null; then echo -e "${C_RED}[!] exiftool not installed${C_RESET}"; exit 1; fi
echo -e "${C_BCYAN}ExifTool - Metadata Analyzer${C_RESET}"
if [[ $# -eq 0 ]]; then echo -ne "${C_YELLOW}File:${C_RESET} "; read -r f; exiftool "$f"; else exiftool "$@"; fi