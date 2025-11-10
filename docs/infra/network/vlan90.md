---
vlan: 90
ipv4_cidr: x.x.90.0/24
ipv6_cidr: fdxx:xxxx:xxxx:0090::/64
---
# VLAN 90 – DMZ

## Summary
Short description of the segment purpose, security posture, and routing policy.

## Key Facts
- IPv4: `x.x.90.0/24`
- IPv6: `fdxx:xxxx:xxxx:0090::/64`
- Gateway IPv4: `x.x.90.1` (if applicable)
- Gateway IPv6: `fdxx:xxxx:xxxx:005a::1`

## DHCP (if enabled)
- Range: `x.x.90.100 – x.x.90.199`

## ACL / Firewall (sketch)
- Intra-VLAN: allow established/related
- Inter-VLAN: least-privilege; explicit rules per service
- Outbound: allow -> Internet with egress filtering

## Related
- Hosts: see [/docs/infra/hosts/index.md](../hosts/index.md)
- Services: see [/docs/infra/services/index.md](../services/index.md)
