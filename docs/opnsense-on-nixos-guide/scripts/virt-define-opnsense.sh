#!/usr/bin/env bash
set -euo pipefail
VMDISK="/var/lib/libvirt/images/opnsense.qcow2"
INSTALL_IMG="/var/lib/libvirt/images/OPNsense-serial.img"
if [[ ! -f "${VMDISK}" ]]; then
  qemu-img create -f qcow2 "${VMDISK}" 16G
fi
virt-install \
  --name opnsense \
  --memory 2048 --vcpus 2 \
  --os-type freebsd --os-variant freebsd13.0 \
  --boot bios \
  --disk path="${VMDISK}",format=qcow2 \
  --disk path="${INSTALL_IMG}",device=disk,readonly=on \
  --graphics none \
  --serial pty \
  --console pty,target_type=serial \
  --network network=none \
  --host-device 0000:81:00.0 \
  --host-device 0000:81:00.1
echo "VM created. Use: virsh console opnsense"
