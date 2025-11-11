# Serial Console on the Host (ttyS0 @ 115200 8N1)

We keep a working serial console for **every step**.

## 1) Kernel console parameters
Add both VGA *and* serial console for safety (so logs go to both):
```nix
{
  boot.kernelParams = [
    "console=tty0"
    "console=ttyS0,115200n8"
  ];
}
```

> This ensures kernel + init output goes to `ttyS0` (115200 8N1).

## 2) Login getty on `ttyS0`
Enable a login prompt on the serial port:
```nix
{
  services.getty.serialDevices = [ "ttyS0" ];
}
```

After `nixos-rebuild switch` and `reboot`, connect with your serial cable at **115200 8N1**.  
If your platform uses GRUB instead of systemd‑boot, also add GRUB serial to see the boot loader menu on serial:

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
