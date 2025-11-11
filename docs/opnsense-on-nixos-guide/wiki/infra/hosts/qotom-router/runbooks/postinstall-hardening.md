# Runbook: Post-install Hardening

- Restrict GUI to LAN/admin IPs (Firewall → Rules).
- Disable offloading (Interfaces → Settings).
- Minimal firewall rules: deny inbound on WAN; allow required outbound.
- Backups: VM snapshot + OPNsense XML export.
- Monitoring/logs: forward to your stack (Prometheus/Grafana/ELK).
