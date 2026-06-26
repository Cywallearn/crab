#!/bin/bash
# Cywallearn - CRAB v1 - GoPhish
source "$(dirname "$0")/../../config/colors.sh"
if [ -d "$HOME/gophish" ]; then cd "$HOME/gophish" && ./gophish; else
    echo -e "${C_YELLOW}Install from: https://github.com/gophish/gophish/releases${C_RESET}"
fi