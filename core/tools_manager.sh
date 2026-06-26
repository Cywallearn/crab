#!/bin/bash
#=============================================================================
# Cywallearn - CRAB v1 - Tool Manager
# List, install, update, and manage all tools
#=============================================================================

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CORE_DIR="$(dirname "$SCRIPT_DIR")"
source "$CORE_DIR/config/colors.sh" 2>/dev/null

TOOLS_DIR="$CORE_DIR/tools"

list_tools() {
    clear
    header "CYWALLEARN TOOL INVENTORY"
    
    local total=0
    for category in "$TOOLS_DIR"/category_*/; do
        if [ -d "$category" ]; then
            local cat_name=$(basename "$category" | sed 's/category_[0-9]*_//' | tr '_' ' ')
            local count=$(ls "$category"/*.sh 2>/dev/null | wc -l)
            total=$((total + count))
            
            # Print category
            echo -e " ${C_BCYAN}▓${C_RESET} ${C_BWHITE}$(echo "$cat_name" | sed 's/^./\U&/')${C_RESET} (${C_GREEN}$count tools${C_RESET})"
            
            # Print tools
            for tool in "$category"/*.sh; do
                if [ -f "$tool" ]; then
                    local tool_name=$(basename "$tool" .sh)
                    local tool_desc=$(head -3 "$tool" | grep -oP '(?<=# ).*' | tail -1)
                    echo -e "     ${C_CYAN}▶${C_RESET} ${C_YELLOW}$tool_name${C_RESET}"
                fi
            done
            echo
        fi
    done
    
    echo -e " ${C_BCYAN}════════════════════════════════════════════${C_RESET}"
    echo -e " ${C_BWHITE}Total:${C_RESET} ${C_GREEN}$total${C_RESET} tools across ${C_YELLOW}10${C_RESET} categories"
    echo -e " ${C_BCYAN}════════════════════════════════════════════${C_RESET}"
    echo
    echo -e "${C_YELLOW}Press Enter to continue...${C_RESET}"
    read -r
}

search_tools() {
    clear
    header "SEARCH TOOLS"
    echo -ne "${C_CYAN}Enter search term:${C_RESET} "
    read -r query
    
    if [ -z "$query" ]; then
        echo -e "${C_RED}No search term entered${C_RESET}"
        sleep 1
        return
    fi
    
    echo -e "${C_CYAN}Searching for '${C_YELLOW}$query${C_CYAN}'...${C_RESET}"
    echo
    
    local found=0
    for tool in "$TOOLS_DIR"/*/*.sh; do
        if [[ "$(basename "$tool" .sh)" == *"$query"* ]]; then
            echo -e "  ${C_GREEN}✓${C_RESET} $(basename "$tool" .sh) ${C_CYAN}($(dirname "$tool"))${C_RESET}"
            found=$((found + 1))
        fi
    done
    
    if [ $found -eq 0 ]; then
        echo -e "  ${C_YELLOW}No tools found matching '$query'${C_RESET}"
    else
        echo -e "\n${C_GREEN}Found $found tools${C_RESET}"
    fi
    
    echo -e "\n${C_YELLOW}Press Enter...${C_RESET}"
    read -r
}

check_installed() {
    clear
    header "TOOL INSTALLATION STATUS"
    
    for category in "$TOOLS_DIR"/category_*/; do
        if [ -d "$category" ]; then
            local cat_name=$(basename "$category" | sed 's/category_[0-9]*_//' | tr '_' ' ')
            echo -e " ${C_BCYAN}[$(echo "$cat_name" | sed 's/^./\U&/')]${C_RESET}"
            
            for tool in "$category"/*.sh; do
                if [ -f "$tool" ]; then
                    local tool_name=$(basename "$tool" .sh)
                    if command -v "$tool_name" &>/dev/null; then
                        echo -e "   ${C_GREEN}[✓]${C_RESET} $tool_name"
                    else
                        # Check if pkg name exists
                        local pkg_name="$tool_name"
                        case "$tool_name" in
                            nmap|masscan|hydra|python|php|git|curl|wget|vim|neofetch)
                                echo -e "   ${C_YELLOW}[~]${C_RESET} $tool_name (pkg available)"
                                ;;
                            *)
                                echo -e "   ${C_RED}[ ]${C_RESET} $tool_name"
                                ;;
                        esac
                    fi
                fi
            done
            echo
        fi
    done
    
    echo -e "${C_YELLOW}Press Enter to continue...${C_RESET}"
    read -r
}

# Main tool manager
while true; do
    clear
    header "TOOL MANAGER"
    echo -e " ${C_CYAN}1.${C_RESET} ${C_WHITE}List All Tools${C_RESET}       ${C_WHITE}- Show full tool inventory${C_RESET}"
    echo -e " ${C_CYAN}2.${C_RESET} ${C_WHITE}Search Tools${C_RESET}         ${C_WHITE}- Search by name${C_RESET}"
    echo -e " ${C_CYAN}3.${C_RESET} ${C_WHITE}Check Installed${C_RESET}      ${C_WHITE}- See which tools are installed${C_RESET}"
    echo -e " ${C_CYAN}4.${C_RESET} ${C_WHITE}Install Dependencies${C_RESET} ${C_WHITE}- Install missing requirements${C_RESET}"
    echo -e " ${C_CYAN}B.${C_RESET} ${C_WHITE}Back${C_RESET}"
    echo
    echo -ne "${C_CRAB}Select:${C_RESET} "
    read -r opt
    
    case "$opt" in
        1) list_tools ;;
        2) search_tools ;;
        3) check_installed ;;
        4) 
            echo -e "${C_YELLOW}Installing dependencies...${C_RESET}"
            pkg update -y && pkg upgrade -y
            echo -e "${C_GREEN}Done${C_RESET}"; sleep 1 ;;
        b|B) break ;;
        *) echo -e "${C_RED}Invalid${C_RESET}"; sleep 1 ;;
    esac
done
