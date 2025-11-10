# Documentation Conventions

- **Masking**
  - IPv4 subnets as `x.x.42.0/24`, `x.x.90.0/24`
  - IPv6 ULA as `fdxx:xxxx:xxxx:0042::/64`, `fdxx:xxxx:xxxx:0090::/64`
  - Host IPs as `x.x.42.20`, `x.x.90.10`, etc.
- **Terminology**
  - IPv4 octets: `AAA.BBB.CCC.DDD` (we mask `AAA.BBB` → `x.x`)
  - VLAN number maps to IPv6 hextet (e.g., `0042`, `0090`)
- **Page Style**
  - Start with a one-paragraph summary.
  - Provide a table for key facts.
  - Link out to related *Components*, *Services*, and *Runbooks*.
