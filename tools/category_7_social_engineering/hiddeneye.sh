#!/bin/bash
# Cywallearn - CRAB v1 - HiddenEye
source "$(dirname "$0")/../../config/colors.sh"
if [ -d "$HOME/HiddenEye" ]; then cd "$HOME/HiddenEye" && python3 HiddenEye.py; else
    echo -e "${C_YELLOW}Install: git clone https://github.com/DarkSecDevelopers/HiddenEye${C_RESET}"
fi