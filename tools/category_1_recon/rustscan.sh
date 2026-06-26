#!/bin/bash
# Cywallearn - CRAB v1 - RustScan
# Blazing fast port scanner written in Rust

source "$(dirname "$0")/../../config/colors.sh"

if ! command -v rustscan &>/dev/null; then
    echo -e "${C_RED}[!] rustscan not installed${C_RESET}"
    echo -e "${C_YELLOW}Install: cargo install rustscan${C_RESET}"
    exit 1
fi

echo -e "${C_BCYAN}RustScan - Ultra Fast Port Scanner${C_RESET}"
echo -e "${C_BCYAN}──────────────────────────────────${C_RESET}"
echo -e "${C_YELLOW}Usage: rustscan [options] -- [nmap args]${C_RESET}"
echo -e "${C_YELLOW}Example: rustscan -a 192.168.1.1 -- -sV${C_RESET}"
echo

if [[ $# -eq 0 ]]; then
    echo -ne "${C_YELLOW}Target:${C_RESET} "; read -r target
    rustscan -a "$target" -- -sV -sC
else
    rustscan "$@"
fi
