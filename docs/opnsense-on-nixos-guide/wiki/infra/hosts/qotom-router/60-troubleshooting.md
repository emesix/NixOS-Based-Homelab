# Troubleshooting

## Serial console
- No serial output during host install? Use minimal ISO or attach a monitor just for install; once installed, serial stays enabled.
- For VM: ensure `--graphics none` and serial devices are defined; use `virsh console opnsense`.

## Boot / firmware
- If VM won’t boot installer: verify OVMF paths (or use BIOS for pure serial).

## NIC passthrough
- Device won’t attach? Confirm it's bound to `vfio-pci` (not `ixgbe`, `e1000e`, etc.).
- Inspect IOMMU groups:
```bash
find /sys/kernel/iommu_groups/ -type l
```
- Some chipsets require `pcie_acs_override=downstream,multifunction` (use sparingly).

## “No LAN access to GUI”
- Ensure LAN IP/netmask and DHCP are correct.
- Connect client to the correct physical port.
- Temporarily allow ICMP from LAN to test reachability.

## Host lost connectivity
- Confirm `enp8s0` still does DHCP on the host.
- Make sure you didn’t bind `enp8s0` to vfio or enslave it into a bridge.
