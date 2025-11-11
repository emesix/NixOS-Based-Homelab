# qotom-router

**Role:** NixOS 25.05 host (Nix 2.32.3) running **OPNsense** as a virtual router.  
**Serial-first:** All steps are operable over `ttyS0 @ 115200 8N1`.  
**NIC policy:** `enp8s0` = DHCP for the host; all other NICs passed to the OPNsense VM.  
**Order:** Configure copper `enp*s0` first, perform SFP handover last.

## Quick links
- **Configs:**  
  - [NixOS host (serial, libvirt, vfio)](configs/nixos-host.md)  
  - [Libvirt / virt-install examples](configs/libvirt.md)  
  - [VFIO details & binding](configs/vfio.md)  
- **Runbooks:**  
  - [Serial install of OPNsense VM](runbooks/serial-install-opnsense-vm.md)  
  - [Staged NIC migration (copper first, SFP last)](runbooks/staged-nic-migration.md)  
  - [Post-install hardening](runbooks/postinstall-hardening.md)  
  - [Troubleshooting](runbooks/troubleshooting.md)  
- **Checklist:**  
  - [Go-live checklist](checklist.md)

## Components (shared docs)
- [Intel I226-V NIC](../../components/nic-intel-i226-v/index.md)
- [Intel X553 SFP NIC](../../components/nic-intel-x553-sfp/index.md)
