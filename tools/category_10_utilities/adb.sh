#!/bin/bash
source "$(dirname "$0")/../../config/colors.sh"
if ! command -v adb &>/dev/null; then echo -e "${C_RED}[!] adb not installed${C_RESET}"; exit 1; fi
echo -e "${C_BCYAN}ADB - Android Debug Bridge${C_RESET}"
echo -e "1. List devices"
echo -e "2. Shell access"
echo -e "3. Install APK"
echo -e "4. Screenshot"
echo -e "5. Screen recording"
echo -ne "${C_YELLOW}Select:${C_RESET} "; read -r m
case "$m" in
    1) adb devices ;;
    2) adb shell ;;
    3) echo -ne "APK path: "; read -r a; adb install "$a" ;;
    4) adb exec-out screencap -p > screen_$(date +%s).png; echo -e "${C_GREEN}[✓] Screenshot saved${C_RESET}" ;;
    5) adb shell screenrecord /sdcard/demo.mp4 & echo -e "${C_YELLOW}Recording... Ctrl+C to stop${C_RESET}" ;;
esac