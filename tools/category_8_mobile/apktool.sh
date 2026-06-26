#!/bin/bash
# Cywallearn - CRAB v1 - APKTool
source "$(dirname "$0")/../../config/colors.sh"
if ! command -v apktool &>/dev/null; then echo -e "${C_RED}[!] apktool not installed${C_RESET}"; exit 1; fi
echo -e "${C_BCYAN}APKTool - Reverse Engineering${C_RESET}"
if [[ $# -eq 0 ]]; then
    echo -ne "${C_YELLOW}APK file:${C_RESET} "; read -r apk
    echo -ne "${C_YELLOW}Action [d=decompile, b=build]:${C_RESET} "; read -r a
    if [[ "$a" == "d" ]]; then apktool d "$apk"; else apktool b "$apk"; fi
else apktool "$@"; fi