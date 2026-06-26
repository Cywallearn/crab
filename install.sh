#!/bin/bash
#=============================================================================
# Cywallearn - CRAB v1 - Termux Installation Script
# This installs everything automatically on your Termux
#=============================================================================

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BWHITE='\033[1;37m'
NC='\033[0m'

clear
echo -e "${CYAN}"
echo "  ██████╗██╗   ██╗██╗    ██╗ █████╗ ██╗     ██╗     ███████╗ █████╗ ██████╗ ███╗   ██╗"
echo " ██╔════╝╚██╗ ██╔╝██║    ██║██╔══██╗██║     ██║     ██╔════╝██╔══██╗██╔══██╗████╗  ██║"
echo " ██║      ╚████╔╝ ██║ █╗ ██║███████║██║     ██║     █████╗  ███████║██████╔╝██╔██╗ ██║"
echo " ██║       ╚██╔╝  ██║███╗██║██╔══██║██║     ██║     ██╔══╝  ██╔══██║██╔══██╗██║╚██╗██║"
echo " ╚██████╗   ██║   ╚███╔███╔╝██║  ██║███████╗███████╗███████╗██║  ██║██║  ██║██║ ╚████║"
echo "  ╚═════╝   ╚═╝    ╚══╝╚══╝ ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝"
echo -e "${NC}"
echo -e "${CYAN}═══════════════════════════════════════════════════════════════${NC}"
echo -e "  ${BWHITE}Cywallearn CRAB v1 - Termux Installer${NC}"
echo -e "${CYAN}═══════════════════════════════════════════════════════════════${NC}"
echo ""

# Check Termux
if [ -z "$TERMUX_VERSION" ]; then
    echo -e "${YELLOW}[!] Warning: Not running in Termux environment${NC}"
    echo -e "${YELLOW}[!] Press Enter to continue anyway...${NC}"
    read -r
fi

# Storage access
echo -e "${CYAN}[*] Requesting storage access...${NC}"
termux-setup-storage 2>/dev/null || true
sleep 1

# Update packages
echo -e "\n${CYAN}[*] Updating Termux packages...${NC}"
apt update -y
apt upgrade -y

# Install ALL dependencies
echo -e "\n${CYAN}[*] Installing core packages (this may take a while)...${NC}"

# Network tools
echo -e "${YELLOW}[*] Network tools...${NC}"
apt install -y nmap netcat-openbsd traceroute dnsutils 2>/dev/null || true

# Web tools
echo -e "${YELLOW}[*] Web tools...${NC}"
apt install -y curl wget whatweb nikto wpscan 2>/dev/null || true

# Exploitation
echo -e "${YELLOW}[*] Exploitation tools...${NC}"
apt install -y hydra sqlmap john 2>/dev/null || true

# Scanning
echo -e "${YELLOW}[*] Scanning tools...${NC}"
apt install -y masscan dirb gobuster nuclei 2>/dev/null || true

# Forensics
echo -e "${YELLOW}[*] Forensics tools...${NC}"
apt install -y binwalk foremost steghide exiftool 2>/dev/null || true

# Mobile
echo -e "${YELLOW}[*] Mobile tools...${NC}"
apt install -y apktool jadx 2>/dev/null || true

# Wireless
echo -e "${YELLOW}[*] Wireless tools...${NC}"
apt install -y aircrack-ng ettercap macchanger 2>/dev/null || true

# Utilities
echo -e "${YELLOW}[*] Utilities...${NC}"
apt install -y python python3 python-pip php nodejs git vim tmux neofetch hashid hash-identifier openssh perl rust 2>/dev/null || true

# Python packages
echo -e "\n${CYAN}[*] Installing Python packages...${NC}"
pip3 install colorama requests beautifulsoup4 scapy paramiko ciphey 2>/dev/null || true

# Create installation directory
INSTALL_DIR="$HOME/cywallearn"
echo -e "\n${CYAN}[*] Setting up Cywallearn in $INSTALL_DIR...${NC}"

# If running from the cloned directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CURRENT_DIR="$(pwd)"

if [ "$SCRIPT_DIR" != "$INSTALL_DIR" ]; then
    mkdir -p "$INSTALL_DIR" 2>/dev/null
    
    if [ -f "$SCRIPT_DIR/main.sh" ]; then
        cp -r "$SCRIPT_DIR"/* "$INSTALL_DIR/" 2>/dev/null || cp -r "$SCRIPT_DIR/"* "$INSTALL_DIR/" 2>/dev/null || cp -r "$SCRIPT_DIR/"* "$INSTALL_DIR/"
    elif [ -f "$CURRENT_DIR/main.sh" ]; then
        cp -r "$CURRENT_DIR"/* "$INSTALL_DIR/" 2>/dev/null || true
    fi
fi

# Make everything executable
echo -e "${CYAN}[*] Making scripts executable...${NC}"
chmod +x "$INSTALL_DIR/main.sh" 2>/dev/null || true
chmod +x "$INSTALL_DIR/core/"*.sh 2>/dev/null || true
chmod +x "$INSTALL_DIR/modules/"*.sh 2>/dev/null || true
chmod +x "$INSTALL_DIR/tools/"*/*.sh 2>/dev/null || true
chmod +x "$INSTALL_DIR/config/"*.sh 2>/dev/null || true
chmod +x "$INSTALL_DIR/backup/"*.sh 2>/dev/null || true
chmod +x "$INSTALL_DIR/resources/payloads/"*.sh 2>/dev/null || true
chmod +x "$INSTALL_DIR/resources/exploits/"*.sh 2>/dev/null || true

# Add aliases
echo -e "${CYAN}[*] Adding aliases to .bashrc...${NC}"
echo "" >> "$HOME/.bashrc"
echo "# Cywallearn CRAB v1" >> "$HOME/.bashrc"
echo "alias crab='bash $INSTALL_DIR/main.sh'" >> "$HOME/.bashrc"
echo "alias cywallearn='bash $INSTALL_DIR/main.sh'" >> "$HOME/.bashrc"
echo "alias cr='cd $INSTALL_DIR && bash main.sh'" >> "$HOME/.bashrc"

echo ""
echo -e "${CYAN}═══════════════════════════════════════════════════════════════${NC}"
echo -e "  ${GREEN}✅  Cywallearn CRAB v1 Installation Complete!${NC}"
echo -e "${CYAN}═══════════════════════════════════════════════════════════════${NC}"
echo ""
echo -e "  ${BWHITE}How to run:${NC}"
echo -e "  ${GREEN}1.${NC} Typing: ${YELLOW}crab${NC}          (from anywhere)"
echo -e "  ${GREEN}2.${NC} Typing: ${YELLOW}bash ~/cywallearn/main.sh${NC}"
echo -e "  ${GREEN}3.${NC} Typing: ${YELLOW}cd ~/cywallearn && bash main.sh${NC}"
echo ""
echo -e "  ${BWHITE}First time tips:${NC}"
echo -e "  ${YELLOW}*${NC} Type ${GREEN}menu${NC} for the main menu"
echo -e "  ${YELLOW}*${NC} Type ${GREEN}help${NC} for the learning center"
echo -e "  ${YELLOW}*${NC} Type ${GREEN}tools${NC} to see all available tools"
echo ""
echo -e "${CYAN}═══════════════════════════════════════════════════════════════${NC}"
echo ""
