# Application Security for Developers and DevOps Professionals — Cheatsheet (JDW)

This file contains quick reference commands, tools, and practices by module.

---

## 🧩 Module 1: Security Basics

### OpenSSL
- `openssl -help` → list options  
- `openssl enc -list` → list ciphers  
- Encrypt file:  
  ```bash
  openssl enc -aes-256-cfb -salt -in myphoto.jpg -out myphoto_enc.jpg -k password
  ```
- Decrypt file:  
  ```bash
  openssl enc -d -aes-256-cfb -in myphoto_enc.jpg -out myphoto_dec.jpg -k password
  ```

### Nmap Scans
- TCP connect: `nmap -sT target`  
- SYN stealth: `nmap -sS target`  
- UDP: `nmap -sU target`  
- ACK scan: `nmap -sA target`  
- Version detect: `nmap -sV target`  
- OS detect: `nmap -O target`  
- Script scan: `nmap -sC target`  
- Traceroute: `nmap --traceroute target`  

---

## 🧩 Module 2: Testing & Mitigation

- **Static analysis (SAST):** scan source code.  
- **Dynamic analysis (DAST):** scan running app.  
- Tools: Burp Suite, Nessus, ZAP, Snyk.  
- Runtime protection: IAST, RASP.  
- SCA (dependency scanning): OWASP Dependency-Check, Dependency-Track.  

---

## 🧩 Module 3: OWASP Risks

- SQL Injection prevention: use parameters, validate inputs, restrict privileges.  
- Prevent XSS: sanitize input, escape output, disable HTTP TRACE, avoid unsafe sinks.  
- Secrets management: GUI, CLI, API tools (e.g., Vault).  

---

## 🧩 Module 4: Security Best Practices

### Git/GPG
- `git clone REPO_URL`  
- `gpg --full-generate-key` → create key  
- `gpg --list-secret-keys` → list keys  

### Flask
- Run with debug: `flask run --debug`  
- Add Talisman headers:  
  ```python
  from flask_talisman import Talisman
  app = Flask(__name__)
  talisman = Talisman(app)
  ```

### Pass (password manager)
- Init: `pass init`  
- Insert: `pass insert example.com`  
- Show: `pass show example.com`  

### General
- `cat file.txt` → show file contents  
- `cd dir/` → change directory  
- `grep "pattern" file` → search in file  
- `npm start` → run Node.js app  
- `pip install package` → install Python pkg  
- `rm file1 file2` → delete files  
- `sudo apt-get update && sudo apt-get upgrade` → update system  
- `wget URL` → download file  
