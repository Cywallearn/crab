#!/bin/bash
source "$(dirname "$0")/../../config/colors.sh"
echo -e "${C_BCYAN}Python3 Environment${C_RESET}"
python3 --version
echo -e "${C_YELLOW}Starting Python shell...${C_RESET}"
python3