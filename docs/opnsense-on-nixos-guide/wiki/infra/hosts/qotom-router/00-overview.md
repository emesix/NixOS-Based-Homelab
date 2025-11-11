# qotom-router — OPNsense as a VM on NixOS (25.05, Nix 2.32.3)

**Goal**: Use **NixOS 25.05** as the hypervisor; run **OPNsense** (router/firewall) inside a VM.  
**Host NIC policy**: `enp8s0` = DHCP for the host; all other NICs go to the OPNsense VM.  
**Console**: All steps are serial-first. Host: `ttyS0 @ 115200 8N1`. VM: serial-only console via `virsh console`.

**Why this split?**
- The host stays reachable (SSH/Deploy/Monitoring) via `enp8s0`.
- OPNsense gets direct NIC access (WAN/LAN/DMZ/SFP) for clean routing/perf.

**What you’ll get**
- Libvirt/QEMU with OVMF (UEFI) or BIOS (for pure serial workflows)
- IOMMU/VFIO ready for PCI NIC passthrough
- Reproducible VM definition for serial-only OPNsense
- First-boot interface mapping and post-install hardening
