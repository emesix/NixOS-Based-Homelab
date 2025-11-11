# Install OPNsense & First Boot (Serial-Only)

## Option A — Use the **Serial** image (recommended)
1) Download `OPNsense-*-OpenSSL-serial-amd64.img` to the host.
2) Convert (optional) for libvirt if desired:
```bash
qemu-img convert -f raw -O qcow2 OPNsense-serial.img /var/lib/libvirt/images/opnsense-installer.qcow2
```
3) Define a **BIOS/serial** VM and attach the image as a disk (see `45-virt-install-examples.md`). Boot and run the installer via `virsh console`.

## Option B — Use the DVD ISO
1) Create the VM with OVMF and attach the ISO.
2) If the installer doesn’t expose serial, use temporary VNC or a local monitor for the initial install.
3) After install, enable OPNsense serial console and operate headless via `virsh console`.

---

## First-boot interface mapping
- **Assign interfaces** at the console:
  - `WAN` = NIC to upstream (temporary copper first; SFP later)
  - `LAN` = NIC to your internal switch
  - Optional `DMZ` = third NIC
- Set `LAN` static (e.g. `192.168.42.1/24`) and enable DHCP on LAN.
- For `WAN`, use DHCP/static per ISP.

## Web GUI
From a LAN client:
```
https://192.168.42.1/
```
Login as `root` with your chosen password. Run the setup wizard to confirm WAN/LAN, DNS, and time.
