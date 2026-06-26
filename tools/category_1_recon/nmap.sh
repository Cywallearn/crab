#!/bin/bash
# Cywallearn - CRAB v1 - Nmap Network Scanner
# Network discovery, port scanning, and service enumeration

source "$(dirname "$0")/../../config/colors.sh"

show_help() {
    echo -e "${C_BCYAN}Nmap - Network Mapper${C_RESET}"
    echo "Usage: nmap [scan type] [options] [target]"
    echo
    echo "Common Examples:"
    echo "  nmap -sV 192.168.1.1           # Version detection"
    echo "  nmap -A -T4 scanme.nmap.org    # Aggressive scan"
    echo "  nmap -p 1-1000 10.0.0.1        # Port range scan"
    echo "  nmap -sS -sV -O 192.168.1.0/24 # Stealth + OS detection"
    echo "  nmap -sn 192.168.1.0/24        # Ping sweep (no port scan)"
    echo
    echo "Flags: -sS (SYN), -sT (TCP), -sU (UDP), -sV (Version), -O (OS)"
    echo "       -A (Aggressive), -T[0-5] (Timing), -p (Ports), -oN (Output)"
}

if [[ "$1" == "--help" || "$1" == "-h" ]]; then
    show_help
    exit 0
fi

if ! command -v nmap &>/dev/null; then
    echo -e "${C_RED}[!] nmap not installed. Install: pkg install nmap${C_RESET}"
    echo -ne "${C_YELLOW}Install now? [y/N]:${C_RESET} "
    read -r install
    if [[ "$install" == "y" || "$install" == "Y" ]]; then
        apt install nmap -y
    else
        exit 1
    fi
fi

echo -e "${C_CYAN}[*] Nmap Network Scanner${C_RESET}"
echo -e "${C_BCYAN}─────────────────────────${C_RESET}"

if [[ $# -eq 0 ]]; then
    echo -ne "${C_YELLOW}Enter target (IP/domain):${C_RESET} "
    read -r target
    echo -ne "${C_YELLOW}Scan type [quick/full/stealth/version]:${C_RESET} "
    read -r stype
    
    case "$stype" in
        quick)     nmap -T4 -F "$target" ;;
        full)      nmap -T4 -p- "$target" ;;
        stealth)   nmap -sS -sV -O -T4 "$target" ;;
        version)   nmap -sV -sC -T4 "$target" ;;
        *)         nmap "$target" ;;
    esac
else
    nmap "$@"
fi

echo
echo -e "${C_YELLOW}[!] Scan complete. Use --help for nmap options.${C_RESET}"
