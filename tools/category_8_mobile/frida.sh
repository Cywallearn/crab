#!/bin/bash
# Cywallearn - CRAB v1 - Frida
source "$(dirname "$0")/../../config/colors.sh"
if ! command -v frida &>/dev/null; then echo -e "${C_RED}[!] frida not installed${C_RESET}"; exit 1; fi
echo -e "${C_BCYAN}Frida - Dynamic Instrumentation${C_RESET}"
frida-ps -U 2>/dev/null || frida-ps