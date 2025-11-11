# NixOS Host Configuration (Serial / Libvirt / VFIO)

Target: **NixOS 25.05**, Nix **2.32.3**, serial-first.

## Serial console (host)
```nix
{
  boot.kernelParams = [
    "console=tty0"
    "console=ttyS0,115200n8"
  ];
  services.getty.serialDevices = [ "ttyS0" ];
}
```

(Optional, GRUB serial if you use GRUB instead of systemd-boot):
```nix
{
  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.extraConfig = ''
    serial --unit=0 --speed=115200 --word=8 --parity=no --stop=1
    terminal_input serial console
    terminal_output serial console
  '';
}
```

## Libvirt / QEMU (enable hypervisor)
```nix
{ config, pkgs, ... }:
{
  virtualisation.libvirtd.enable = true;
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
  programs.virt-manager.enable = true; # optional GUI (not needed over serial)
}
```

## Host NIC policy
```nix
{
  networking.interfaces.enp8s0.useDHCP = true;

  # Reserve these for the VM (no IPs/bridges on host):
  networking.interfaces.enp8s1.useDHCP = false;
  networking.interfaces.enp8s2.useDHCP = false;
  # add more: enp8s3, enp9s0 (SFP), ...
}
```

## IOMMU + VFIO (PCI passthrough)
Intel shown; for AMD use `amd_iommu=on`:
```nix
{
  boot.kernelParams = [ "intel_iommu=on" ];
  boot.initrd.kernelModules = [ "vfio_pci" "vfio" "vfio_iommu_type1" ];
}
```

### Apply
```bash
sudo nixos-rebuild switch
sudo reboot
```
