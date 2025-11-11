# Runbook: Troubleshooting

## Serial
- No serial during host install? Use minimal ISO or attach monitor once; after install, serial stays enabled.
- For VM: ensure `--graphics none` and serial devices defined; use `virsh console opnsense`.

## Boot
- If VM won’t boot: verify OVMF paths or try BIOS mode for pure serial.

## VFIO / IOMMU
- Verify binding and groups:
```bash
lspci -k -s 81:00.0
find /sys/kernel/iommu_groups/ -type l
```
- Some chipsets need `pcie_acs_override=downstream,multifunction` (use sparingly).

## LAN GUI access
- Correct LAN IP/mask & DHCP enabled.
- Client on correct physical port; temporarily allow ICMP for testing.

## Host connectivity
- Confirm `enp8s0` still on DHCP and not bound to vfio or enslaved to a bridge.
