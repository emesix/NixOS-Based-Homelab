# Runbook — Serial Console on the Host (ttyS0 @ 115200 8N1)

## Kernel + initrd
```nix
{
  boot.kernelParams = [ "console=tty0" "console=ttyS0,115200n8" ];
  services.getty.serialDevices = [ "ttyS0" ];
}
```

## (If using GRUB) Boot loader on serial
```nix
{
  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.extraConfig = ''
    serial --unit=0 --speed=115200 --word=8 --parity=no --stop=1
    terminal_input serial console
    terminal_output serial console
  '';
}
```
