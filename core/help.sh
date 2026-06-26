#!/bin/bash
#=============================================================================
# Cywallearn - CRAB v1 - Help & Learning System
# Comprehensive tool documentation with examples
#=============================================================================

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CORE_DIR="$(dirname "$SCRIPT_DIR")"
source "$CORE_DIR/config/colors.sh" 2>/dev/null

show_help_header() {
    clear
    echo -e "${C_BCYAN}╔══════════════════════════════════════════════════════════════════════╗${C_RESET}"
    echo -e "${C_BCYAN}║${C_RESET}  ${C_BGREEN} ██╗  ██╗███████╗██╗     ██████╗ ${C_RESET}                      ${C_BCYAN}║${C_RESET}"
    echo -e "${C_BCYAN}║${C_RESET}  ${C_BGREEN} ██║  ██║██╔════╝██║     ██╔══██╗${C_RESET}                     ${C_BCYAN}║${C_RESET}"
    echo -e "${C_BCYAN}║${C_RESET}  ${C_BGREEN} ███████║█████╗  ██║     ██████╔╝${C_RESET}                     ${C_BCYAN}║${C_RESET}"
    echo -e "${C_BCYAN}║${C_RESET}  ${C_BGREEN} ██╔══██║██╔══╝  ██║     ██╔═══╝ ${C_RESET}                     ${C_BCYAN}║${C_RESET}"
    echo -e "${C_BCYAN}║${C_RESET}  ${C_BGREEN} ██║  ██║███████╗███████╗██║     ${C_RESET}                     ${C_BCYAN}║${C_RESET}"
    echo -e "${C_BCYAN}║${C_RESET}  ${C_BGREEN} ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝     ${C_RESET}                     ${C_BCYAN}║${C_RESET}"
    echo -e "${C_BCYAN}║${C_RESET}                                                                    ${C_BCYAN}║${C_RESET}"
    echo -e "${C_BCYAN}║${C_RESET}  ${C_BWHITE}LEARNING CENTER - Documentation & Examples${C_RESET}         ${C_BCYAN}║${C_RESET}"
    echo -e "${C_BCYAN}╚══════════════════════════════════════════════════════════════════════╝${C_RESET}"
    echo
}

help_recon() {
    clear
    header "RECONNAISSANCE - LEARNING GUIDE"
    echo -e "${C_BCYAN}What is Reconnaissance?${C_RESET}"
    echo -e " Reconnaissance (recon) is the first phase of security testing where"
    echo -e " information about the target is gathered before launching attacks."
    echo
    echo -e "${C_BCYAN}Key Tools & Examples:${C_RESET}"
    echo
    echo -e "${C_BGREEN}Nmap - Network Scanner${C_RESET}"
    echo -e "  ${C_YELLOW}Usage:${C_RESET} nmap [target]"
    echo -e "  ${C_YELLOW}Example:${C_RESET} nmap -sV -p 1-1000 192.168.1.1"
    echo -e "  ${C_YELLOW}Example:${C_RESET} nmap -A -T4 scanme.nmap.org"
    echo -e "  ${C_WHITE}This scans open ports, services, and versions.${C_RESET}"
    echo
    echo -e "${C_BGREEN}Masscan - Fast Scanner${C_RESET}"
    echo -e "  ${C_YELLOW}Usage:${C_RESET} masscan [target] -p[ports] --rate=[speed]"
    echo -e "  ${C_YELLOW}Example:${C_RESET} masscan 192.168.1.0/24 -p80,443 --rate=1000"
    echo
    echo -e "${C_BGREEN}Subfinder - Subdomain Enumeration${C_RESET}"
    echo -e "  ${C_YELLOW}Usage:${C_RESET} subfinder -d [domain]"
    echo -e "  ${C_YELLOW}Example:${C_RESET} subfinder -d example.com -o subs.txt"
    echo -e "  ${C_WHITE}Finds subdomains using passive sources.${C_RESET}"
    echo
    echo -e "${C_BGREEN}Nuclei - Vulnerability Scanner${C_RESET}"
    echo -e "  ${C_YELLOW}Usage:${C_RESET} nuclei -u [target] -t [templates]"
    echo -e "  ${C_YELLOW}Example:${C_RESET} nuclei -u https://example.com -severity critical,high"
    echo
    echo -e "${C_YELLOW}Press Enter to continue...${C_RESET}"
    read -r
}

help_exploitation() {
    clear
    header "EXPLOITATION - LEARNING GUIDE"
    echo -e "${C_BCYAN}What is Exploitation?${C_RESET}"
    echo -e " Exploitation is the phase where identified vulnerabilities are"
    echo -e " actively used to gain unauthorized access or perform attacks."
    echo
    echo -e "${C_BCYAN}Key Tools & Examples:${C_RESET}"
    echo
    echo -e "${C_BGREEN}Metasploit Framework${C_RESET}"
    echo -e "  ${C_YELLOW}Usage:${C_RESET} msfconsole"
    echo -e "  ${C_YELLOW}Example:${C_RESET}"
    echo -e "    msfconsole"
    echo -e "    use exploit/multi/handler"
    echo -e "    set PAYLOAD linux/x64/meterpreter/reverse_tcp"
    echo -e "    set LHOST 192.168.1.10"
    echo -e "    set LPORT 4444"
    echo -e "    exploit"
    echo
    echo -e "${C_BGREEN}SQLMap - SQL Injection${C_RESET}"
    echo -e "  ${C_YELLOW}Usage:${C_RESET} sqlmap -u [url] [options]"
    echo -e "  ${C_YELLOW}Example:${C_RESET} sqlmap -u 'http://testphp.vulnweb.com/listproducts.php?cat=1' --dbs"
    echo -e "  ${C_YELLOW}Example:${C_RESET} sqlmap -u 'http://target.com/page?id=1' --dump"
    echo
    echo -e "${C_BGREEN}Hydra - Password Attack${C_RESET}"
    echo -e "  ${C_YELLOW}Usage:${C_RESET} hydra -l [user] -P [wordlist] [service]://[target]"
    echo -e "  ${C_YELLOW}Example:${C_RESET} hydra -l admin -P /usr/share/wordlists/rockyou.txt ssh://192.168.1.1"
    echo
    echo -e "${C_YELLOW}Press Enter to continue...${C_RESET}"
    read -r
}

help_web() {
    clear
    header "WEB SECURITY - LEARNING GUIDE"
    echo -e "${C_BCYAN}Web Application Testing${C_RESET}"
    echo -e " Testing web applications for vulnerabilities like SQLi, XSS, LFI, etc."
    echo
    echo -e "${C_BCYAN}Key Tools & Examples:${C_RESET}"
    echo
    echo -e "${C_BGREEN}Gobuster - Directory Busting${C_RESET}"
    echo -e "  ${C_YELLOW}Usage:${C_RESET} gobuster dir -u [url] -w [wordlist]"
    echo -e "  ${C_YELLOW}Example:${C_RESET} gobuster dir -u https://target.com -w /usr/share/wordlists/dirb/common.txt"
    echo
    echo -e "${C_BGREEN}FFuF - Web Fuzzer${C_RESET}"
    echo -e "  ${C_YELLOW}Usage:${C_RESET} ffuf -u [url] -w [wordlist]"
    echo -e "  ${C_YELLOW}Example:${C_RESET} ffuf -u https://target.com/FUZZ -w wordlist.txt"
    echo
    echo -e "${C_BGREEN}WPScan - WordPress Scanner${C_RESET}"
    echo -e "  ${C_YELLOW}Usage:${C_RESET} wpscan --url [target]"
    echo -e "  ${C_YELLOW}Example:${C_RESET} wpscan --url https://target.com --enumerate u,vp"
    echo
    echo -e "${C_BGREEN}XSStrike - XSS Scanner${C_RESET}"
    echo -e "  ${C_YELLOW}Usage:${C_RESET} xsstrike -u [url]"
    echo -e "  ${C_YELLOW}Example:${C_RESET} xsstrike -u 'https://target.com/search?q=test'"
    echo
    echo -e "${C_YELLOW}Press Enter to continue...${C_RESET}"
    read -r
}

help_network() {
    clear
    header "NETWORK ATTACKS - LEARNING GUIDE"
    echo -e "${C_BCYAN}Network Attack Techniques${C_RESET}"
    echo -e " Testing network infrastructure for vulnerabilities."
    echo
    echo -e "${C_BCYAN}Key Tools & Examples:${C_RESET}"
    echo
    echo -e "${C_BGREEN}BetterCAP - MITM Framework${C_RESET}"
    echo -e "  ${C_YELLOW}Usage:${C_RESET} bettercap -eval [script]"
    echo -e "  ${C_YELLOW}Example:${C_RESET}"
    echo -e "    bettercap -eval 'set arp.spoof.targets 192.168.1.100; arp.spoof on; net.sniff on'"
    echo
    echo -e "${C_BGREEN}Aircrack-ng - Wireless${C_RESET}"
    echo -e "  ${C_YELLOW}Example:${C_RESET}"
    echo -e "    airodump-ng wlan0"
    echo -e "    airodump-ng -c [channel] --bssid [bssid] -w capture wlan0"
    echo -e "    aircrack-ng -w wordlist.txt capture-01.cap"
    echo
    echo -e "${C_BGREEN}TShark - Packet Analysis${C_RESET}"
    echo -e "  ${C_YELLOW}Usage:${C_RESET} tshark -i [interface] [filters]"
    echo -e "  ${C_YELLOW}Example:${C_RESET} tshark -i wlan0 -Y 'http.request'"
    echo
    echo -e "${C_YELLOW}Press Enter to continue...${C_RESET}"
    read -r
}

help_forensics() {
    clear
    header "FORENSICS - LEARNING GUIDE"
    echo -e "${C_BCYAN}Digital Forensics${C_RESET}"
    echo -e " Investigating digital evidence and recovering data."
    echo
    echo -e "${C_BCYAN}Key Tools & Examples:${C_RESET}"
    echo
    echo -e "${C_BGREEN}Binwalk - Firmware Analysis${C_RESET}"
    echo -e "  ${C_YELLOW}Usage:${C_RESET} binwalk [options] [file]"
    echo -e "  ${C_YELLOW}Example:${C_RESET} binwalk -Me firmware.bin"
    echo
    echo -e "${C_BGREEN}Foremost - File Carving${C_RESET}"
    echo -e "  ${C_YELLOW}Usage:${C_RESET} foremost -i [image] -o [output]"
    echo -e "  ${C_YELLOW}Example:${C_RESET} foremost -i disk_image.dd -o recovered/"
    echo
    echo -e "${C_BGREEN}Volatility - Memory Forensics${C_RESET}"
    echo -e "  ${C_YELLOW}Usage:${C_RESET} volatility -f [memdump] [plugin]"
    echo -e "  ${C_YELLOW}Example:${C_RESET} volatility -f memory.dump imageinfo"
    echo -e "  ${C_YELLOW}Example:${C_RESET} volatility -f memory.dump --profile=Win7SP1x64 pslist"
    echo
    echo -e "${C_YELLOW}Press Enter to continue...${C_RESET}"
    read -r
}

help_password() {
    clear
    header "PASSWORD CRACKING - LEARNING GUIDE"
    echo -e "${C_BCYAN}Password Recovery Techniques${C_RESET}"
    echo
    echo -e "${C_BCYAN}Key Tools & Examples:${C_RESET}"
    echo
    echo -e "${C_BGREEN}John The Ripper${C_RESET}"
    echo -e "  ${C_YELLOW}Usage:${C_RESET} john [options] [hashfile]"
    echo -e "  ${C_YELLOW}Example:${C_RESET} john --wordlist=/usr/share/wordlists/rockyou.txt hashes.txt"
    echo
    echo -e "${C_BGREEN}Hashcat${C_RESET}"
    echo -e "  ${C_YELLOW}Usage:${C_RESET} hashcat -m [mode] -a [attack] [hash] [wordlist]"
    echo -e "  ${C_YELLOW}Example:${C_RESET} hashcat -m 0 -a 0 hash.txt /usr/share/wordlists/rockyou.txt"
    echo -e "  ${C_WHITE}Mode 0 = MD5, Mode 1000 = NTLM, Mode 3200 = bcrypt${C_RESET}"
    echo
    echo -e "${C_BGREEN}Ciphey - Auto Decryption${C_RESET}"
    echo -e "  ${C_YELLOW}Usage:${C_RESET} ciphey -t [text]"
    echo -e "  ${C_YELLOW}Example:${C_RESET} ciphey -t 'aGVsbG8gd29ybGQ='"
    echo -e "  ${C_WHITE}Automatically detects and decodes/decrypts.${C_RESET}"
    echo
    echo -e "${C_YELLOW}Press Enter to continue...${C_RESET}"
    read -r
}

help_getting_started() {
    clear
    header "GETTING STARTED - CYWALLEARN CRAB v1"
    echo -e "${C_BCYAN}Welcome to Cywallearn CRAB!${C_RESET}"
    echo
    echo -e "${C_BGREEN}Quick Start Guide:${C_RESET}"
    echo
    echo -e " ${C_CYAN}Step 1:${C_RESET} ${C_WHITE}Installation${C_RESET}"
    echo -e "   bash install.sh"
    echo
    echo -e " ${C_CYAN}Step 2:${C_RESET} ${C_WHITE}Launch Cywallearn${C_RESET}"
    echo -e "   bash main.sh"
    echo
    echo -e " ${C_CYAN}Step 3:${C_RESET} ${C_WHITE}Explore Tools${C_RESET}"
    echo -e "   From the main menu, select a category (1-10)"
    echo -e "   Or type: ${C_GREEN}menu${C_RESET} for the full menu system"
    echo
    echo -e " ${C_CYAN}Step 4:${C_RESET} ${C_WHITE}Use the Terminal${C_RESET}"
    echo -e "   Type: ${C_GREEN}terminal${C_RESET} or ${C_GREEN}term${C_RESET}"
    echo -e "   Access all tools with /tool/[name]"
    echo
    echo -e " ${C_CYAN}Step 5:${C_RESET} ${C_WHITE}Quick Attacks${C_RESET}"
    echo -e "   Type: ${C_GREEN}quick${C_RESET} for one-shot attack modules"
    echo
    echo -e "${C_BGREEN}Available Commands:${C_RESET}"
    echo -e "  ${C_GREEN}menu${C_RESET}     - Show main menu"
    echo -e "  ${C_GREEN}help${C_RESET}     - This help system"
    echo -e "  ${C_GREEN}terminal${C_RESET} - Launch advanced terminal"
    echo -e "  ${C_GREEN}tools${C_RESET}    - Tool manager"
    echo -e "  ${C_GREEN}update${C_RESET}   - Check for updates"
    echo -e "  ${C_GREEN}recon${C_RESET}    - Quick reconnaissance"
    echo -e "  ${C_GREEN}scan${C_RESET}     - Quick scanning"
    echo -e "  ${C_GREEN}exploit${C_RESET}  - Quick exploitation"
    echo -e "  ${C_GREEN}web${C_RESET}      - Web scanner"
    echo -e "  ${C_GREEN}network${C_RESET}  - Network attacks"
    echo -e "  ${C_GREEN}quick${C_RESET}    - Quick attack mode"
    echo -e "  ${C_GREEN}exit${C_RESET}     - Exit Cywallearn"
    echo
    echo -e "${C_BGREEN}Pro Tips:${C_RESET}"
    echo -e "  ${C_CYAN}•${C_RESET} Use Tab for auto-completion in terminal"
    echo -e "  ${C_CYAN}•${C_RESET} Prefix tool names with /tool/ for quick access"
    echo -e "  ${C_CYAN}•${C_RESET} All tools have built-in --help flags"
    echo -e "  ${C_CYAN}•${C_RESET} Sessions are auto-logged for review"
    echo -e "  ${C_CYAN}•${C_RESET} Use Ctrl+C to cancel running operations"
    echo
    echo -e "${C_YELLOW}Press Enter to continue...${C_RESET}"
    read -r
}

# Main help menu
show_help_system() {
    while true; do
        show_help_header
        echo -e " ${C_CYAN}1.${C_RESET} ${C_WHITE}Getting Started Guide${C_RESET}        ${C_WHITE}- New to Cywallearn? Start here${C_RESET}"
        echo -e " ${C_CYAN}2.${C_RESET} ${C_WHITE}Reconnaissance Guide${C_RESET}         ${C_WHITE}- Learn about info gathering${C_RESET}"
        echo -e " ${C_CYAN}3.${C_RESET} ${C_WHITE}Exploitation Guide${C_RESET}           ${C_WHITE}- Exploitation techniques & tools${C_RESET}"
        echo -e " ${C_CYAN}4.${C_RESET} ${C_WHITE}Web Security Guide${C_RESET}           ${C_WHITE}- Web app testing methodology${C_RESET}"
        echo -e " ${C_CYAN}5.${C_RESET} ${C_WHITE}Network Attacks Guide${C_RESET}        ${C_WHITE}- Network pentesting techniques${C_RESET}"
        echo -e " ${C_CYAN}6.${C_RESET} ${C_WHITE}Forensics Guide${C_RESET}              ${C_WHITE}- Digital forensics methods${C_RESET}"
        echo -e " ${C_CYAN}7.${C_RESET} ${C_WHITE}Password Cracking Guide${C_RESET}      ${C_WHITE}- Hash cracking & recovery${C_RESET}"
        echo -e " ${C_CYAN}8.${C_RESET} ${C_WHITE}Read Help Files${C_RESET}              ${C_WHITE}- View Markdown documentation${C_RESET}"
        echo -e " ${C_CYAN}B.${C_RESET} ${C_WHITE}Back to Main${C_RESET}"
        echo
        echo -ne "${C_CRAB}Select option:${C_RESET} "
        read -r opt
        
        case "$opt" in
            1) help_getting_started ;;
            2) help_recon ;;
            3) help_exploitation ;;
            4) help_web ;;
            5) help_network ;;
            6) help_forensics ;;
            7) help_password ;;
            8) 
                clear
                echo -e "${C_YELLOW}Available documentation:${C_RESET}"
                ls -la "$CORE_DIR/help/"*.md 2>/dev/null | while read -r f; do
                    echo -e "  ${C_CYAN}•${C_RESET} $(basename "$f")"
                done
                echo
                echo -ne "${C_YELLOW}Enter filename to read:${C_RESET} "
                read -r docfile
                if [ -f "$CORE_DIR/help/$docfile" ]; then
                    cat "$CORE_DIR/help/$docfile" 2>/dev/null | head -100
                else
                    echo -e "${C_RED}File not found${C_RESET}"
                fi
                echo -e "\n${C_YELLOW}Press Enter...${C_RESET}"; read -r
                ;;
            b|B) return ;;
            *) echo -e "${C_RED}Invalid${C_RESET}"; sleep 1 ;;
        esac
    done
}

show_help_system
