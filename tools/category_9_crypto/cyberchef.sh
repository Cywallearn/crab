#!/bin/bash
# Cywallearn - CRAB v1 - CyberChef
source "$(dirname "$0")/../../config/colors.sh"
echo -e "${C_BCYAN}CyberChef - Data Analysis${C_RESET}"
echo -e "${C_YELLOW}Opening web tool...${C_RESET}"
termux-open-url "https://gchq.github.io/CyberChef/" 2>/dev/null || echo "Open manually: https://gchq.github.io/CyberChef/"