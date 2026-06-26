#!/bin/bash
# Cywallearn - CRAB v1 - Evilginx
source "$(dirname "$0")/../../config/colors.sh"
echo -e "${C_BCYAN}Evilginx - Phishing Proxy${C_RESET}"
if [ -f "$HOME/evilginx/evilginx" ]; then cd "$HOME/evilginx" && ./evilginx; else
    echo -e "${C_YELLOW}Install: git clone https://github.com/kgretzky/evilginx${C_RESET}"
fi