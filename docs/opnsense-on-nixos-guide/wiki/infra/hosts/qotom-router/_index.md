---
title: qotom-router — OPNsense VM on NixOS (25.05, Nix 2.32.3)
description: Serial-first, staged NIC migration. Host uses enp8s0 via DHCP; other NICs go to the OPNsense VM.
---

## Summary

- **Host**: NixOS 25.05 (Nix 2.32.3) as KVM/libvirt hypervisor
- **Console**: Serial-first end-to-end (`ttyS0 @ 115200 8N1`), including VM via `virsh console`
- **Network policy**: `enp8s0` is DHCP for the host; all other interfaces (incl. SFP) are reserved for OPNsense
- **Order**: Configure copper `enp*s0` first; migrate SFP last to avoid internet loss

### Documents
- **Runbooks**
  - [Install OPNsense on NixOS (serial-first)](runbooks/install-opnsense-on-nixos.md)
  - [Staged NIC migration (copper first, SFP last)](runbooks/staged-nic-migration.md)
  - [Enable serial console on host & bootloader](runbooks/serial-console-host.md)
- **How-to**
  - [Libvirt/QEMU & PCI passthrough](howto/libvirt-and-passthrough.md)
  - [virt-install examples (BIOS serial & OVMF)](howto/virt-install-examples.md)
- **Ops**
  - [Final checklist](ops/checklist.md)
  - [Troubleshooting](../qotom-router/troubleshooting.md)

### Assets
- [Libvirt domain XML (serial template)](../../../assets/opnsense/libvirt/opnsense-serial-template.xml)
- [vfio bind helper](../../../assets/opnsense/scripts/vfio-bind.sh)
- [virt-install helper](../../../assets/opnsense/scripts/virt-define-opnsense.sh)
