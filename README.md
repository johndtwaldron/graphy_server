Set-Content README.md @"
# graphy_server — DevSecOps PoW (IBM course final lab)

---

Coursea Course Link ([link]([https://www.coursera.org/learn/test-and-behavior-driven-development-tdd-bdd/home/module/1](https://www.coursera.org/learn/application-security-for-developers-devops)))


A tiny Node.js server used to practice **application security** and **container hardening**.  
This repo documents a real pass of scanning, fixing, and locking down the image + deps.

> **Repo:** `johndtwaldron/graphy_server`

# 🎓 Certification

Cert URL PDF copy of my issued certificate: : Containers&K8s.JDW.cert.IBMDesign20250903-30-49pn3i.pdf

![Credly Badge: ](security-for-professionas-and-devops-professionals.png)

[Cert URL]([https://coursera.org/share/7258463a96a56c631fe34ded9022c919](https://www.credly.com/badges/30760d49-6e1a-4296-9894-7b0d9af748af/linked_in_profile))
PDF copy of my issued certificate: : [Containers&K8s.JDW.cert.IBMDesign20250903-30-49pn3i.pdf](IBMDesign20250906-31-7hiobx.pdf)



---

## What we changed (short version)

- **Base image upgrades**
  - `node:hydrogen-buster` ➜ `node:20-bookworm-slim` ➜ **`node:20-alpine` (runtime)**
- **Multi-stage build**
  - Separate `build` and `runtime` stages to keep the final image small and reduce attack surface.
- **Non-root runtime**
  - Drop to the bundled `node` user (`USER node`).
- **Locked install**
  - `npm ci --omit=dev` for reproducible, minimal runtime deps.
- **Snyk triage + fixes**
  - Eliminated all **Critical/High/Medium** issues raised by Snyk for the Dockerfile path by upgrading the base image and reducing packages in the final stage.
- **Docs**
  - Archived prior Dockerfiles under `docs/prev-versions/` for traceability.

---

## Tooling used

- **Snyk** (SCA & container scan) — imported GitHub repo, scanned Dockerfile & dependencies, followed fix PR suggestions (base image alternatives).
- **GitHub** — branch/PR flow for Dockerfile changes.
- **(Optional) CodeQL** — can be enabled from **Security ➜ Code scanning** to add static queries on pushes/PRs.

---

## Reproducing the scans

### Snyk (UI)
1. Log in at <https://app.snyk.io> with GitHub.
2. **Add projects** ➜ select this repo ➜ import.
3. Open **Dockerfile** target ➜ review **Issues** ➜ apply **Alternative upgrades** (e.g., `node:20-alpine`).
4. Re-scan after each change (Snyk re-runs on push).

### Snyk CLI (optional)
```bash
# in the repo directory
npm i -g snyk
snyk auth
snyk test --docker node:20-alpine
snyk container test --file=Dockerfile .
```

# Local development
```bash
# install node deps (dev)
npm ci

# run
npm start
server listens on :8080 (see Dockerfile)
```

# Container build & run
```bash
# build the multi-stage image
docker build -t graphy-server:latest .

# run as non-root (Dockerfile sets USER node)
docker run --rm -p 8080:8080 graphy-server:latest
```


# Security practices applied
Least privilege: run as non-root (USER node).

Small base: use alpine for runtime to reduce packages.

Multi-stage: dev build tools never reach the final image.

Reproducible installs: npm ci and omit dev deps in runtime.

Continuous scanning: Snyk watches the repo and suggests base-image upgrades as new CVEs land.

Traceability: previous Dockerfiles stored under docs/prev-versions/.

# Prior Dockerfiles
See docs/notes-doc-old/:

df0 : Dockerfile.node18-buster.old

df1 : Dockerfile.node20-bookworm-slim.old
