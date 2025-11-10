# NixOS Homelab Bootstrap (Qotom + 2× HX310)

This bundle gives you a **drop-in** /etc/nixos with:
- `inventory.json` as the single source of truth,
- modules that render FE/BE NICs, users, tmpfiles, docker networks,
- container definitions for DB + ARR hosts,
- SOPS template for secrets, and
- minimal host stubs.

## Quick Start
1) Set hostname: `sudo hostnamectl hostname hx310-db` (or qotom-router / hx310-arr)
2) Copy this folder to `/etc/nixos`
3) Generate host age key:
   ```bash
   sudo install -d -m 700 /var/lib/sops-nix
   sudo age-keygen -o /var/lib/sops-nix/key.txt
   sudo chmod 400 /var/lib/sops-nix/key.txt
   ```
4) Edit `/etc/nixos/inventory.json`: replace **MACs** (fe/be) and adjust anything else.
5) Build: `sudo nixos-rebuild switch --flake /etc/nixos#$(hostname)`

## Notes
- VLANs: FE 10.42.10.0/24, BE 10.42.20.0/24, MGMT 10.42.5.0/24
- Qotom runs OPNsense as a VM (prepare bridges, then import ISO)
- HX310-DB runs Postgres/Vaultwarden/Gitea/Wiki.js
- HX310-ARR runs *ARR stack*, mount UNRAID via NFS at `/srv/downloads` & `/srv/media`
- Harden: no WAN exposure; admin from MGMT; SSH keys only.

## Secrets
Replace AGE pubkeys in `.sops.yaml`, then create encrypted files with `sops`:
`EDITOR=nano sops secrets/hx310-db.yaml`

Have fun!
