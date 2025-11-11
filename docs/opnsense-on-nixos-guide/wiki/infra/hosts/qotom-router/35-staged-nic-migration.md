# Staged NIC Migration (Copper first, SFP last)

**Goal:** Prevent internet loss while moving interfaces into the VM.

## Stage 0 — Baseline
- Host online via `enp8s0` (DHCP). Confirm SSH over serial is working.
- Ensure **SFP** (e.g. `enp9s0`) stays bound to host drivers **for now** (no vfio).

## Stage 1 — LAN NICs to OPNsense
- Bind **LAN copper NIC(s)** (e.g. `enp8s1`) to vfio-pci.
- Define the VM with **LAN NICs** attached (host-device passthrough).
- Boot OPNsense, assign `LAN = igb0`, set static `192.168.42.1/24`, enable DHCP on LAN.
- Test: a client on LAN gets IP & can reach OPNsense GUI.

## Stage 2 — WAN (temporary on copper)
- If you have a copper WAN NIC (e.g. `enp8s2`), passthrough that now and set OPNsense WAN to DHCP or static per ISP.
- Verify internet access for LAN clients via OPNsense.
- Host still uses `enp8s0` — unchanged, so you keep remote access and downloads.

## Stage 3 — SFP handover (last)
- Schedule a short maintenance window.
- Bind **SFP** NIC (e.g. `enp9s0`) to vfio-pci and attach to VM.
- In OPNsense, switch WAN from temporary copper to SFP interface.
- Validate connectivity; then optionally detach the temporary copper WAN NIC.
