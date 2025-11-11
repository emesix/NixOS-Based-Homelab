# Libvirt / virt-install Examples

## Storage
```bash
sudo qemu-img create -f qcow2 /var/lib/libvirt/images/opnsense.qcow2 16G
```

## BIOS + Serial (using OPNsense serial image)
```bash
virt-install \
  --name opnsense \
  --memory 2048 --vcpus 2 \
  --os-type freebsd --os-variant freebsd13.0 \
  --boot bios \
  --disk path=/var/lib/libvirt/images/opnsense.qcow2,format=qcow2 \
  --disk path=/var/lib/libvirt/images/OPNsense-serial.img,device=disk,readonly=on \
  --graphics none \
  --serial pty \
  --console pty,target_type=serial \
  --network network=none \
  --host-device 0000:81:00.0 \
  --host-device 0000:81:00.1
```

## OVMF + ISO (serial if supported; else use VNC temporarily)
```bash
virt-install \
  --name opnsense \
  --memory 2048 --vcpus 2 \
  --os-type freebsd --os-variant freebsd13.0 \
  --boot loader=/usr/share/OVMF/OVMF_CODE.fd,loader_ro=true,loader_type=pflash, \
        nvram_template=/usr/share/OVMF/OVMF_VARS.fd \
  --disk path=/var/lib/libvirt/images/opnsense.qcow2,format=qcow2 \
  --cdrom /var/lib/libvirt/images/OPNsense.iso \
  --graphics none \
  --serial pty \
  --console pty,target_type=serial \
  --network network=none \
  --host-device 0000:81:00.0 \
  --host-device 0000:81:00.1
```

### Libvirt XML (template)
See `libvirt/opnsense-serial-template.xml` in the repo.
