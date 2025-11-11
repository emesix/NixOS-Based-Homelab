# How-to — Libvirt/QEMU & PCI Passthrough

## Identify NICs
```bash
ip -br link
readlink -f /sys/class/net/enp8s1/device
lspci -nn | grep -i ethernet
```

## Bind to vfio-pci
Kernel params:
```nix
{
  boot.kernelParams = [
    "intel_iommu=on"
    "vfio-pci.ids=8086:10fb,8086:10f8"  # replace with your IDs
  ];
}
```
or modprobe:
```nix
{
  boot.extraModprobeConfig = ''
    options vfio-pci ids=8086:10fb,8086:10f8
  '';
}
```

Check after reboot:
```bash
lspci -k -s 81:00.0
# Kernel driver in use: vfio-pci
```
