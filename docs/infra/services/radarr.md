---
service: Radarr
listen_port_hint: 7878
depends_on:
  - *ARR Shared Volumes

---
# Radarr

## Summary
What it does and where it runs.

## Endpoints (examples)
- HTTP: `https://radarr.homelab.local` (if proxied)
- Direct: `x.x.42.22:7878` (update per host)

## Backing Services
- *ARR Shared Volumes


## Notes
- Security, backups, monitoring hooks.
