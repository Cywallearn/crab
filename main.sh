#!/bin/bash
#=============================================================================
# Cywallearn - CRAB v1
# Ultimate Termux Hacking Framework
# Main Entry Point
#=============================================================================

# Strict mode
set -euo pipefail

# Script directory
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
export CYWALLEARN_ROOT="$SCRIPT_DIR"

# Source configuration
source "$SCRIPT_DIR/config/colors.sh" 2>/dev/null
source "$SCRIPT_DIR/config/banner.sh" 2>/dev/null

# Trap for cleanup
trap 'echo -e "\n${C_RESET}${C_YELLOW}[!] Exiting Cywallearn CRAB...${C_RESET}"; exit 0' SIGINT SIGTERM

# Global variables
CURRENT_USER="$(whoami 2>/dev/null || echo 'user')"
DEVICE_NAME="$(uname -n 2>/dev/null || echo 'android')"
ARCH="$(uname -m 2>/dev/null || echo 'aarch64')"
START_TIME="$(date +%s)"

# Check Termux
check_termux() {
    if [ -z "${TERMUX_VERSION:-}" ]; then
        echo -e "${C_YELLOW}[!] Warning: Not running in Termux environment${C_RESET}"
        echo -e "${C_YELLOW}[!] Cywallearn is optimized for Termux on Android${C_RESET}"
        echo -e "${C_YELLOW}[!] Some features may not work properly${C_RESET}"
        sleep 2
    fi
}

# Initialize environment
init_env() {
    # Export paths
    export PATH="$CYWALLEARN_ROOT/core:$CYWALLEARN_ROOT/tools/category_1_recon:$CYWALLEARN_ROOT/tools/category_2_exploitation:$CYWALLEARN_ROOT/tools/category_3_web:$CYWALLEARN_ROOT/tools/category_4_network:$CYWALLEARN_ROOT/tools/category_5_post_exploitation:$CYWALLEARN_ROOT/tools/category_6_forensics:$CYWALLEARN_ROOT/tools/category_7_social_engineering:$CYWALLEARN_ROOT/tools/category_8_mobile:$CYWALLEARN_ROOT/tools/category_9_crypto:$CYWALLEARN_ROOT/tools/category_10_utilities:$CYWALLEARN_ROOT/modules:$PATH"
    
    # Create necessary directories
    mkdir -p "$CYWALLEARN_ROOT/tmp" "$CYWALLEARN_ROOT/sessions" 2>/dev/null
    
    # Source config
    source "$CYWALLEARN_ROOT/config/cywallearn.conf" 2>/dev/null || true
}

# Command executor
execute_command() {
    local cmd="$1"
    shift
    case "$cmd" in
        help|--help|-h)       bash "$CYWALLEARN_CORE/help.sh" "$@" ;;
        menu|--menu|-m)       bash "$CYWALLEARN_ROOT/core/menu.sh" "$@" ;;
        terminal|term)        bash "$CYWALLEARN_ROOT/core/terminal.sh" "$@" ;;
        update|--update|-u)   bash "$CYWALLEARN_ROOT/core/update.sh" "$@" ;;
        tools|--tools)        bash "$CYWALLEARN_ROOT/core/tools_manager.sh" "$@" ;;
        session|sessions)     bash "$CYWALLEARN_ROOT/core/session.sh" "$@" ;;
        recon)                bash "$CYWALLEARN_ROOT/modules/auto_recon.sh" "$@" ;;
        scan)                 bash "$CYWALLEARN_ROOT/modules/auto_scan.sh" "$@" ;;
        exploit)              bash "$CYWALLEARN_ROOT/modules/auto_exploit.sh" "$@" ;;
        web)                  bash "$CYWALLEARN_ROOT/modules/web_scanner.sh" "$@" ;;
        network)              bash "$CYWALLEARN_ROOT/modules/network_attacks.sh" "$@" ;;
        password|crack)       bash "$CYWALLEARN_ROOT/modules/password_attacks.sh" "$@" ;;
        quick)                bash "$CYWALLEARN_ROOT/modules/quick_attack.sh" "$@" ;;
        info|about)           show_about ;;
        banner)               show_banner ;;
        exit|quit)            echo -e "\n${C_GREEN}Bye from Cywallearn CRAB!${C_RESET}"; exit 0 ;;
        *)                    echo -e "${C_RED}[!] Unknown command: $cmd${C_RESET}" ;;
    esac
}

# Show about information
show_about() {
    clear
    echo -e "${C_BCYAN}"
    echo "  ██████╗██╗   ██╗██╗    ██╗ █████╗ ██╗     ██╗     ███████╗ █████╗ ██████╗ ███╗   ██╗"
    echo " ██╔════╝╚██╗ ██╔╝██║    ██║██╔══██╗██║     ██║     ██╔════╝██╔══██╗██╔══██╗████╗  ██║"
    echo " ██║      ╚████╔╝ ██║ █╗ ██║███████║██║     ██║     █████╗  ███████║██████╔╝██╔██╗ ██║"
    echo " ██║       ╚██╔╝  ██║███╗██║██╔══██║██║     ██║     ██╔══╝  ██╔══██║██╔══██╗██║╚██╗██║"
    echo " ╚██████╗   ██║   ╚███╔███╔╝██║  ██║███████╗███████╗███████╗██║  ██║██║  ██║██║ ╚████║"
    echo "  ╚═════╝   ╚═╝    ╚══╝╚══╝ ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝"
    echo -e "${C_RESET}"
    echo -e "${C_BCYAN}═══════════════════════════════════════════════════════════════${C_RESET}"
    echo -e " ${C_BCYAN}▓${C_RESET} ${C_BWHITE}Version    :${C_RESET}  1.0.0 \"CRAB\""
    echo -e " ${C_BCYAN}▓${C_RESET} ${C_BWHITE}Release    :${C_RESET}  2025"
    echo -e " ${C_BCYAN}▓${C_RESET} ${C_BWHITE}Platform   :${C_RESET}  Termux / Android"
    echo -e " ${C_BCYAN}▓${C_RESET} ${C_BWHITE}Author     :${C_RESET}  Cywallearn Team"
    echo -e " ${C_BCYAN}▓${C_RESET} ${C_BWHITE}License    :${C_RESET}  MIT"
    echo -e " ${C_BCYAN}▓${C_RESET} ${C_BWHITE}Tools      :${C_RESET}  50+ Pre-configured"
    echo -e " ${C_BCYAN}▓${C_RESET} ${C_BWHITE}Codename   :${C_RESET}  CRAB - Cyber Recon & Attack Bridge"
    echo -e "${C_BCYAN}═══════════════════════════════════════════════════════════════${C_RESET}"
    echo
    echo -e " ${C_CYAN}Description:${C_RESET}"
    echo -e " Cywallearn CRAB v1 is a comprehensive penetration testing framework"
    echo -e " designed specifically for Termux on Android. It brings Kali Linux-level"
    echo -e " capabilities to your mobile device with 50+ pre-configured tools,"
    echo -e " automated attack modules, and an intuitive terminal interface."
    echo
    echo -e " ${C_CYAN}Key Features:${C_RESET}"
    echo -e "  ${C_GREEN}•${C_RESET} 50+ Pre-installed & Configured Hacking Tools"
    echo -e "  ${C_GREEN}•${C_RESET} Advanced Terminal with Auto-Suggestions"
    echo -e "  ${C_GREEN}•${C_RESET} Automated Attack Modules (One-Click)"
    echo -e "  ${C_GREEN}•${C_RESET} Category-Based Tool Organization"
    echo -e "  ${C_GREEN}•${C_RESET} Built-in Learning Center with Examples"
    echo -e "  ${C_GREEN}•${C_RESET} Session Management & Logging"
    echo -e "  ${C_GREEN}•${C_RESET} Modern UI with Kali Linux Aesthetic"
    echo -e "  ${C_GREEN}•${C_RESET} Quick Attack Mode for Fast Operations"
    echo
    echo -e " ${C_CYAN}DISCLAIMER:${C_RESET} ${C_YELLOW}Use only on systems you own or have"
    echo -e " explicit permission to test.${C_RESET}"
    echo
    echo -e " ${C_YELLOW}Press Enter to continue...${C_RESET}"
    read -r
}

# Interactive shell mode
interactive_shell() {
    show_banner
    
    # PS1 prompt override
    export OLD_PS1="$PS1"
    export PS1="${C_CRAB}[CRAB]${C_RESET}${C_CYAN}[\\A]${C_RESET} ${C_GREEN}\\u${C_RESET}${C_BWHITE}@${C_RESET}${C_BCYAN}\\h${C_RESET} ${C_YELLOW}\\w${C_RESET}\n${C_CRAB}⟫${C_RESET} "
    
    echo -e "${C_GREEN}Welcome to Cywallearn CRAB v1!${C_RESET}"
    echo -e "${C_CYAN}Type 'menu' for main menu | 'help' for help | 'exit' to quit${C_RESET}"
    echo
    
    # Custom command loop
    while true; do
        # Prompt
        echo -ne "${C_CRAB}[CRAB]${C_RESET}${C_CYAN}[$(date +%H:%M:%S)]${C_RESET} ${C_GREEN}$(whoami)${C_RESET}${C_BWHITE}@${C_RESET}${C_BCYAN}$(uname -n)${C_RESET} ${C_YELLOW}$(pwd)${C_RESET}\n${C_CRAB}⟫${C_RESET} "
        
        if ! read -r user_input; then
            break
        fi
        
        # Skip empty
        [[ -z "$user_input" ]] && continue
        
        # History
        history -s "$user_input"
        
        # Parse input
        case "$user_input" in
            exit|quit|q) 
                echo -e "${C_GREEN}Exiting Cywallearn CRAB. Stay sharp!${C_RESET}"
                break ;;
            menu|m)     bash "$CYWALLEARN_ROOT/core/menu.sh" ;;
            help|h)     bash "$CYWALLEARN_ROOT/core/help.sh" ;;
            clear)      clear ;;
            banner)     show_banner ;;
            update)     bash "$CYWALLEARN_ROOT/core/update.sh" ;;
            tools)      bash "$CYWALLEARN_ROOT/core/tools_manager.sh" ;;
            session)    bash "$CYWALLEARN_ROOT/core/session.sh" ;;
            recon)      bash "$CYWALLEARN_ROOT/modules/auto_recon.sh" ;;
            scan)       bash "$CYWALLEARN_ROOT/modules/auto_scan.sh" ;;
            exploit)    bash "$CYWALLEARN_ROOT/modules/auto_exploit.sh" ;;
            web)        bash "$CYWALLEARN_ROOT/modules/web_scanner.sh" ;;
            network)    bash "$CYWALLEARN_ROOT/modules/network_attacks.sh" ;;
            password)   bash "$CYWALLEARN_ROOT/modules/password_attacks.sh" ;;
            quick)      bash "$CYWALLEARN_ROOT/modules/quick_attack.sh" ;;
            about)      show_about ;;
            terminal)   bash "$CYWALLEARN_ROOT/core/terminal.sh" ;;
            *)
                # Try to execute as system command
                if command -v "${user_input%% *}" &>/dev/null; then
                    eval "$user_input"
                else
                    echo -e "${C_RED}[!] Unknown command: ${user_input%% *}${C_RESET}"
                    echo -e "${C_YELLOW}[!] Type 'help' for available commands${C_RESET}"
                fi
                ;;
        esac
    done
    
    # Restore PS1
    export PS1="$OLD_PS1"
}

# Main
main() {
    clear
    
    # Check environment
    check_termux
    
    # Initialize
    init_env
    
    # Check for arguments
    if [[ $# -gt 0 ]]; then
        execute_command "$@"
    else
        interactive_shell
    fi
}

# Start the system
main "$@"
