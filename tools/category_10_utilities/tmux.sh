#!/bin/bash
source "$(dirname "$0")/../../config/colors.sh"
if ! command -v tmux &>/dev/null; then echo -e "${C_RED}[!] tmux not installed${C_RESET}"; exit 1; fi
echo -e "${C_BCYAN}Tmux - Terminal Multiplexer${C_RESET}"
echo -e "${C_YELLOW}Key bindings: Ctrl+B then % (vsplit), \" (hsplit), arrows (nav), d (detach)${C_RESET}"
echo -ne "${C_YELLOW}Session name [cywallearn]:${C_RESET} "; read -r name
name=${name:-cywallearn}
tmux new-session -s "$name"