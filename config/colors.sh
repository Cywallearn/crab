#!/bin/bash
#=============================================================================
# Cywallearn - CRAB v1 - Color Definitions
# Advanced Terminal Colors & Styling System
#=============================================================================

# Reset
export C_RESET='\033[0m'

# Regular Colors
export C_BLACK='\033[0;30m'
export C_RED='\033[0;31m'
export C_GREEN='\033[0;32m'
export C_YELLOW='\033[0;33m'
export C_BLUE='\033[0;34m'
export C_PURPLE='\033[0;35m'
export C_CYAN='\033[0;36m'
export C_WHITE='\033[0;37m'

# Bold
export C_BBLACK='\033[1;30m'
export C_BRED='\033[1;31m'
export C_BGREEN='\033[1;32m'
export C_BYELLOW='\033[1;33m'
export C_BBLUE='\033[1;34m'
export C_BPURPLE='\033[1;35m'
export C_BCYAN='\033[1;36m'
export C_BWHITE='\033[1;37m'

# Background
export C_BG_BLACK='\033[40m'
export C_BG_RED='\033[41m'
export C_BG_GREEN='\033[42m'
export C_BG_YELLOW='\033[43m'
export C_BG_BLUE='\033[44m'
export C_BG_PURPLE='\033[45m'
export C_BG_CYAN='\033[46m'
export C_BG_WHITE='\033[47m'

# High Intensity
export C_IBLACK='\033[0;90m'
export C_IRED='\033[0;91m'
export C_IGREEN='\033[0;92m'
export C_IYELLOW='\033[0;93m'
export C_IBLUE='\033[0;94m'
export C_IPURPLE='\033[0;95m'
export C_ICYAN='\033[0;96m'
export C_IWHITE='\033[0;97m'

# Bold High Intensity
export C_BIBLACK='\033[1;90m'
export C_BIRED='\033[1;91m'
export C_BIGREEN='\033[1;92m'
export C_BIYELLOW='\033[1;93m'
export C_BIBLUE='\033[1;94m'
export C_BIPURPLE='\033[1;95em'
export C_BICYAN='\033[1;96m'
export C_BIWHITE='\033[1;97m'

# Cywallearn Brand Colors
export C_PRIMARY=$C_BGREEN
export C_SECONDARY=$C_BCYAN
export C_ACCENT=$C_BPURPLE
export C_WARN=$C_BYELLOW
export C_DANGER=$C_BRED
export C_INFO=$C_BBLUE
export C_SUCCESS=$C_BGREEN
export C_CRAB=$C_BRED
export C_CYWAL=$C_BCYAN

# Styling Functions
status_good() { echo -e "${C_SUCCESS}[✓]${C_RESET} $1"; }
status_bad() { echo -e "${C_DANGER}[✗]${C_RESET} $1"; }
status_info() { echo -e "${C_INFO}[i]${C_RESET} $1"; }
status_warn() { echo -e "${C_WARN}[!]${C_RESET} $1"; }
status_sec() { echo -e "${C_ACCENT}[*]${C_RESET} $1"; }
status_crab() { echo -e "${C_CRAB}[🦀]${C_RESET} $1"; }

# Progress bar
progress_bar() {
    local current=$1 total=$2 width=50
    local pct=$((current * 100 / total))
    local filled=$((current * width / total))
    local empty=$((width - filled))
    printf "\r${C_CYAN}[${C_RESET}"
    printf "%${filled}s" | tr ' ' '█'
    printf "%${empty}s" | tr ' ' '▒'
    printf "${C_CYAN}]${C_RESET} ${C_BWHITE}%3d%%${C_RESET}" "$pct"
    [[ $current -eq $total ]] && echo
}

# Header / Separator
header() {
    echo
    echo -e "${C_BCYAN}╔══════════════════════════════════════════════════════════════╗${C_RESET}"
    echo -e "${C_BCYAN}║${C_RESET}  ${C_BWHITE}$1${C_RESET}"
    echo -e "${C_BCYAN}╚══════════════════════════════════════════════════════════════╝${C_RESET}"
    echo
}

# Table row
table_row() {
    printf "${C_CYAN}│${C_RESET} %-30s ${C_CYAN}│${C_RESET} %-20s ${C_CYAN}│${C_RESET}\n" "$1" "$2"
}
table_header() {
    echo -e "${C_CYAN}┌────────────────────────────────┬──────────────────────┐${C_RESET}"
    printf "${C_CYAN}│${C_RESET} ${C_BWHITE}%-30s${C_RESET} ${C_CYAN}│${C_RESET} ${C_BWHITE}%-20s${C_RESET} ${C_CYAN}│${C_RESET}\n" "$1" "$2"
    echo -e "${C_CYAN}├────────────────────────────────┼──────────────────────┤${C_RESET}"
}
table_footer() {
    echo -e "${C_CYAN}└────────────────────────────────┴──────────────────────┘${C_RESET}"
}

export -f status_good status_bad status_info status_warn status_sec status_crab
export -f progress_bar header table_row table_header table_footer
