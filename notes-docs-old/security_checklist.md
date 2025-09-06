# Security Checklist for Projects & QA Systems

This checklist consolidates key practices from modules 1–4 and final assessment of the DevSecOps course.  
Use it as a reference for designing secure systems **before development** and for performing **post-build vulnerability checks**.

---

## 🔒 Design & Development Stage

### Secure Software Development Lifecycle (SDLC)
- Define **requirements, design, develop, test, and deploy** securely from the start.
- Integrate **DevSecOps** practices: automate security into every stage of the pipeline.
- Implement **threat modeling** during the **design phase** (not later).
- Apply the **principle of least privilege (PoLP)** when assigning roles & access.

### Code Practices
- Use **trusted dependencies** only; avoid packages not updated in 12+ months.
- Perform **dependency management & scanning** (e.g., SCA tools like OWASP Dependency-Check, Snyk).
- Apply **secure coding standards** and ensure code reviews include security aspects.
- Validate and sanitize **all input**; use **output encoding** to handle special characters safely.
- Implement **secure error handling** (no verbose messages that reveal system details).

### Encryption & Data Security
- Use **TLS (latest version)** for secure communications; enforce certificate checks.
- Apply **authenticated encryption** for sensitive data at rest and in transit.
- Avoid sending unencrypted data to untrusted sources.
- Use **secrets management solutions** (Vault, Snyk, GitHub Secrets) for API keys and credentials.

### Testing & Analysis
- **Static Application Security Testing (SAST):** Scan source code before execution.
- **Dynamic Application Security Testing (DAST):** Evaluate running applications.
- **Interactive Application Security Testing (IAST):** Detect vulnerabilities during runtime testing.
- Use **automated code review tools** for large codebases.

---

## 🛡️ Post-Build / QA Stage

### Vulnerability Analysis & Monitoring
- Run **continuous vulnerability scans** (Burp Suite, Nessus, ZAP, Snyk).
- Perform **software composition analysis (SCA)** to check open-source & third-party components.
- Implement **runtime protection** (e.g., RASP) in production environments.
- Configure **logging & monitoring**: capture failed logins, abnormal requests, and system errors securely.

### OWASP Top Risks (Mitigation Checklist)
- **Broken Access Control:** Ensure proper role-based permissions.
- **Cryptographic Failures:** Encrypt sensitive data at rest & in transit with strong algorithms.
- **Injection Attacks (SQL/LDAP/Command):** Use parameterized queries & secure APIs.
- **Cross-Site Scripting (XSS):** Escape suspect lists, validate input, and disable HTTP TRACE.
- **Server-Side Request Forgery (SSRF):** Harden servers, sanitize inputs, and avoid sending unsigned data.
- **Security Misconfiguration:** Remove unused features, keep frameworks updated, use secure defaults.

### QA & Ongoing Security
- Regularly **check open ports**; close unnecessary ones by default.
- Perform **auditing & logging reviews** to track who accessed what.
- Ensure **multifactor authentication (MFA)** for accounts & sessions.
- Monitor cloud assets with **IAM (Identity and Access Management)** and enforce role-based access.
- Run **CodeQL or similar code scanning** in repositories for ongoing analysis.

---

## ✅ Quick Use Cases

- **Before coding:** Run threat modeling, validate dependencies, and plan for secure logging.  
- **During development:** Use SAST, DAST, and automated code reviews.  
- **After build/QA:** Scan with Snyk/Nessus/ZAP, apply runtime protection, and verify OWASP Top 10 coverage.  
- **In production:** Monitor logs, enforce MFA, patch dependencies, and conduct regular audits.

---

**Remember:** Security is not a one-time task—it is a continuous process throughout the lifecycle of your project.

