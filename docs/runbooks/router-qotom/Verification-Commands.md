# Verification commands & key lines (from files)

- `# Add: intel_iommu=on iommu=pt pcie_aspm=off`  
  _Source: Homelab_Organized/01_Hardware/Computers/Router/installation.md:113_
- `# Add: intel_iommu=on iommu=pt pcie_aspm=off`  
  _Source: Homelab_Organized/01_Hardware/Computers/Router/installation.md:113_
- `# Add: intel_iommu=on iommu=pt pcie_aspm=off`  
  _Source: Homelab_Organized/01_Hardware/Computers/Router/installation.md:113_
- `# Check IOMMU groups`  
  _Source: Homelab_Organized/01_Hardware/Computers/Router/installation.md:134_
- `find /sys/kernel/iommu_groups/ -name "devices" -exec bash -c 'echo "IOMMU Group $(basename $(dirname {}))"; cat {}' \;`  
  _Source: Homelab_Organized/01_Hardware/Computers/Router/installation.md:135_
- `find /sys/kernel/iommu_groups/ -name "devices" -exec bash -c 'echo "IOMMU Group $(basename $(dirname {}))"; cat {}' \;`  
  _Source: Homelab_Organized/01_Hardware/Computers/Router/installation.md:135_
