#!/bin/bash
# Cywallearn - CRAB v1 - JadX
source "$(dirname "$0")/../../config/colors.sh"
if ! command -v jadx &>/dev/null; then echo -e "${C_RED}[!] jadx not installed${C_RESET}"; exit 1; fi
echo -e "${C_BCYAN}JadX - Android Decompiler${C_RESET}"
if [[ $# -eq 0 ]]; then echo -ne "${C_YELLOW}APK file:${C_RESET} "; read -r f; jadx "$f"; else jadx "$@"; fi