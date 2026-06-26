#!/bin/bash
# Cywallearn - CRAB v1 - Phishing Framework
source "$(dirname "$0")/../../config/colors.sh"
echo -e "${C_BCYAN}Phishing Framework${C_RESET}"
echo -e "1. HiddenEye  2. SocialFish  3. Gophish"
echo -ne "${C_YELLOW}Select:${C_RESET} "; read -r m
case "$m" in
    1) [[ -d "$HOME/HiddenEye" ]] && cd "$HOME/HiddenEye" && python3 HiddenEye.py || echo "Not installed" ;;
    2) [[ -d "$HOME/SocialFish" ]] && cd "$HOME/SocialFish" && python3 SocialFish.py || echo "Not installed" ;;
    3) [[ -d "$HOME/gophish" ]] && cd "$HOME/gophish" && ./gophish || echo "Not installed" ;;
esac