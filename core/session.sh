#!/bin/bash
#=============================================================================
# Cywallearn - CRAB v1 - Session Manager
# Manage and review terminal sessions
#=============================================================================

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CORE_DIR="$(dirname "$SCRIPT_DIR")"
source "$CORE_DIR/config/colors.sh" 2>/dev/null

SESSIONS_DIR="$CORE_DIR/sessions"

list_sessions() {
    clear
    header "SESSION HISTORY"
    
    local count=0
    for session in "$SESSIONS_DIR"/terminal_*.log; do
        if [ -f "$session" ]; then
            count=$((count + 1))
            local name=$(basename "$session")
            local size=$(du -h "$session" | cut -f1)
            local date=$(stat -c "%y" "$session" 2>/dev/null | cut -d. -f1 || echo "N/A")
            echo -e " ${C_CYAN}$count.${C_RESET} ${C_WHITE}$name${C_RESET}"
            echo -e "     ${C_CYAN}Size:${C_RESET} $size | ${C_CYAN}Date:${C_RESET} $date"
        fi
    done
    
    if [ $count -eq 0 ]; then
        echo -e " ${C_YELLOW}No session logs found.${C_RESET}"
        echo -e " ${C_YELLOW}Sessions are created when using the Cywallearn Terminal.${C_RESET}"
    fi
    
    echo
    echo -e "${C_YELLOW}Press Enter to continue...${C_RESET}"
    read -r
}

view_session() {
    clear
    header "VIEW SESSION"
    
    local sessions=()
    local i=0
    
    for session in "$SESSIONS_DIR"/terminal_*.log; do
        if [ -f "$session" ]; then
            sessions+=("$session")
            i=$((i + 1))
            echo -e " ${C_CYAN}$i.${C_RESET} $(basename "$session")"
        fi
    done
    
    if [ $i -eq 0 ]; then
        echo -e "${C_YELLOW}No sessions found${C_RESET}"
        echo -e "\n${C_YELLOW}Press Enter...${C_RESET}"; read -r
        return
    fi
    
    echo
    echo -ne "${C_CRAB}Select session number:${C_RESET} "
    read -r num
    
    if [[ "$num" =~ ^[0-9]+$ ]] && [ "$num" -ge 1 ] && [ "$num" -le "$i" ]; then
        clear
        cat "${sessions[$((num - 1))]}" 2>/dev/null
        echo -e "\n${C_YELLOW}--- End of session ---${C_RESET}"
    else
        echo -e "${C_RED}Invalid selection${C_RESET}"
    fi
    
    echo -e "\n${C_YELLOW}Press Enter...${C_RESET}"
    read -r
}

clear_sessions() {
    echo -ne "${C_YELLOW}Are you sure you want to clear all session logs? [y/N]:${C_RESET} "
    read -r confirm
    
    if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
        rm -f "$SESSIONS_DIR"/terminal_*.log
        echo -e "${C_GREEN}All session logs cleared${C_RESET}"
    else
        echo -e "${C_YELLOW}Cancelled${C_RESET}"
    fi
    sleep 1
}

while true; do
    clear
    header "SESSION MANAGER"
    echo -e " ${C_CYAN}1.${C_RESET} ${C_WHITE}List Sessions${C_RESET}"
    echo -e " ${C_CYAN}2.${C_RESET} ${C_WHITE}View Session${C_RESET}"
    echo -e " ${C_CYAN}3.${C_RESET} ${C_WHITE}Clear All Sessions${C_RESET}"
    echo -e " ${C_CYAN}B.${C_RESET} ${C_WHITE}Back${C_RESET}"
    echo
    echo -ne "${C_CRAB}Select:${C_RESET} "
    read -r opt
    
    case "$opt" in
        1) list_sessions ;;
        2) view_session ;;
        3) clear_sessions ;;
        b|B) break ;;
        *) echo -e "${C_RED}Invalid${C_RESET}"; sleep 1 ;;
    esac
done
