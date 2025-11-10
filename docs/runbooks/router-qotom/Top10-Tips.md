# Top 10 concrete tips (from existing files)

- **Kernel args** — `# Add: intel_iommu=on iommu=pt pcie_aspm=off`  
  _Source: Homelab_Organized/01_Hardware/Computers/Router/installation.md:113_
- **Load VFIO early** — add `# Load VFIO modules`, `vfio`, `vfio_iommu_type1`, `vfio_iommu_type1` to `/etc/modules`.  
  _Source: Homelab_Organized/01_Hardware/Computers/Router/installation.md:118_
- **Check isolation** — `# Check IOMMU groups`  
  _Source: Homelab_Organized/01_Hardware/Computers/Router/installation.md:134_
- **Working OPNsense VM baseline** — `├── SCSI Controller: VirtIO SCSI`, `├── BIOS: OVMF (UEFI)`, `├── Add EFI Disk: Yes`, `└── Machine: q35`, `├── Bus: VirtIO Block`.  
  _Source: Homelab_Organized/01_Hardware/Computers/Router/installation.md:155_
- **Firmware/boot references** — `✅ VT-x/VT-d: Enabled (virtualization)`  
  _Source: Homelab_Organized/01_Hardware/Computers/AI-Server/manjaro-ai-server-installation.md:43_
- **Firmware/boot references** — `✅ IOMMU: Enabled`  
  _Source: Homelab_Organized/01_Hardware/Computers/AI-Server/manjaro-ai-server-installation.md:44_
- **Firmware/boot references** — `✅ PCIe Gen3/4: Auto or Maximum`  
  _Source: Homelab_Organized/01_Hardware/Computers/AI-Server/manjaro-ai-server-installation.md:45_
- **NIC references** — `- **enp5s0**: **Intel X520-1 10GbE SFP+** (DOWN - ready for DAC/SFP+)`  
  _Source: Homelab_Organized/01_Hardware/Computers/Docker-Host/specs.md:62_
- **NIC references** — `- **Router**: 4x Intel X553 SFP+ ports`  
  _Source: Homelab_Organized/01_Hardware/Computers/Docker-Host/specs.md:65_
- **Deploy checks** — `ping -c 2 8.8.8.8 && log_success "Internet connectivity OK" || log_error "No internet"`  
  _Source: Homelab_Organized/01_Hardware/Computers/Router/deploy-opnsense.sh:660_
