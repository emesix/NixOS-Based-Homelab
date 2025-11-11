# Network to the VM: PCI Passthrough (preferred) or Bridge (fallback)

We prefer **PCI passthrough** so OPNsense owns the NICs fully.

## A) Identify NICs for passthrough
1) List NICs and map to PCI addresses:
```bash
ip -br link
# find "enp8s1", "enp8s2", "enp9s0" (SFP), ...
readlink -f /sys/class/net/enp8s1/device
# -> /sys/devices/pci0000:00/.../0000:81:00.0
```

2) Get vendor/device IDs:
```bash
lspci -nn | grep -i ethernet
# Example: 0000:81:00.0 Ethernet controller [0200]: Intel ... [8086:10fb]
```

## B) Bind those NICs to vfio-pci
Option 1 — via kernel param (persistent):
```nix
{
  boot.kernelParams = [
    "intel_iommu=on"
    "vfio-pci.ids=8086:10fb,8086:10f8" # replace with your IDs
  ];
}
```

Option 2 — via modprobe options:
```nix
{
  boot.extraModprobeConfig = ''
    options vfio-pci ids=8086:10fb,8086:10f8
  '';
}
```

Rebuild + reboot. After boot, confirm those PCI devices are **not** claimed by a normal NIC driver:
```bash
lspci -k -s 81:00.0
# Kernel driver in use: vfio-pci
```

## C) Attach passthrough NICs to the VM (libvirt)
See `45-virt-install-examples.md` for both BIOS (serial‑only) and OVMF examples.
