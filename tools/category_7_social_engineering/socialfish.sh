#!/bin/bash
# Cywallearn - CRAB v1 - SocialFish
source "$(dirname "$0")/../../config/colors.sh"
if [ -d "$HOME/SocialFish" ]; then cd "$HOME/SocialFish" && python3 SocialFish.py; else
    echo -e "${C_YELLOW}Install: git clone https://github.com/UndeadSec/SocialFish${C_RESET}"
fi