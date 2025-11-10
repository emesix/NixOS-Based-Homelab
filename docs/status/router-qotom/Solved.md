# Router: Solved/Validated markers (from files)

- ✅ `Homelab_Organized/01_Hardware/Computers/Router/deploy-opnsense.sh`:24 — log_success() { echo -e "${GREEN}[SUCCESS]${NC} $1"; }
- ✅ `Homelab_Organized/01_Hardware/Computers/Router/deploy-opnsense.sh`:660 — ping -c 2 8.8.8.8 && log_success "Internet connectivity OK" || log_error "No internet"
- ✅ `Homelab_Organized/01_Hardware/Computers/Router/deploy-opnsense.sh`:668 — nslookup google.com && log_success "External DNS OK" || log_error "External DNS failed"
- ✅ `Homelab_Organized/01_Hardware/Computers/Router/deploy-opnsense.sh`:739 — done
- ✅ `Homelab_Organized/01_Hardware/Computers/Router/hardware-summary.md`:18 — - **Type**: DDR4 ECC (confirmed working)
- ✅ `Homelab_Organized/01_Hardware/Computers/Router/specs.md`:13 — - **Status**: Hardware validated via Manjaro live; ready for OS install
- ✅ `Homelab_Organized/01_Hardware/Computers/Router/specs.md`:71 — Verify BIOS/UEFI settings (UEFI mode, AMI 5.13)
- ✅ `Homelab_Organized/01_Hardware/Computers/Router/specs.md`:72 — Document MAC addresses (captured in report)
- ✅ `Homelab_Organized/01_Hardware/Computers/Router/specs.md`:78 — - Set boot priority to USB first (tested OK)
