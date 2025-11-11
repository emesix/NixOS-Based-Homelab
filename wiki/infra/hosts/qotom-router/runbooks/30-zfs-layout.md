# C2 — Disks & ZFS (mirror)

Identify disks (use *by-id*):
```bash
ls -l /dev/disk/by-id | grep -E 'nvme|ata|scsi' | sort
```

Assume these two (replace with yours):
```bash
DISK0=/dev/disk/by-id/nvme-XXXXXX0
DISK1=/dev/disk/by-id/nvme-XXXXXX1
```

Partition both (EFI 1GiB + ZFS rest):
```bash
sgdisk --zap-all $DISK0
sgdisk --zap-all $DISK1
sgdisk -n1:1MiB:+1GiB -t1:EF00 $DISK0
sgdisk -n3:0:0      -t3:BF01 $DISK0
sgdisk -n1:1MiB:+1GiB -t1:EF00 $DISK1
sgdisk -n3:0:0      -t3:BF01 $DISK1
partprobe
```

Create pool (ashift 12, compression, no mountpoints yet):
```bash
zpool create -f   -o ashift=12 -o autotrim=on   -O compression=zstd -O atime=off -O xattr=sa -O acltype=posixacl   -O mountpoint=none   rpool mirror ${DISK0}-part3 ${DISK1}-part3
```

Datasets (legacy mountpoints, we’ll mount manually under /mnt):
```bash
zfs create -o mountpoint=legacy rpool/ROOT
zfs create -o mountpoint=legacy rpool/ROOT/nixos
zfs create -o mountpoint=legacy rpool/nix
zfs create -o mountpoint=legacy rpool/var
zfs create -o mountpoint=legacy rpool/var/log
zfs set recordsize=16K rpool/var/log
zfs create -o mountpoint=legacy rpool/var/libvirt
zfs set recordsize=64K rpool/var/libvirt
zfs create -o mountpoint=legacy rpool/persist
```

Mount & format EFI:
```bash
mount -t zfs rpool/ROOT/nixos /mnt
mkdir -p /mnt/{nix,var/log,var/lib/libvirt,persist,boot}
mount -t zfs rpool/nix /mnt/nix
mount -t zfs rpool/var/log /mnt/var/log
mount -t zfs rpool/var/libvirt /mnt/var/lib/libvirt
mount -t zfs rpool/persist /mnt/persist

mkfs.vfat -F32 ${DISK0}-part1
mkdir -p /mnt/boot
mount ${DISK0}-part1 /mnt/boot
```
