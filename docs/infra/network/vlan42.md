---
vlan: 42
ipv4_cidr: x.x.42.0/24
ipv6_cidr: fdxx:xxxx:xxxx:0042::/64
---
# VLAN 42 – LAN

## Summary
Short description of the segment purpose, security posture, and routing policy.

## Key Facts
- IPv4: `x.x.42.0/24`
- IPv6: `fdxx:xxxx:xxxx:0042::/64`
- Gateway IPv4: `x.x.42.1` (if applicable)
- Gateway IPv6: `fdxx:xxxx:xxxx:002a::1`

## DHCP (if enabled)
- Range: `x.x.42.100 – x.x.42.199`

## ACL / Firewall (sketch)
- Intra-VLAN: allow established/related
- Inter-VLAN: least-privilege; explicit rules per service
- Outbound: allow -> Internet with egress filtering

## Related
- Hosts: see [/docs/infra/hosts/index.md](../hosts/index.md)
- Services: see [/docs/infra/services/index.md](../services/index.md)
