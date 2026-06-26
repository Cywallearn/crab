#!/bin/bash
# Cywallearn - CRAB v1 - Masscan Port Scanner
# Fastest port scanner - scans entire internet in minutes

source "$(dirname "$0")/../../config/colors.sh"

if ! command -v masscan &>/dev/null; then
    echo -e "${C_RED}[!] masscan not installed. Install: pkg install masscan${C_RESET}"
    echo -ne "${C_YELLOW}Install now? [y/N]:${C_RESET} "; read -r i
    [[ "$i" =~ [yY] ]] && apt install masscan -y || exit 1
fi

echo -e "${C_BCYAN}Masscan - Mass IP Scanner${C_RESET}"
echo -e "${C_BCYAN}─────────────────────────${C_RESET}"
echo -e "${C_YELLOW}Usage: masscan [target] -p[ports] --rate=[speed]${C_RESET}"
echo -e "${C_YELLOW}Example: masscan 192.168.1.0/24 -p80,443 --rate=1000${C_RESET}"
echo

if [[ $# -eq 0 ]]; then
    echo -ne "${C_YELLOW}Target (IP/CIDR):${C_RESET} "; read -r target
    echo -ne "${C_YELLOW}Ports (e.g., 80,443 or 1-1000):${C_RESET} "; read -r ports
    echo -ne "${C_YELLOW}Rate (pkt/sec, default 100):${C_RESET} "; read -r rate
    rate=${rate:-100}
    masscan "$target" -p"$ports" --rate="$rate"
else
    masscan "$@"
fi
