#!/bin/bash
# Cywallearn - CRAB v1 - SEToolkit
source "$(dirname "$0")/../../config/colors.sh"
if ! command -v setoolkit &>/dev/null; then echo -e "${C_RED}[!] setoolkit not installed${C_RESET}"; exit 1; fi
echo -e "${C_BCYAN}SET - Social Engineering Toolkit${C_RESET}"
setoolkit