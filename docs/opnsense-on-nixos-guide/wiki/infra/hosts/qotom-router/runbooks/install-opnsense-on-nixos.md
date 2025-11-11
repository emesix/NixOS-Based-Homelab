# Runbook — Install OPNsense on NixOS (Serial-First)

> ISO used for the host: `nixos-graphical-25.05.*-x86_64-linux.iso` (or minimal).  
> OPNsense: prefer **serial** image (`*-serial-amd64.img`) for text installer over serial.

## 1) Prepare host (libvirt, network, vfio)

Add to `/etc/nixos/configuration.nix`:

```nix
{ config, pkgs, ... }:
{
  # Serial console everywhere
  boot.kernelParams = [ "console=tty0" "console=ttyS0,115200n8" ];
  services.getty.serialDevices = [ "ttyS0" ];

  # Hypervisor
  virtualisation.libvirtd.enable = true;
  virtualisation.libvirtd.qemu = {
    package = pkgs.qemu_kvm;
    ovmf.enable = true;
    ovmf.packages = [ (pkgs.OVMF.override { secureBoot = true; tpmSupport = true; }).fd ];
  };

  # Host network policy
  networking.interfaces.enp8s0.useDHCP = true;
  networking.interfaces.enp8s1.useDHCP = false;
  networking.interfaces.enp8s2.useDHCP = false;
  # add more if present: enp8s3, enp9s0 (SFP), ...

  # IOMMU + VFIO
  boot.kernelParams = config.boot.kernelParams ++ [ "intel_iommu=on" ]; # or amd_iommu=on
  boot.initrd.kernelModules = [ "vfio_pci" "vfio" "vfio_iommu_type1" ];
}
```

Apply and reboot:
```bash
sudo nixos-rebuild switch
sudo reboot
```

**Verify:**
```bash
systemctl status libvirtd
dmesg | grep -i iommu
```

## 2) Create VM storage
```bash
sudo qemu-img create -f qcow2 /var/lib/libvirt/images/opnsense.qcow2 16G
```

## 3) Define the VM
- Option A: Use the helper script: `assets/opnsense/scripts/virt-define-opnsense.sh` (edit PCI/BUS paths).
- Option B: Use a libvirt XML: `assets/opnsense/libvirt/opnsense-serial-template.xml` → `virsh define`.

## 4) Install via serial console
```bash
virsh start opnsense
virsh console opnsense
```
- Run the text installer, target the qcow2 disk, install bootloader, reboot.

## 5) First-boot mapping
- Assign **LAN** to your internal NIC (e.g. `igb0`) → static `192.168.42.1/24`, enable DHCP.
- Assign **WAN** to upstream (temporary copper first). SFP will move later.
- (Optional) Assign **DMZ** to `igb2` and set `192.168.90.1/24`.

## 6) GUI
From a LAN client:
```
https://192.168.42.1/
```
Login `root` → complete the wizard → confirm DNS/NTP, disable offloading (*Interfaces → Settings*).
