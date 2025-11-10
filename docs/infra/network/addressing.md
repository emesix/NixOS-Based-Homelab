# Addressing & Masking

## IPv4
- **LAN (VLAN 42)**: `x.x.42.0/24`
  - Gateway/DNS: `x.x.42.1`
  - DHCP: `x.x.42.100 – x.x.42.199`
  - Static (examples): DB `x.x.42.20`, ARR `x.x.42.21`, Apps `x.x.42.22`

- **DMZ (VLAN 90)**: `x.x.90.0/24`
  - Gateway/DNS: `x.x.90.1`
  - DHCP: `x.x.90.100 – x.x.90.199`
  - Static (examples): Proxy `x.x.90.10`, Mail `x.x.90.11`

**Note:** IPv4 consists of four octets (`AAA.BBB.CCC.DDD`). We mask the first two: `AAA.BBB` → `x.x`.

## IPv6 (ULA, dual‑stack)
- **LAN (VLAN 42)**: `fdxx:xxxx:xxxx:0042::/64` (GW `::1`)
- **DMZ (VLAN 90)**: `fdxx:xxxx:xxxx:0090::/64` (GW `::1`)

> Keep the VLAN number as the hextet to stay consistent between IPv4 and IPv6.
