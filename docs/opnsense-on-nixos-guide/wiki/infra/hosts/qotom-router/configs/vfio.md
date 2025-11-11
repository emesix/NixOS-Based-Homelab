# VFIO Details & Binding

## Find devices and IDs
```bash
ip -br link
readlink -f /sys/class/net/enp8s1/device
lspci -nn | grep -i ethernet
# Example ID: 8086:10fb
```

## Bind by kernel params (persistent)
```nix
{
  boot.kernelParams = [
    "intel_iommu=on"
    "vfio-pci.ids=8086:10fb,8086:10f8" # replace with your IDs
  ];
}
```

## Bind via modprobe options
```nix
{
  boot.extraModprobeConfig = ''
    options vfio-pci ids=8086:10fb,8086:10f8
  '';
}
```

## One-off bind helper
```bash
sudo ./scripts/vfio-bind.sh bind 0000:81:00.0 0000:81:00.1
sudo ./scripts/vfio-bind.sh unbind 0000:81:00.0 0000:81:00.1
```
