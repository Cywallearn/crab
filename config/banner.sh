#!/bin/bash
# Cywallearn - CRAB v1 - Banner Display

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$SCRIPT_DIR/colors.sh"

show_banner() {
    clear
    cat "$SCRIPT_DIR/banner.txt" 2>/dev/null || echo "Cywallearn CRAB v1"
    echo
    echo -e " ${C_BCYAN}═══════════════════════════════════════════════════════════════${C_RESET}"
    echo -e " ${C_BGREEN}  SYSTEM STATUS${C_RESET}"
    echo -e " ${C_BCYAN}───────────────────────────────────────────────────────────────${C_RESET}"
    
    # Check Termux environment
    if [ -d "/data/data/com.termux" ]; then
        echo -e " ${C_GREEN}[✓]${C_RESET} Running on Termux"
    elif [ -n "$TERMUX_VERSION" ]; then
        echo -e " ${C_GREEN}[✓]${C_RESET} Termux Environment Detected"
    else
        echo -e " ${C_YELLOW}[!]${C_RESET} Running on: $(uname -o 2>/dev/null || echo 'Unknown')"
    fi
    
    # Check storage
    if [ -d "$HOME/storage" ]; then
        echo -e " ${C_GREEN}[✓]${C_RESET} Storage Access: Granted"
    else
        echo -e " ${C_YELLOW}[!]${C_RESET} Storage: Not configured (run: termux-setup-storage)"
    fi
    
    # Check internet
    if ping -c 1 8.8.8.8 >/dev/null 2>&1; then
        echo -e " ${C_GREEN}[✓]${C_RESET} Network: Connected"
    else
        echo -e " ${C_RED}[✗]${C_RESET} Network: Disconnected"
    fi
    
    # Check tools status
    local tools_installed=$(ls "$SCRIPT_DIR/../tools/"*/ 2>/dev/null | wc -l)
    echo -e " ${C_GREEN}[✓]${C_RESET} Tool Modules: $tools_installed available"
    
    echo -e " ${C_BCYAN}───────────────────────────────────────────────────────────────${C_RESET}"
    echo -e " ${C_BYELLOW}  Type 'help' to get started | 'menu' for main menu${C_RESET}"
    echo -e " ${C_BCYAN}═══════════════════════════════════════════════════════════════${C_RESET}"
    echo
}

export -f show_banner
