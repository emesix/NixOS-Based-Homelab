# Live Serial Install — Session Plan

**Console:** `ttyS0 @ 115200 8N1`  
**Host ISO:** NixOS 25.05 (USB)  
**Flow:** Copper first (`enp8s0` host DHCP), SFP last → passthrough to OPNsense

## Checkpoints
- **C0 — Preflight & Serial Boot:** USB boots, shell reachable
- **C1 — Network Online on Host:** `enp8s0` via DHCP, internet OK
- **C2 — Disks & ZFS:** mirror pool + datasets created & mounted
- **C3 — Generate Config:** serial console + networking + libvirt in config
- **C4 — Install & Reboot:** system installs, boots over serial
- **C5 — Post-boot Verify:** services OK, ready for OPNsense VM
- **C6 — VM Create (later):** define OPNsense (serial), map NICs, first boot

At each checkpoint, capture output and append to `logs/SESSION-2025-11-11_1232.md`.
