# Homelab Wiki (Markdown-Only)

This repository contains **GitHub-friendly Markdown** that mirrors the structure of the (future) Wiki.  
All sensitive values are masked. Config and docs use the same naming and paths to stay DRY.

- IPv4 is documented as `x.x.42.0/24`, `x.x.90.0/24` (masking the first two octets).
- IPv6 uses a private ULA prefix as `fdxx:xxxx:xxxx:0042::/64`, `fdxx:xxxx:xxxx:0090::/64`.
- Hosts import roles/services/components conceptually (see `/docs/infra/**`).

> This repo is **Markdown-only** to start collaboration. Nix modules can be added later with identical slugs/paths.

## Quick Links
- [/docs/index.md](docs/index.md)
- [/docs/infra/network/index.md](docs/infra/network/index.md)
- [/docs/runbooks/index.md](docs/runbooks/index.md)
