#!/bin/bash 
# Cywallearn - CRAB v1 - Foremost 
# File carving tool 
 
source "$(dirname "$0")/../../config/colors.sh" 
echo -e "${C_BCYAN}Foremost - File Carving${C_RESET}" 
if [[ $# -eq 0 ]]; then 
    echo -ne "${C_YELLOW}Image file:${C_RESET} "; read -r img 
    echo -ne "${C_YELLOW}Output dir:${C_RESET} "; read -r out 
    out=${out:-recovered} 
    foremost -i "$img" -o "$out" 
else 
    foremost "$@" 
fi
