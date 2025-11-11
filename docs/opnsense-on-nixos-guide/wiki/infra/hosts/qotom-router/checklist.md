# Go-live Checklist

- [ ] Host NixOS 25.05; serial console on `ttyS0 @ 115200 8N1`
- [ ] `enp8s0` DHCP for host; others reserved for VM
- [ ] IOMMU enabled; vfio-pci bound for passthrough NICs
- [ ] OPNsense VM created; serial-only console reachable
- [ ] LAN set to `192.168.42.1/24`; DHCP on LAN
- [ ] WAN working (copper first → SFP last)
- [ ] Offloading disabled; baseline firewall rules
- [ ] Snapshots + OPNsense XML backup stored
