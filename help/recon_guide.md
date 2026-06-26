# Reconnaissance Guide

## What is Recon?

Reconnaissance is gathering information about a target before launching attacks.

## Phases

### 1. Passive Recon (No direct contact)
- WHOIS lookups
- DNS enumeration (subfinder, amass)
- Search engine queries
- Social media OSINT

### 2. Active Recon (Direct contact)
- Port scanning (nmap, masscan)
- Service fingerprinting (whatweb)
- Directory busting (gobuster, ffuf)

## Tool Examples

### Nmap
```bash
nmap -sV -p- 192.168.1.1
nmap -A -T4 scanme.nmap.org
nmap -sn 192.168.1.0/24