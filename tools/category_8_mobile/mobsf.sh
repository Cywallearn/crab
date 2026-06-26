#!/bin/bash
# Cywallearn - CRAB v1 - MobSF
source "$(dirname "$0")/../../config/colors.sh"
if [ -d "$HOME/Mobile-Security-Framework-MobSF" ]; then
    cd "$HOME/Mobile-Security-Framework-MobSF" && ./run.sh 2>/dev/null || python3 manage.py runserver 0.0.0.0:8000
else echo -e "${C_YELLOW}Install: git clone https://github.com/MobSF/Mobile-Security-Framework-MobSF${C_RESET}"; fi