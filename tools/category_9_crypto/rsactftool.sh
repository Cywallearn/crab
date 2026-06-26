#!/bin/bash
# Cywallearn - CRAB v1 - RSACTFTool
source "$(dirname "$0")/../../config/colors.sh"
if [ ! -d "$HOME/RsaCtfTool" ]; then echo -e "${C_YELLOW}Install: git clone https://github.com/Ganapati/RsaCtfTool${C_RESET}"; exit 1; fi
cd "$HOME/RsaCtfTool" && python3 RsaCtfTool.py "$@"