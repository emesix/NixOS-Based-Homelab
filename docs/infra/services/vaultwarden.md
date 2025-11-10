---
service: Vaultwarden
listen_port_hint: 8080
depends_on:
  - PostgreSQL (if used)

---
# Vaultwarden

## Summary
What it does and where it runs.

## Endpoints (examples)
- HTTP: `https://vaultwarden.homelab.local` (if proxied)
- Direct: `x.x.42.22:8080` (update per host)

## Backing Services
- PostgreSQL (if used)


## Notes
- Security, backups, monitoring hooks.
