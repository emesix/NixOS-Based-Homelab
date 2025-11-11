# Host Preparation (NixOS 25.05 with Serial-First)

> ISO used: `nixos-graphical-25.05.*-x86_64-linux.iso`. If the graphical ISO does **not** emit serial output, use the *minimal* ISO or attach a temporary display/keyboard only for installation, then switch to serial-only afterward.

## 1) Enable virtualization + OVMF (or BIOS)
```nix
{ config, pkgs, ... }:
{
  virtualisation.libvirtd.enable = true;

  # UEFI firmware for VMs (works with serial for guests that support it).
  virtualisation.libvirtd.qemu = {
    package = pkgs.qemu_kvm;
    ovmf.enable = true;
    ovmf.packages = [
      (pkgs.OVMF.override {
        secureBoot = true;
        tpmSupport  = true;
      }).fd
    ];
  };

  programs.virt-manager.enable = true; # optional GUI admin (not used over serial)
}
```

If you prefer **pure serial for the VM install**, you can choose BIOS boot for the VM later (see `45-virt-install-examples.md`).

## 2) Host network policy
We want only `enp8s0` on DHCP; the rest untouched (reserved for the VM):
```nix
{
  networking.interfaces.enp8s0.useDHCP = true;

  # Keep these “free” for the VM. Do NOT assign IPs/bridges here.
  networking.interfaces.enp8s1.useDHCP = false;
  networking.interfaces.enp8s2.useDHCP = false;
  # add more if present: enp8s3, enp9s0 (SFP), ...
}
```
**Order of operations**: Copper `enp*s0` first; SFP last (see `35-staged-nic-migration.md`).

## 3) IOMMU + VFIO for PCI passthrough
Enable IOMMU and preload VFIO modules (Intel shown; use `amd_iommu=on` for AMD):
```nix
{
  boot.kernelParams = [ "intel_iommu=on" ];
  boot.initrd.kernelModules = [ "vfio_pci" "vfio" "vfio_iommu_type1" ];
}
```

**Check after reboot:**
```bash
dmesg | grep -i iommu
lsmod | grep vfio
```

## 4) Apply & reboot
```bash
sudo nixos-rebuild switch
sudo reboot
```
