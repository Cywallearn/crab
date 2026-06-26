#!/bin/bash
# Cywallearn - CRAB v1 - Sleuth Kit
# Disk forensics toolkit
source "$(dirname "$0")/../../config/colors.sh"
if ! command -v fls &>/dev/null; then
    echo -e "${C_RED}[!] sleuthkit not installed${C_RESET}"
    exit 1
fi
echo -e "${C_BCYAN}Sleuth Kit - Disk Forensics${C_RESET}"
echo -e "${C_YELLOW}Tools: fls (list), icat (cat), mmls (partition), strings${C_RESET}"
if [[ $# -eq 0 ]]; then
    echo -ne "${C_YELLOW}Image file:${C_RESET} "; read -r img
    echo -ne "${C_YELLOW}Action [fls/mmls/fsstat]:${C_RESET} "; read -r act
    case "$act" in
        fls) fls -r "$img" ;;
        mmls) mmls "$img" ;;
        fsstat) fsstat "$img" ;;
    esac
else
    "$@"
fi