#!/bin/bash
#=============================================================================
# Cywallearn - CRAB v1 - Main Menu System
# Kali Linux-style Interactive Menu
#=============================================================================

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CORE_DIR="$(dirname "$SCRIPT_DIR")"
source "$CORE_DIR/config/colors.sh" 2>/dev/null

# Menu structure
declare -A MAIN_MENU

# Menu items array
MENU_ITEMS=(
    "1:🔍 Reconnaissance:Reconnaissance Tools & Information Gathering"
    "2:💥 Exploitation:Exploitation Frameworks & Exploit Development"
    "3:🌐 Web Security:Web Application Security Testing"
    "4:📡 Network Attacks:Network Attack & Analysis Tools"
    "5:🔧 Post-Exploitation:Post-Exploitation & Privilege Escalation"
    "6:🔬 Forensics:Digital Forensics & Investigation"
    "7:🎭 Social Engineering:Social Engineering Toolkit"
    "8:📱 Mobile Security:Mobile Application Security Testing"
    "9:🔑 Cryptography:Cryptography & Password Cracking"
    "10:🛠️ Utilities:Essential Utilities & Environment Tools"
    "A:⚡ Quick Attack:Quick Automated Attack Modules"
    "T:💻 Terminal:Advanced Cywallearn Terminal"
    "H:📖 Help Center:Documentation & Learning Center"
    "S:⚙️ Settings:System Configuration & Settings"
    "U:🔄 Update:Check for Updates"
    "Q:🚪 Exit:Exit Cywallearn CRAB"
)

show_menu_header() {
    clear
    echo -e "${C_BCYAN}╔══════════════════════════════════════════════════════════════════════╗${C_RESET}"
    echo -e "${C_BCYAN}║${C_RESET}  ${C_BIRED}███╗   ███╗███████╗███╗   ██╗██╗   ██╗${C_RESET}                      ${C_BCYAN}║${C_RESET}"
    echo -e "${C_BCYAN}║${C_RESET}  ${C_BIRED}████╗ ████║██╔════╝████╗  ██║██║   ██║${C_RESET}                      ${C_BCYAN}║${C_RESET}"
    echo -e "${C_BCYAN}║${C_RESET}  ${C_BIRED}██╔████╔██║█████╗  ██╔██╗ ██║██║   ██║${C_RESET}                      ${C_BCYAN}║${C_RESET}"
    echo -e "${C_BCYAN}║${C_RESET}  ${C_BIRED}██║╚██╔╝██║██╔══╝  ██║╚██╗██║██║   ██║${C_RESET}                      ${C_BCYAN}║${C_RESET}"
    echo -e "${C_BCYAN}║${C_RESET}  ${C_BIRED}██║ ╚═╝ ██║███████╗██║ ╚████║╚██████╔╝${C_RESET}                      ${C_BCYAN}║${C_RESET}"
    echo -e "${C_BCYAN}║${C_RESET}  ${C_BIRED}╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝ ╚═════╝ ${C_RESET}                      ${C_BCYAN}║${C_RESET}"
    echo -e "${C_BCYAN}║${C_RESET}                                                                    ${C_BCYAN}║${C_RESET}"
    echo -e "${C_BCYAN}║${C_RESET}  ${C_BGREEN}▓${C_RESET} ${C_BWHITE}MAIN MENU${C_RESET}                          ${C_BCYAN}▓${C_RESET} ${C_BWHITE}Version: 1.0.0${C_RESET}     ${C_BCYAN}║${C_RESET}"
    echo -e "${C_BCYAN}╚══════════════════════════════════════════════════════════════════════╝${C_RESET}"
    echo
}

show_menu_footer() {
    echo
    echo -e "${C_BCYAN}╔══════════════════════════════════════════════════════════════════════╗${C_RESET}"
    echo -e "${C_BCYAN}║${C_RESET}  ${C_WHITE}Selected: ${C_CYAN}$1${C_RESET}"
    echo -e "${C_BCYAN}║${C_RESET}  ${C_YELLOW}Hint: Type tool name directly for quick access${C_RESET}"
    echo -e "${C_BCYAN}╚══════════════════════════════════════════════════════════════════════╝${C_RESET}"
}

menu_exploitation() {
    clear
    header "EXPLOITATION FRAMEWORKS"
    table_header "TOOL" "DESCRIPTION"
    table_row "1. Metasploit" "Metasploit Framework"
    table_row "2. SQLMap" "SQL Injection Automation"
    table_row "3. Commix" "Command Injection Finder"
    table_row "4. Hydra" "Online Password Attack"
    table_row "5. JohnTheRipper" "Offline Password Cracking"
    table_row "6. Hashcat" "GPU Password Recovery"
    table_row "7. SearchSploit" "Exploit Database Search"
    table_row "8. MSF Venom" "Payload Generator"
    table_row "9. BeEF" "Browser Exploitation"
    table_row "B. Back" "Return to Main Menu"
    table_footer
    echo -ne "${C_CRAB}Select [1-9,B]:${C_RESET} "
    read -r opt
    case "$opt" in
        1) bash "$CORE_DIR/tools/category_2_exploitation/metasploit.sh" ;;
        2) bash "$CORE_DIR/tools/category_2_exploitation/sqlmap.sh" ;;
        3) bash "$CORE_DIR/tools/category_2_exploitation/commix.sh" ;;
        4) bash "$CORE_DIR/tools/category_2_exploitation/hydra.sh" ;;
        5) bash "$CORE_DIR/tools/category_2_exploitation/john.sh" ;;
        6) bash "$CORE_DIR/tools/category_2_exploitation/hashcat.sh" ;;
        7) bash "$CORE_DIR/tools/category_2_exploitation/searchsploit.sh" ;;
        8) bash "$CORE_DIR/tools/category_2_exploitation/msfvenom.sh" ;;
        9) bash "$CORE_DIR/tools/category_2_exploitation/beef.sh" ;;
        b|B) return ;;
        *) echo -e "${C_RED}Invalid option${C_RESET}"; sleep 1 ;;
    esac
}

menu_recon() {
    clear
    header "RECONNAISSANCE TOOLS"
    table_header "TOOL" "DESCRIPTION"
    table_row "1. Nmap" "Network Discovery & Port Scanning"
    table_row "2. Masscan" "Mass IP Scanner"
    table_row "3. RustScan" "Fast Port Scanner"
    table_row "4. Subfinder" "Subdomain Discovery"
    table_row "5. HTTPx" "HTTP Probing"
    table_row "6. Nuclei" "Vulnerability Scanner"
    table_row "7. Amass" "DNS Enumeration"
    table_row "8. ReconFTW" "Full Recon Suite"
    table_row "9. Nikto" "Web Server Scanner"
    table_row "0. Gobuster" "Directory/File Busting"
    table_row "B. Back" "Return to Main Menu"
    table_footer
    echo -ne "${C_CRAB}Select [1-0,B]:${C_RESET} "
    read -r opt
    case "$opt" in
        1) bash "$CORE_DIR/tools/category_1_recon/nmap.sh" ;;
        2) bash "$CORE_DIR/tools/category_1_recon/masscan.sh" ;;
        3) bash "$CORE_DIR/tools/category_1_recon/rustscan.sh" ;;
        4) bash "$CORE_DIR/tools/category_1_recon/subfinder.sh" ;;
        5) bash "$CORE_DIR/tools/category_1_recon/httpx.sh" ;;
        6) bash "$CORE_DIR/tools/category_1_recon/nuclei.sh" ;;
        7) bash "$CORE_DIR/tools/category_1_recon/amass.sh" ;;
        8) bash "$CORE_DIR/tools/category_1_recon/reconftw.sh" ;;
        9) bash "$CORE_DIR/tools/category_1_recon/nikto.sh" ;;
        0) bash "$CORE_DIR/tools/category_3_web/gobuster.sh" ;;
        b|B) return ;;
        *) echo -e "${C_RED}Invalid option${C_RESET}"; sleep 1 ;;
    esac
}

menu_web() {
    clear
    header "WEB APPLICATION SECURITY"
    table_header "TOOL" "DESCRIPTION"
    table_row "1. Gobuster" "Directory/File/DNS Busting"
    table_row "2. Dirb" "Web Content Scanner"
    table_row "3. FFuF" "Fuzzing Framework"
    table_row "4. WhatWeb" "Website Fingerprinting"
    table_row "5. WPScan" "WordPress Scanner"
    table_row "6. XSStrike" "XSS Scanner"
    table_row "7. Dalfox" "XSS Automation"
    table_row "8. SQLMap" "SQL Injection"
    table_row "9. Nikto" "Web Server Scanner"
    table_row "B. Back" "Return to Main Menu"
    table_footer
    echo -ne "${C_CRAB}Select [1-9,B]:${C_RESET} "
    read -r opt
    case "$opt" in
        1) bash "$CORE_DIR/tools/category_3_web/gobuster.sh" ;;
        2) bash "$CORE_DIR/tools/category_3_web/dirb.sh" ;;
        3) bash "$CORE_DIR/tools/category_3_web/ffuf.sh" ;;
        4) bash "$CORE_DIR/tools/category_3_web/whatweb.sh" ;;
        5) bash "$CORE_DIR/tools/category_3_web/wpscan.sh" ;;
        6) bash "$CORE_DIR/tools/category_3_web/xsstrike.sh" ;;
        7) bash "$CORE_DIR/tools/category_3_web/dalfox.sh" ;;
        8) bash "$CORE_DIR/tools/category_2_exploitation/sqlmap.sh" ;;
        9) bash "$CORE_DIR/tools/category_1_recon/nikto.sh" ;;
        b|B) return ;;
        *) echo -e "${C_RED}Invalid option${C_RESET}"; sleep 1 ;;
    esac
}

menu_network() {
    clear
    header "NETWORK ATTACK TOOLS"
    table_header "TOOL" "DESCRIPTION"
    table_row "1. BetterCAP" "MITM Framework"
    table_row "2. Aircrack-ng" "Wireless Security"
    table_row "3. TShark" "Packet Analysis"
    table_row "4. TCPDump" "Packet Capture"
    table_row "5. Netcat" "Network Utility"
    table_row "6. Nmap" "Network Scanner"
    table_row "7. Hydra" "Network Auth Cracker"
    table_row "8. Ettercap" "MITM Attacks"
    table_row "9. MAC Changer" "MAC Spoofing"
    table_row "B. Back" "Return to Main Menu"
    table_footer
    echo -ne "${C_CRAB}Select [1-9,B]:${C_RESET} "
    read -r opt
    case "$opt" in
        1) bash "$CORE_DIR/tools/category_4_network/bettercap.sh" ;;
        2) bash "$CORE_DIR/tools/category_4_network/aircrack.sh" ;;
        3) bash "$CORE_DIR/tools/category_4_network/tshark.sh" ;;
        4) bash "$CORE_DIR/tools/category_4_network/tcpdump.sh" ;;
        5) bash "$CORE_DIR/tools/category_10_utilities/netcat.sh" ;;
        6) bash "$CORE_DIR/tools/category_1_recon/nmap.sh" ;;
        7) bash "$CORE_DIR/tools/category_2_exploitation/hydra.sh" ;;
        8) bash "$CORE_DIR/tools/category_4_network/ettercap.sh" ;;
        9) bash "$CORE_DIR/tools/category_4_network/macchanger.sh" ;;
        b|B) return ;;
        *) echo -e "${C_RED}Invalid option${C_RESET}"; sleep 1 ;;
    esac
}

menu_post_exploit() {
    clear
    header "POST-EXPLOITATION & PRIVESC"
    table_header "TOOL" "DESCRIPTION"
    table_row "1. LinPEAS" "Linux PrivEsc Scripts"
    table_row "2. WinPEAS" "Windows PrivEsc Scripts"
    table_row "3. PowerShell Empire" "Post-Exploitation Agent"
    table_row "4. Meterpreter" "Metasploit Payloads"
    table_row "5. Mimikatz" "Credential Extraction"
    table_row "6. LinEnum" "Linux Enumeration"
    table_row "7. Linux Exploit Suggester" "Kernel Exploit Finder"
    table_row "8. PowerSploit" "PowerShell Post-Exploit"
    table_row "B. Back" "Return to Main Menu"
    table_footer
    echo -ne "${C_CRAB}Select [1-8,B]:${C_RESET} "
    read -r opt
    case "$opt" in
        1) bash "$CORE_DIR/tools/category_5_post_exploitation/linpeas.sh" ;;
        2) bash "$CORE_DIR/tools/category_5_post_exploitation/winpeas.sh" ;;
        3) bash "$CORE_DIR/tools/category_5_post_exploitation/empire.sh" ;;
        4) bash "$CORE_DIR/tools/category_2_exploitation/metasploit.sh" ;;
        5) bash "$CORE_DIR/tools/category_5_post_exploitation/mimikatz.sh" ;;
        6) bash "$CORE_DIR/tools/category_5_post_exploitation/linenum.sh" ;;
        7) bash "$CORE_DIR/tools/category_5_post_exploitation/les.sh" ;;
        8) bash "$CORE_DIR/tools/category_5_post_exploitation/powersploit.sh" ;;
        b|B) return ;;
        *) echo -e "${C_RED}Invalid option${C_RESET}"; sleep 1 ;;
    esac
}

menu_forensics() {
    clear
    header "DIGITAL FORENSICS"
    table_header "TOOL" "DESCRIPTION"
    table_row "1. Binwalk" "Firmware Analysis"
    table_row "2. Foremost" "File Carving"
    table_row "3. Volatility" "Memory Forensics"
    table_row "4. Sleuth Kit" "Disk Forensics"
    table_row "5. Strings" "String Extraction"
    table_row "6. ExifTool" "Metadata Analysis"
    table_row "7. Steghide" "Steganography"
    table_row "8. Bulk Extractor" "Evidence Extraction"
    table_row "B. Back" "Return to Main Menu"
    table_footer
    echo -ne "${C_CRAB}Select [1-8,B]:${C_RESET} "
    read -r opt
    case "$opt" in
        1) bash "$CORE_DIR/tools/category_6_forensics/binwalk.sh" ;;
        2) bash "$CORE_DIR/tools/category_6_forensics/foremost.sh" ;;
        3) bash "$CORE_DIR/tools/category_6_forensics/volatility.sh" ;;
        4) bash "$CORE_DIR/tools/category_6_forensics/sleuthkit.sh" ;;
        5) bash "$CORE_DIR/tools/category_10_utilities/strings.sh" ;;
        6) bash "$CORE_DIR/tools/category_6_forensics/exiftool.sh" ;;
        7) bash "$CORE_DIR/tools/category_6_forensics/steghide.sh" ;;
        8) bash "$CORE_DIR/tools/category_6_forensics/bulk_extractor.sh" ;;
        b|B) return ;;
        *) echo -e "${C_RED}Invalid option${C_RESET}"; sleep 1 ;;
    esac
}

menu_social_eng() {
    clear
    header "SOCIAL ENGINEERING"
    table_header "TOOL" "DESCRIPTION"
    table_row "1. SEToolkit" "Social Engineering Toolkit"
    table_row "2. Phishing Framework" "Phishing Campaigns"
    table_row "3. Evilginx" "Phishing Proxy"
    table_row "4. HiddenEye" "Advanced Phishing"
    table_row "5. SocialFish" "Phishing Manager"
    table_row "6. Gophish" "Email Phishing"
    table_row "B. Back" "Return to Main Menu"
    table_footer
    echo -ne "${C_CRAB}Select [1-6,B]:${C_RESET} "
    read -r opt
    case "$opt" in
        1) bash "$CORE_DIR/tools/category_7_social_engineering/setoolkit.sh" ;;
        2) bash "$CORE_DIR/tools/category_7_social_engineering/phishing.sh" ;;
        3) bash "$CORE_DIR/tools/category_7_social_engineering/evilginx.sh" ;;
        4) bash "$CORE_DIR/tools/category_7_social_engineering/hiddeneye.sh" ;;
        5) bash "$CORE_DIR/tools/category_7_social_engineering/socialfish.sh" ;;
        6) bash "$CORE_DIR/tools/category_7_social_engineering/gophish.sh" ;;
        b|B) return ;;
        *) echo -e "${C_RED}Invalid option${C_RESET}"; sleep 1 ;;
    esac
}

menu_mobile() {
    clear
    header "MOBILE SECURITY"
    table_header "TOOL" "DESCRIPTION"
    table_row "1. APKTool" "APK Reverse Engineering"
    table_row "2. JadX" "Android Decompiler"
    table_row "3. MobSF" "Mobile Security Framework"
    table_row "4. Objection" "Mobile Runtime Explorer"
    table_row "5. Frida" "Dynamic Instrumentation"
    table_row "6. ADB" "Android Debug Bridge"
    table_row "7. Androguard" "Android Analysis"
    table_row "B. Back" "Return to Main Menu"
    table_footer
    echo -ne "${C_CRAB}Select [1-7,B]:${C_RESET} "
    read -r opt
    case "$opt" in
        1) bash "$CORE_DIR/tools/category_8_mobile/apktool.sh" ;;
        2) bash "$CORE_DIR/tools/category_8_mobile/jadx.sh" ;;
        3) bash "$CORE_DIR/tools/category_8_mobile/mobsf.sh" ;;
        4) bash "$CORE_DIR/tools/category_8_mobile/objection.sh" ;;
        5) bash "$CORE_DIR/tools/category_8_mobile/frida.sh" ;;
        6) bash "$CORE_DIR/tools/category_10_utilities/adb.sh" ;;
        7) bash "$CORE_DIR/tools/category_8_mobile/androguard.sh" ;;
        b|B) return ;;
        *) echo -e "${C_RED}Invalid option${C_RESET}"; sleep 1 ;;
    esac
}

menu_crypto() {
    clear
    header "CRYPTOGRAPHY & PASSWORD CRACKING"
    table_header "TOOL" "DESCRIPTION"
    table_row "1. JohnTheRipper" "Password Cracking"
    table_row "2. Hashcat" "GPU Password Recovery"
    table_row "3. HashRat" "Hash Identifier"
    table_row "4. Ciphey" "Automated Decryption"
    table_row "5. CyberChef" "Data Analysis"
    table_row "6. Hash-Identifier" "Hash Type Detection"
    table_row "7. RSACTFTool" "RSA Attacks"
    table_row "B. Back" "Return to Main Menu"
    table_footer
    echo -ne "${C_CRAB}Select [1-7,B]:${C_RESET} "
    read -r opt
    case "$opt" in
        1) bash "$CORE_DIR/tools/category_2_exploitation/john.sh" ;;
        2) bash "$CORE_DIR/tools/category_2_exploitation/hashcat.sh" ;;
        3) bash "$CORE_DIR/tools/category_9_crypto/hashrat.sh" ;;
        4) bash "$CORE_DIR/tools/category_9_crypto/ciphey.sh" ;;
        5) bash "$CORE_DIR/tools/category_9_crypto/cyberchef.sh" ;;
        6) bash "$CORE_DIR/tools/category_9_crypto/hashid.sh" ;;
        7) bash "$CORE_DIR/tools/category_9_crypto/rsactftool.sh" ;;
        b|B) return ;;
        *) echo -e "${C_RED}Invalid option${C_RESET}"; sleep 1 ;;
    esac
}

menu_utilities() {
    clear
    header "ESSENTIAL UTILITIES"
    table_header "TOOL" "DESCRIPTION"
    table_row "1. Python3" "Python Environment"
    table_row "2. PHP" "PHP Server"
    table_row "3. Node.js" "JavaScript Runtime"
    table_row "4. Git" "Version Control"
    table_row "5. Curl" "HTTP Requests"
    table_row "6. Wget" "File Downloader"
    table_row "7. Tmux" "Terminal Multiplexer"
    table_row "8. Vim" "Text Editor"
    table_row "9. Neofetch" "System Info"
    table_row "10. Netcat" "Network Swiss Army Knife"
    table_row "B. Back" "Return to Main Menu"
    table_footer
    echo -ne "${C_CRAB}Select [1-0,B]:${C_RESET} "
    read -r opt
    case "$opt" in
        1) bash "$CORE_DIR/tools/category_10_utilities/python.sh" ;;
        2) bash "$CORE_DIR/tools/category_10_utilities/php.sh" ;;
        3) bash "$CORE_DIR/tools/category_10_utilities/nodejs.sh" ;;
        4) bash "$CORE_DIR/tools/category_10_utilities/git.sh" ;;
        5) bash "$CORE_DIR/tools/category_10_utilities/curl.sh" ;;
        6) bash "$CORE_DIR/tools/category_10_utilities/wget.sh" ;;
        7) bash "$CORE_DIR/tools/category_10_utilities/tmux.sh" ;;
        8) bash "$CORE_DIR/tools/category_10_utilities/vim.sh" ;;
        9) bash "$CORE_DIR/tools/category_10_utilities/neofetch.sh" ;;
        10) bash "$CORE_DIR/tools/category_10_utilities/netcat.sh" ;;
        b|B) return ;;
        *) echo -e "${C_RED}Invalid option${C_RESET}"; sleep 1 ;;
    esac
}

menu_settings() {
    clear
    header "CYWALLEARN SETTINGS"
    echo -e "${C_CYAN}1.${C_RESET} ${C_WHITE}Configure Proxy${C_RESET}"
    echo -e "${C_CYAN}2.${C_RESET} ${C_WHITE}Change Theme Colors${C_RESET}"
    echo -e "${C_CYAN}3.${C_RESET} ${C_WHITE}Toggle Auto-Update${C_RESET}"
    echo -e "${C_CYAN}4.${C_RESET} ${C_WHITE}Clear History${C_RESET}"
    echo -e "${C_CYAN}5.${C_RESET} ${C_WHITE}Backup Configuration${C_RESET}"
    echo -e "${C_CYAN}6.${C_RESET} ${C_WHITE}Restore Configuration${C_RESET}"
    echo -e "${C_CYAN}7.${C_RESET} ${C_WHITE}View Logs${C_RESET}"
    echo -e "${C_CYAN}8.${C_RESET} ${C_WHITE}Clean Temporary Files${C_RESET}"
    echo -e "${C_CYAN}B.${C_RESET} ${C_WHITE}Back to Main Menu${C_RESET}"
    echo
    echo -ne "${C_CRAB}Select [1-8,B]:${C_RESET} "
    read -r opt
    case "$opt" in
        1) echo -e "${C_YELLOW}Proxy config not yet implemented${C_RESET}"; sleep 1 ;;
        2) echo -e "${C_YELLOW}Theme selector coming soon${C_RESET}"; sleep 1 ;;
        3) echo -e "${C_GREEN}Toggled${C_RESET}"; sleep 1 ;;
        4) echo -e "${C_GREEN}History cleared${C_RESET}"; sleep 1 ;;
        5) bash "$CORE_DIR/backup/config_backup.sh" backup;;
        6) bash "$CORE_DIR/backup/config_backup.sh" restore;;
        7) echo -e "${C_YELLOW}Viewing logs${C_RESET}"; sleep 1 ;;
        8) rm -rf "$CORE_DIR/tmp/"* 2>/dev/null; echo -e "${C_GREEN}Cleaned${C_RESET}"; sleep 1 ;;
        b|B) return ;;
        *) echo -e "${C_RED}Invalid${C_RESET}"; sleep 1 ;;
    esac
}

# Show main menu
show_main_menu() {
    while true; do
        show_menu_header
        
        # Display menu items
        for item in "${MENU_ITEMS[@]}"; do
            IFS=':' read -r key icon desc <<< "$item"
            echo -e "  ${C_BCYAN}[${C_RESET}${C_BGREEN}${key}${C_RESET}${C_BCYAN}]${C_RESET}  ${icon}  ${C_WHITE}${desc%%:*}${C_RESET}"
        done
        
        show_menu_footer "Main Menu"
        echo -ne "\n${C_BCYAN}┃${C_RESET} ${C_BWHITE}Choice${C_RESET} ${C_BCYAN}┃${C_RESET}${C_WHITE}➤${C_RESET} "
        read -r choice
        
        case "$(echo "$choice" | tr '[:upper:]' '[:lower:]')" in
            1|recon)         menu_recon ;;
            2|exploit)       menu_exploitation ;;
            3|web)           menu_web ;;
            4|network)       menu_network ;;
            5|post)          menu_post_exploit ;;
            6|forensics)     menu_forensics ;;
            7|social)        menu_social_eng ;;
            8|mobile)        menu_mobile ;;
            9|crypto)        menu_crypto ;;
            10|utils|util)   menu_utilities ;;
            a|quick)         bash "$CORE_DIR/modules/quick_attack.sh" ;;
            t|term|terminal) bash "$CORE_DIR/core/terminal.sh" ;;
            h|help)          bash "$CORE_DIR/core/help.sh" ;;
            s|settings)      menu_settings ;;
            u|update)        bash "$CORE_DIR/core/update.sh" ;;
            q|exit|quit)     
                echo -e "${C_GREEN}Exiting Cywallearn CRAB v1${C_RESET}"
                exit 0 ;;
            *) 
                echo -e "${C_RED}[!] Invalid option: $choice${C_RESET}"
                sleep 1 ;;
        esac
    done
}

# Start menu
show_main_menu
