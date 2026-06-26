#!/bin/bash
source "$(dirname "$0")/../../config/colors.sh"
if ! command -v nc &>/dev/null; then echo -e "${C_RED}[!] netcat not installed${C_RESET}"; exit 1; fi
echo -e "${C_BCYAN}Netcat - Network Swiss Army Knife${C_RESET}"
echo -e "1. Listen for connections"
echo -e "2. Connect to host"
echo -e "3. Port scan"
echo -e "4. File transfer"
echo -ne "${C_YELLOW}Select:${C_RESET} "; read -r m
case "$m" in
    1) echo -ne "Port: "; read -r p; nc -lvnp "$p" ;;
    2) echo -ne "Host: "; read -r h; echo -ne "Port: "; read -r p; nc -v "$h" "$p" ;;
    3) echo -ne "Host: "; read -r h; nc -zv "$h" 1-1000 2>&1 ;;
    4)
        echo -ne "Send (s) or Receive (r)?: "; read -r d
        if [[ "$d" == "s" ]]; then
            echo -ne "File: "; read -r f; echo -ne "Port: "; read -r p
            nc -lvnp "$p" < "$f"
        else
            echo -ne "Port: "; read -r p; echo -ne "Output file: "; read -r o
            nc -v localhost "$p" > "$o"
        fi
        ;;
esac