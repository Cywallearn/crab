#!/bin/bash
source "$(dirname "$0")/../../config/colors.sh"
if ! command -v neofetch &>/dev/null; then echo -e "${C_RED}[!] neofetch not installed${C_RESET}"; exit 1; fi
neofetch