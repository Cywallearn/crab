#!/bin/bash
source "$(dirname "$0")/../../config/colors.sh"
if ! command -v node &>/dev/null; then echo -e "${C_RED}[!] node not installed${C_RESET}"; exit 1; fi
echo -e "${C_BCYAN}Node.js${C_RESET}"
echo -e "Node: $(node --version)  |  NPM: $(npm --version)"
echo -e "${C_YELLOW}Starting Node REPL...${C_RESET}"
node