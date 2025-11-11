# Ops — Final Checklist

- [ ] Host on NixOS 25.05; serial console on `ttyS0 @ 115200 8N1`
- [ ] `enp8s0` = DHCP on host; others untouched
- [ ] IOMMU enabled; vfio-pci bound for passthrough NICs
- [ ] OPNsense VM created; serial console usable via `virsh console`
- [ ] WAN/LAN mapped; LAN = `192.168.42.1/24`; DHCP on LAN enabled
- [ ] Offloading disabled in OPNsense
- [ ] Backups + snapshots taken
- [ ] SFP handover done last without losing internet
