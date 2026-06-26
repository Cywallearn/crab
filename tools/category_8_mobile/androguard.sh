#!/bin/bash
# Cywallearn - CRAB v1 - Androguard
source "$(dirname "$0")/../../config/colors.sh"
if ! python3 -c "import androguard" &>/dev/null; then echo -e "${C_RED}[!] androguard not installed${C_RESET}"; exit 1; fi
echo -e "${C_BCYAN}Androguard - APK Analysis${C_RESET}"
if [[ $# -eq 0 ]]; then
    echo -ne "${C_YELLOW}APK file:${C_RESET} "; read -r apk
    python3 -c "from androguard.misc import AnalyzeAPK; a,d,dx=AnalyzeAPK('$apk'); print('Permissions:',a.get_permissions()); print('Activities:',a.get_activities())"
fi