# Runbook: Staged NIC Migration (Copper First, SFP Last)

**Goal:** Keep internet available while moving interfaces into the VM.

1. **Baseline**
   - Host online via `enp8s0` (DHCP).
   - SFP (e.g. `enp9s0`) remains on host drivers for now.

2. **LAN to VM**
   - Bind copper LAN NICs (e.g. `enp8s1`) to `vfio-pci`.
   - Attach to VM; boot OPNsense; set `LAN = 192.168.42.1/24` + DHCP.
   - Verify LAN client → GUI access.

3. **WAN (temporary copper)**
   - If you have copper WAN (e.g. `enp8s2`), passthrough and set WAN DHCP/static.
   - Verify LAN internet via OPNsense.

4. **SFP handover (last)**
   - Maintenance window.
   - Bind SFP NIC to `vfio-pci`, attach to VM.
   - Switch OPNsense WAN from temporary copper to SFP.
   - Remove temporary copper WAN from VM if desired.
