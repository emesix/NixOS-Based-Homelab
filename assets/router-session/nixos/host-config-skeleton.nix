{ config, pkgs, ... }: {
  boot.kernelParams = [ "console=tty0" "console=ttyS0,115200n8" ];
  services.getty.serialDevices = [ "ttyS0" ];
  networking.interfaces.enp8s0.useDHCP = true;
  virtualisation.libvirtd.enable = true;
  virtualisation.libvirtd.qemu = {
    package = pkgs.qemu_kvm;
    ovmf.enable = true;
    ovmf.packages = [ (pkgs.OVMF.override { secureBoot = true; tpmSupport = true; }).fd ];
  };
  services.zfs.autoScrub.enable = true;
  services.zfs.autoSnapshot.enable = true;
  zramSwap.enable = true;
  zramSwap.memoryPercent = 25;
}
