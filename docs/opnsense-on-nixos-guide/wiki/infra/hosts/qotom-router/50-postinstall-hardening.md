# Post-install: Hardening & Ops

## 1) Access & management
- Host reachable only on `enp8s0` (DHCP). Limit host services.
- In OPNsense, restrict GUI to LAN / admin IPs (Firewall → Rules).
- Disable password SSH on the host; use keys only.

## 2) Firewall rules (minimal)
- LAN: allow established/related; allow outbound as needed.
- WAN: block by default, allow only expected inbound (normally none).
- DMZ (if used): restrict east-west; only allow required paths to LAN.

## 3) Offloading (VM best practice)
In OPNsense GUI: *Interfaces → Settings* → disable checksum/TSO/LRO offloading.

## 4) Backups & rollback
- VM snapshot after baseline (qcow2 + libvirt XML).
- OPNsense: *System → Configuration → Backups* (download XML).
- Host: keep generations; document a tested rollback path.
