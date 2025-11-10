---
service: Sonarr
listen_port_hint: 8989
depends_on:
  - *ARR Shared Volumes

---
# Sonarr

## Summary
What it does and where it runs.

## Endpoints (examples)
- HTTP: `https://sonarr.homelab.local` (if proxied)
- Direct: `x.x.42.22:8989` (update per host)

## Backing Services
- *ARR Shared Volumes


## Notes
- Security, backups, monitoring hooks.
