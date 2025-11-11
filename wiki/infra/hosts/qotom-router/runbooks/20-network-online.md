# C1 — Network Online on Host (enp8s0)

Run and paste the last ~30 lines for logging:
```bash
ip -br link
ip -4 addr show dev enp8s0
resolvectl status || systemd-resolve --status || true
ping -c 3 1.1.1.1 || ping -c 3 8.8.8.8
curl -I https://nixos.org
```
