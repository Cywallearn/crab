<div align="center">

# 🦀 Cywallearn - CRAB v1

### Ultimate Termux Hacking Framework

![Version](https://img.shields.io/badge/version-1.0.0-red)
![Platform](https://img.shields.io/badge/platform-Android%20%7C%20Termux-brightgreen)
![License](https://img.shields.io/badge/license-MIT-blue)
![Tools](https://img.shields.io/badge/tools-50%2B-orange)

---

**CRAB = Cyber Recon & Attack Bridge**

**Transform your Android device into a Kali Linux-grade penetration testing machine.**

[Features](#features) • [Installation](#installation) • [Usage](#usage) • [Tools](#tools) • [Documentation](#documentation)

---

</div>

## 🚀 Overview

Cywallearn CRAB v1 is a comprehensive penetration testing framework designed specifically for Termux on Android. It brings Kali Linux-level capabilities to your mobile device with 50+ pre-configured tools, automated attack modules, and an intuitive Kali-like terminal interface.

### Why Cywallearn?

- **Mobile Pentesting**: Carry a full hacking suite in your pocket
- **Kali Linux Experience**: Familiar interface and tool organization
- **Automated Attacks**: One-command attack chains
- **Educational**: Built-in learning center for every tool
- **Modern UI**: Beautiful terminal with theming support

## ✨ Features

### 🔬 Reconnaissance
- Nmap, Masscan, RustScan for port scanning
- Subfinder, Amass for subdomain enumeration
- Nuclei for vulnerability scanning
- HTTPx for web probing

### 💥 Exploitation
- Metasploit Framework integration
- SQLMap for SQL injection
- Hydra for brute force attacks
- John & Hashcat for password cracking
- SearchSploit for exploit database

### 🌐 Web Security
- Gobuster, Dirb, FFuF for directory busting
- WPScan for WordPress
- XSStrike & Dalfox for XSS
- WhatWeb for fingerprinting

### 📡 Network Attacks
- BetterCAP for MITM
- Aircrack-ng for wireless
- TShark & TCPDump for packet analysis

### 🔧 Post-Exploitation
- LinPEAS/WinPEAS for privilege escalation
- PowerShell Empire
- Linux Exploit Suggester

### 🔬 Forensics
- Binwalk, Foremost, Bulk Extractor
- Volatility memory analysis
- Sleuth Kit disk forensics

### 📱 Mobile
- APKTool, JadX for reverse engineering
- MobSF security framework
- Frida & Objection for runtime analysis

### 🎭 Social Engineering
- SEToolkit integration
- Evilginx, HiddenEye, Gophish

### ⚡ Quick Attack Module
- One-shot reconnaissance
- Automated exploitation chains
- Payload generation
- Password cracking pipelines

---

## 📦 Installation

### Prerequisites
- Android device with Termux installed
- At least 4GB free storage
- Internet connection

### Quick Install

```bash
# Update Termux
pkg update && pkg upgrade -y

# Clone the repository
git clone https://github.com/yourusername/cywallearn-crab-v1.git

# Navigate to directory
cd cywallearn-crab-v1

# Run installer
bash install.sh

# Launch Cywallearn
bash main.sh