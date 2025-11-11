# Final Checklist

- [ ] Host on NixOS 25.05; serial console working on `ttyS0 @ 115200 8N1`
- [ ] `enp8s0` = DHCP on host; other NICs untouched
- [ ] IOMMU enabled; vfio-pci bound for passthrough NICs
- [ ] OPNsense VM created; serial-only console usable via `virsh console`
- [ ] WAN/LAN assigned; LAN = `192.168.42.1/24`; DHCP on LAN enabled
- [ ] Offloading disabled; baseline rules in place
- [ ] Backups + snapshots taken; notes committed to repo
- [ ] SFP handover completed last without losing host internet
