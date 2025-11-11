# Troubleshooting

## Serial
- If host ISO doesn’t print to serial, use minimal ISO or attach display for install only.
- VM: ensure `--graphics none` and serial devices are present, then `virsh console opnsense`.

## Boot/firmware
- If VM won’t boot the installer, verify OVMF paths; for pure serial, use BIOS boot.

## NIC passthrough
- Ensure device bound to `vfio-pci` (not native driver).
- Inspect IOMMU groups:
```bash
find /sys/kernel/iommu_groups/ -type l
```
- Some chipsets need `pcie_acs_override=downstream,multifunction` (use sparingly).

## No LAN GUI access
- Verify LAN IP/netmask & DHCP.
- Client must be connected to the correct physical port.
- Temporarily allow ICMP from LAN to test reachability.

## Host lost connectivity
- Confirm `enp8s0` still does DHCP on the host.
- Ensure `enp8s0` isn’t bridged or bound to vfio.
