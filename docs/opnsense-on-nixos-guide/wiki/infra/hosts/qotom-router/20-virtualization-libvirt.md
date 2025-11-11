# Libvirt/QEMU Basics

## 1) Verify libvirt is running
```bash
systemctl status libvirtd
virsh list --all
```

## 2) Storage for the VM
Create a disk image for OPNsense:
```bash
sudo qemu-img create -f qcow2 /var/lib/libvirt/images/opnsense.qcow2 16G
```

## 3) ISO vs Serial Image
- **Recommended (serial-first):** Use the OPNsense **serial** image (`*-serial-amd64.img`) for a text-only installer over serial.
- **Alternative:** Use the DVD ISO; if serial isn’t active in the loader, you may need temporary VNC or a local monitor for install, then enable OPNsense serial console for headless ops.
