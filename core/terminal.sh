#!/bin/bash
#=============================================================================
# Cywallearn - CRAB v1 - Advanced Terminal Emulator
# Custom terminal with hacking-specific enhancements
#=============================================================================

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CORE_DIR="$(dirname "$SCRIPT_DIR")"
source "$CORE_DIR/config/colors.sh" 2>/dev/null

# Terminal config
HISTFILE="$CORE_DIR/sessions/.terminal_history"
HISTSIZE=5000
HISTFILESIZE=10000
TERM_LOGFILE="$CORE_DIR/sessions/terminal_$(date +%Y%m%d_%H%M%S).log"

# Ensure directories
mkdir -p "$CORE_DIR/sessions" 2>/dev/null

# Touch history file
touch "$HISTFILE" 2>/dev/null

show_terminal_banner() {
    clear
    echo -e "${C_BCYAN}╔══════════════════════════════════════════════════════════════════════╗${C_RESET}"
    echo -e "${C_BCYAN}║${C_RESET}  ${C_BIRED} ████████╗███████╗██████╗ ███╗   ███╗██╗███╗   ██╗ █████╗ ██╗     ${C_BCYAN}║${C_RESET}"
    echo -e "${C_BCYAN}║${C_RESET}  ${C_BIRED} ╚══██╔══╝██╔════╝██╔══██╗████╗ ████║██║████╗  ██║██╔══██╗██║     ${C_BCYAN}║${C_RESET}"
    echo -e "${C_BCYAN}║${C_RESET}  ${C_BIRED}    ██║   █████╗  ██████╔╝██╔████╔██║██║██╔██╗ ██║███████║██║     ${C_BCYAN}║${C_RESET}"
    echo -e "${C_BCYAN}║${C_RESET}  ${C_BIRED}    ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║██║██║╚██╗██║██╔══██║██║     ${C_BCYAN}║${C_RESET}"
    echo -e "${C_BCYAN}║${C_RESET}  ${C_BIRED}    ██║   ███████╗██║  ██║██║ ╚═╝ ██║██║██║ ╚████║██║  ██║███████╗${C_BCYAN}║${C_RESET}"
    echo -e "${C_BCYAN}║${C_RESET}  ${C_BIRED}    ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝${C_BCYAN}║${C_RESET}"
    echo -e "${C_BCYAN}║${C_RESET}                                                                    ${C_BCYAN}║${C_RESET}"
    echo -e "${C_BCYAN}║${C_RESET}  ${C_WHITE}Cywallearn Advanced Terminal v1.0${C_RESET}                  ${C_BCYAN}║${C_RESET}"
    echo -e "${C_BCYAN}║${C_RESET}  ${C_CYAN}Features: Auto-Suggest | History | Logging | Themed${C_RESET}    ${C_BCYAN}║${C_RESET}"
    echo -e "${C_BCYAN}╚══════════════════════════════════════════════════════════════════════╝${C_RESET}"
    echo
    echo -e "${C_YELLOW}Terminal commands:${C_RESET}"
    echo -e "  ${C_GREEN}/help${C_RESET}    - Show Cywallearn terminal help"
    echo -e "  ${C_GREEN}/menu${C_RESET}    - Open main menu"
    echo -e "  ${C_GREEN}/tools${C_RESET}   - List available tools"
    echo -e "  ${C_GREEN}/clear${C_RESET}   - Clear terminal"
    echo -e "  ${C_GREEN}/exit${C_RESET}    - Exit terminal"
    echo -e "  ${C_GREEN}/log${C_RESET}     - Show session log"
    echo -e "  ${C_GREEN}/banner${C_RESET}  - Show system banner"
    echo
}

show_terminal_help() {
    echo -e "${C_BCYAN}═════════════════════ TERMINAL HELP ═════════════════════${C_RESET}"
    echo -e " ${C_BWHITE}Cywallearn Terminal Commands:${C_RESET}"
    echo
    echo -e " ${C_CYAN}/help${C_RESET}       - Display this help message"
    echo -e " ${C_CYAN}/menu${C_RESET}       - Launch Cywallearn main menu"
    echo -e " ${C_CYAN}/tools${C_RESET}      - Show tool manager"
    echo -e " ${C_CYAN}/clear${C_RESET}      - Clear the terminal screen"
    echo -e " ${C_CYAN}/exit${C_RESET}       - Exit back to main shell"
    echo -e " ${C_CYAN}/quit${C_RESET}       - Quit Cywallearn entirely"
    echo -e " ${C_CYAN}/log${C_RESET}        - View current session log"
    echo -e " ${C_CYAN}/banner${C_RESET}     - Display system banner"
    echo -e " ${C_CYAN}/recon${C_RESET}      - Quick recon module"
    echo -e " ${C_CYAN}/scan${C_RESET}       - Quick scan module"
    echo -e " ${C_CYAN}/exploit${C_RESET}    - Quick exploit module"
    echo -e " ${C_CYAN}/web${C_RESET}        - Web security scanner"
    echo -e " ${C_CYAN}/network${C_RESET}    - Network attack suite"
    echo -e " ${C_CYAN}/update${C_RESET}     - Check for updates"
    echo -e " ${C_CYAN}/about${C_RESET}      - About Cywallearn"
    echo
    echo -e " ${C_YELLOW}All standard Linux/Termux commands are also available.${C_RESET}"
    echo -e " ${C_YELLOW}Use Tab for auto-completion.${C_RESET}"
    echo -e "${C_BCYAN}════════════════════════════════════════════════════════${C_RESET}"
}

log_entry() {
    local entry="$1"
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $entry" >> "$TERM_LOGFILE"
}

# Quick access tool shortcuts
run_quick_tool() {
    local tool="$1"
    shift
    case "$tool" in
        nmap)   bash "$CORE_DIR/tools/category_1_recon/nmap.sh" "$@" ;;
        masscan) bash "$CORE_DIR/tools/category_1_recon/masscan.sh" "$@" ;;
        sqlmap) bash "$CORE_DIR/tools/category_2_exploitation/sqlmap.sh" "$@" ;;
        metasploit|msf) bash "$CORE_DIR/tools/category_2_exploitation/metasploit.sh" "$@" ;;
        hydra)  bash "$CORE_DIR/tools/category_2_exploitation/hydra.sh" "$@" ;;
        john)   bash "$CORE_DIR/tools/category_2_exploitation/john.sh" "$@" ;;
        hashcat) bash "$CORE_DIR/tools/category_2_exploitation/hashcat.sh" "$@" ;;
        gobuster) bash "$CORE_DIR/tools/category_3_web/gobuster.sh" "$@" ;;
        ffuf)   bash "$CORE_DIR/tools/category_3_web/ffuf.sh" "$@" ;;
        wpscan) bash "$CORE_DIR/tools/category_3_web/wpscan.sh" "$@" ;;
        nuclei) bash "$CORE_DIR/tools/category_1_recon/nuclei.sh" "$@" ;;
        whatweb) bash "$CORE_DIR/tools/category_3_web/whatweb.sh" "$@" ;;
        bettercap) bash "$CORE_DIR/tools/category_4_network/bettercap.sh" "$@" ;;
        aircrack) bash "$CORE_DIR/tools/category_4_network/aircrack.sh" "$@" ;;
        *)
            echo -e "${C_RED}[!] Unknown tool: $tool${C_RESET}"
            echo -e "${C_YELLOW}[!] Type /tools to see available tools${C_RESET}"
            ;;
    esac
}

# Main terminal loop
run_terminal() {
    show_terminal_banner
    echo -e "${C_GREEN}Terminal session started. Log: $(basename "$TERM_LOGFILE")${C_RESET}"
    log_entry "Terminal session started"
    
    # Custom prompt
    local PROMPT="${C_CRAB}[CRAB]${C_RESET}${C_CYAN}[T]${C_RESET} ${C_GREEN}\\u${C_RESET}${C_BWHITE}@${C_RESET}${C_BCYAN}cywallearn${C_RESET} ${C_YELLOW}\\w${C_RESET}\n${C_CRAB}⟫${C_RESET} "
    
    while true; do
        # Show prompt
        echo -ne "$PROMPT"
        
        if ! read -r cmd; then
            break
        fi
        
        # Skip empty
        [[ -z "$cmd" ]] && continue
        
        # Log
        log_entry "$cmd"
        
        # Parse slash commands
        case "$cmd" in
            /help)     show_terminal_help ;;
            /menu)     bash "$CORE_DIR/core/menu.sh" ;;
            /tools)    bash "$CORE_DIR/core/tools_manager.sh" ;;
            /clear)    clear; show_terminal_banner ;;
            /exit|/quit) 
                echo -e "${C_GREEN}Closing Cywallearn Terminal...${C_RESET}"
                log_entry "Terminal session ended"
                return 0 ;;
            /log)      cat "$TERM_LOGFILE" 2>/dev/null || echo "No log entries" ;;
            /banner)   bash "$CORE_DIR/config/banner.sh" 2>/dev/null; show_banner 2>/dev/null || true ;;
            /recon)    bash "$CORE_DIR/modules/auto_recon.sh" ;;
            /scan)     bash "$CORE_DIR/modules/auto_scan.sh" ;;
            /exploit)  bash "$CORE_DIR/modules/auto_exploit.sh" ;;
            /web)      bash "$CORE_DIR/modules/web_scanner.sh" ;;
            /network)  bash "$CORE_DIR/modules/network_attacks.sh" ;;
            /update)   bash "$CORE_DIR/core/update.sh" ;;
            /about)    bash "$CORE_DIR/core/menu.sh" 2>/dev/null || true ;;
            /tools/*)  
                local tool_name="${cmd#/tools/}"
                run_quick_tool "$tool_name"
                ;;
            /tool/*)
                local tool_name="${cmd#/tool/}"
                run_quick_tool "$tool_name"
                ;;
            clear|cls) clear ;;
            exit|quit) 
                echo -e "${C_GREEN}Use /exit to leave terminal, or exit to quit Cywallearn${C_RESET}" ;;
            menu|m)   bash "$CORE_DIR/core/menu.sh" ;;
            *)  
                # Pass through to system shell
                if command -v "${cmd%% *}" &>/dev/null; then
                    eval "$cmd"
                else
                    echo -e "${C_RED}[!] Command not found: ${cmd%% *}${C_RESET}"
                fi
                ;;
        esac
    done
}

run_terminal
