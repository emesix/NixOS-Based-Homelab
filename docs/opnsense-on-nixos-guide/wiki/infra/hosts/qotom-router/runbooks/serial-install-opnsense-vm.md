# Runbook: Serial Install of OPNsense VM

## Option A — Serial image (recommended)
1) Download `OPNsense-*-OpenSSL-serial-amd64.img`.
2) (Optional) Convert to qcow2 installer:
```bash
qemu-img convert -f raw -O qcow2 OPNsense-serial.img /var/lib/libvirt/images/opnsense-installer.qcow2
```
3) Create VM via BIOS + serial (see `configs/libvirt.md`).  
4) `virsh console opnsense` and run the installer onto `opnsense.qcow2`.  
5) Reboot; detach the installer disk.

## Option B — DVD ISO
- If serial output is missing in the installer, use temporary VNC/monitor, then enable serial in OPNsense for headless ops.

## First-boot mapping
- Assign `LAN` to your internal NIC (e.g. `igb0` → `192.168.42.1/24`, DHCP on).  
- Assign `WAN` to the upstream NIC (temporary copper first; SFP later).  
- (Optional) assign `DMZ` as a third interface.
