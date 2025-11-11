# C0 — Boot ISO with Serial

> If the graphical ISO doesn’t show serial logs, use the minimal ISO or briefly attach a display for the first boot only.

## Kernel parameters (when possible)
Add kernel params to enable serial:
```
console=tty0 console=ttyS0,115200n8
```
After login:
```
sudo su -
stty -F /dev/ttyS0 115200 cs8 -cstopb -parenb
```
