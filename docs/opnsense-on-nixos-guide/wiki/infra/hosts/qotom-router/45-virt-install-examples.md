# virt-install Examples (Serial-First)

> Replace PCI addresses and paths with your values. These examples create a **serial-only** VM so you can drive everything via `virsh console`.

## A) Pure serial with BIOS + serial installer image
```bash
virt-install   --name opnsense   --memory 2048 --vcpus 2   --os-type freebsd --os-variant freebsd13.0   --boot bios   --disk path=/var/lib/libvirt/images/opnsense.qcow2,format=qcow2   --disk path=/var/lib/libvirt/images/OPNsense-serial.img,device=disk,readonly=on   --graphics none   --serial pty   --console pty,target_type=serial   --network network=none   --host-device 0000:81:00.0 \
  --host-device 0000:81:00.1
```
- The read-only installer image boots; install onto `opnsense.qcow2`.  
- After install, detach the installer disk.

## B) UEFI (OVMF) with DVD ISO (serial console enabled if possible)
```bash
virt-install   --name opnsense   --memory 2048 --vcpus 2   --os-type freebsd --os-variant freebsd13.0   --boot loader=/usr/share/OVMF/OVMF_CODE.fd,loader_ro=true,loader_type=pflash,         nvram_template=/usr/share/OVMF/OVMF_VARS.fd   --disk path=/var/lib/libvirt/images/opnsense.qcow2,format=qcow2   --cdrom /var/lib/libvirt/images/OPNsense.iso   --graphics none   --serial pty   --console pty,target_type=serial   --network network=none   --host-device 0000:81:00.0 \
  --host-device 0000:81:00.1
```
- If the ISO doesn’t show serial text, use temporary VNC or local display during install.
