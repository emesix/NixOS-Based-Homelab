---
service: Gitea
listen_port_hint: 3000
depends_on:
  - PostgreSQL

---
# Gitea

## Summary
What it does and where it runs.

## Endpoints (examples)
- HTTP: `https://gitea.homelab.local` (if proxied)
- Direct: `x.x.42.22:3000` (update per host)

## Backing Services
- PostgreSQL


## Notes
- Security, backups, monitoring hooks.
