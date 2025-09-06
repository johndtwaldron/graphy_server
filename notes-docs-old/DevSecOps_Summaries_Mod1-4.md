# Application Security for Developers and DevOps Professionals — Summaries (JDW)

This file contains condensed **learning summaries & highlights** from Modules 1–4.

---

## 🧩 Module 1: Introduction to Security for Application Development

- OSI model = 7 layers: Physical → Data Link → Network → Transport → Session → Presentation → Application.  
- Security must be embedded in the SDLC (requirements → design → develop → test → deploy).  
- **DevSecOps** = DevOps + security integration at every stage.  
- Security patterns = reusable solutions to recurring security threats.  
- TLS/SSL secure communications between clients/servers. TLS requires valid certificates and supported versions.  
- **OpenSSL** = toolkit for managing TLS/SSL, keys, certs.  
- **Nmap** = network scanner, detects hosts, services, OS, vulnerabilities. Used by admins, security professionals, penetration testers.  

---

## 🧩 Module 2: Security Testing and Mitigation Strategies

- Mitigation strategies reduce risks from vulnerabilities.  
- **Static analysis (SAST):** scans source code before execution.  
- **Dynamic analysis (DAST):** tests code in execution.  
- **Secure code review**: manual + automated scanning of critical components.  
- Tools: Burp Suite, Nessus, ZAP.  
- **Runtime protection (RASP):** defends apps while running.  
- **Software Component Analysis (SCA):** detects open-source components & vulnerabilities.  
- Continuous security analysis → faster feature delivery + fewer risks.  

---

## 🧩 Module 3: OWASP Application Security Risks

- **OWASP Top 10** = consensus report of top web app security risks. Steps: data gathering → survey → analyze → draft → review → release.  
- Key risks: Broken access control, cryptographic failures, injection (SQL, LDAP, OS command), cross-site scripting (XSS), insecure design, vulnerable/outdated components, SSRF, logging/monitoring failures.  
- **SQL injection** types: manipulation, code injection, function call injection, buffer overflow.  
- **XSS** types: stored (persistent), reflected, blind.  
- **Secrets management** = store/manage credentials via GUI, CLI, API.  
- Preventive strategies: parameterized queries, server-side validation, secure APIs, robust error handling, multifactor auth.  

---

## 🧩 Module 4: Code Development Practices

- Embed security early in SDLC to save cost + reduce vulnerabilities.  
- Dependencies = external libraries → speed development but must be vetted.  
- Secure error handling = avoid exposing sensitive details.  
- **Secure environment:** collaboration with security teams, monitoring/logging, restricted repo access.  
- **Insecure environment:** compromised machines, no auditing, unrestricted repo access.  

**CodeQL (GitHub):**  
- Treats code as data → queries code for vulnerabilities.  
- Default (auto-config) or Advanced (custom YAML).  
- Supports: C, C++, C#, Java/Kotlin, Go, Ruby, Python, JS/TS, Swift.  
- Runs on pushes/PRs + weekly scans.  
