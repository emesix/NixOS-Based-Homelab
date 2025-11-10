# Homelab_Organized — PCI/Router/Qotom quick read

## Top 10 concrete tips (auto-picked)

- `Homelab_Organized/01_Hardware/Computers/AI-Server/manjaro-ai-server-installation.md`:44 (pci_passthrough)

  ✅ VT-x/VT-d: Enabled (virtualization)
✅ IOMMU: Enabled
✅ PCIe Gen3/4: Auto or Maximum

- `Homelab_Organized/01_Hardware/Computers/AI-Server/manjaro-ai-server-installation.md`:331 (pci_passthrough)

  cat >> /etc/default/grub << 'EOF'
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash intel_iommu=on"
EOF

- `Homelab_Organized/01_Hardware/Computers/NAS/nas-discovery-20250824-014428.txt`:116 (pci_passthrough)

  00:00.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Starship/Matisse Root Complex
00:00.2 IOMMU: Advanced Micro Devices, Inc. [AMD] Starship/Matisse IOMMU
00:01.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Starship/Matisse PCIe Dummy Host Bridge

- `Homelab_Organized/01_Hardware/Computers/NAS/specs.md`:220 (pci_passthrough)

  ├── SATA Mode: AHCI
├── IOMMU: Enabled (for virtualization)
├── ECC Memory: Enabled (if supported)

- `Homelab_Organized/01_Hardware/Computers/Router/deploy-opnsense.sh`:118 (pci_passthrough)

  "network": [
        {"bridge": "vmbr0", "model": "virtio"},
        {"bridge": "vmbr1", "model": "virtio"},

- `Homelab_Organized/01_Hardware/Computers/Router/deploy-opnsense.sh`:119 (pci_passthrough)

  {"bridge": "vmbr0", "model": "virtio"},
        {"bridge": "vmbr1", "model": "virtio"},
        {"bridge": "vmbr2", "model": "virtio"},

- `Homelab_Organized/01_Hardware/Computers/Router/deploy-opnsense.sh`:120 (pci_passthrough)

  {"bridge": "vmbr1", "model": "virtio"},
        {"bridge": "vmbr2", "model": "virtio"},
        {"bridge": "vmbr3", "model": "virtio"}

- `Homelab_Organized/01_Hardware/Computers/Router/deploy-opnsense.sh`:121 (pci_passthrough)

  {"bridge": "vmbr2", "model": "virtio"},
        {"bridge": "vmbr3", "model": "virtio"}
    ],

- `Homelab_Organized/01_Hardware/Computers/Router/deploy-opnsense.sh`:137 (pci_passthrough)

  "disk": "50G",
    "network": [{"bridge": "vmbr4", "model": "virtio"}],
    "boot": "cdn",

- `Homelab_Organized/01_Hardware/Computers/Router/deploy-opnsense.sh`:152 (pci_passthrough)

  "disk": "100G",
    "network": [{"bridge": "vmbr4", "model": "virtio"}],
    "boot": "cdn",


## Solved / Validated signals (first 20)

- ✅ `Homelab_Organized/01_Hardware/Computers/AI-Server/AI-SERVER-SUMMARY.md`:79 — Architecture documentation complete
- ✅ `Homelab_Organized/01_Hardware/Computers/AI-Server/AI-SERVER-SUMMARY.md`:80 — Installation guide ready
- ✅ `Homelab_Organized/01_Hardware/Computers/AI-Server/AI-SERVER-SUMMARY.md`:81 — Docker configuration prepared
- ✅ `Homelab_Organized/01_Hardware/Computers/AI-Server/AI-SERVER-SUMMARY.md`:121 — ## 🎯 **Key Success Factors**
- ✅ `Homelab_Organized/01_Hardware/Computers/AI-Server/AI-SERVER-SUMMARY.md`:148 — ## 🛠️ **What Needs to Be Done Next**
- ✅ `Homelab_Organized/01_Hardware/Computers/AI-Server/ChatGPT-AI-Server-Insights.md`:398 — **Working Around Input/Memory Limitations of ChatGPT with V-Model Project Management**
- ✅ `Homelab_Organized/01_Hardware/Computers/AI-Server/ai-server-architecture.md`:503 — ## 💡 **Key Success Factors**
- ✅ `Homelab_Organized/01_Hardware/Computers/AI-Server/deploy-ai-server.sh`:28 — echo -e "${GREEN}[SUCCESS]${NC} $1"
- ✅ `Homelab_Organized/01_Hardware/Computers/AI-Server/deploy-ai-server.sh`:407 — done
- ✅ `Homelab_Organized/01_Hardware/Computers/AI-Server/hardware-summary.md`:32 — - **Drivers**: i915 kernel module (working)
- ✅ `Homelab_Organized/01_Hardware/Computers/AI-Server/manjaro-ai-server-installation.md`:141 — done
- ✅ `Homelab_Organized/01_Hardware/Computers/AI-Server/manjaro-ai-server-installation.md`:512 — # Add user to docker group (already done during user creation)
- ✅ `Homelab_Organized/01_Hardware/Computers/AI-Server/manjaro-ai-server-installation.md`:578 — done
- ✅ `Homelab_Organized/01_Hardware/Computers/AI-Server/manjaro-ai-server-installation.md`:599 — done
- ✅ `Homelab_Organized/01_Hardware/Computers/AI-Server/specs.md`:11 — - **Status**: Hardware validated; GPU-accelerated AI beast!
- ✅ `Homelab_Organized/01_Hardware/Computers/AI-Server/specs.md`:139 — Verify BIOS/UEFI settings (UEFI confirmed)
- ✅ `Homelab_Organized/01_Hardware/Computers/AI-Server/specs.md`:140 — Document hardware (completed)
- ✅ `Homelab_Organized/01_Hardware/Computers/Database-Server/manjaro-installation-guide.md`:434 — ## ✅ **Installation Success Criteria**
- ✅ `Homelab_Organized/01_Hardware/Computers/Database-Server/specs.md`:11 — - **Status**: ✅ Hardware validated; Ready for PostgreSQL + services deployment
- ✅ `Homelab_Organized/01_Hardware/Computers/Database-Server/specs.md`:246 — done

## Regressed / Open / TODO signals (first 20)

- ⏳ `Homelab_Organized/01_Hardware/Computers/AI-Server/AI-SERVER-SUMMARY.md`:82 — **NEXT**: Execute Manjaro installation on AI server
- ⏳ `Homelab_Organized/01_Hardware/Computers/AI-Server/AI-SERVER-SUMMARY.md`:85 — Install Manjaro XFCE + Intel GPU drivers
- ⏳ `Homelab_Organized/01_Hardware/Computers/AI-Server/AI-SERVER-SUMMARY.md`:86 — Deploy Docker AI services stack
- ⏳ `Homelab_Organized/01_Hardware/Computers/AI-Server/AI-SERVER-SUMMARY.md`:87 — Configure hot model serving (2× TP=1)
- ⏳ `Homelab_Organized/01_Hardware/Computers/AI-Server/AI-SERVER-SUMMARY.md`:88 — Set up Wiki.js integration
- ⏳ `Homelab_Organized/01_Hardware/Computers/AI-Server/AI-SERVER-SUMMARY.md`:91 — Monitoring and alerting
- ⏳ `Homelab_Organized/01_Hardware/Computers/AI-Server/AI-SERVER-SUMMARY.md`:92 — Automated backups to NAS
- ⏳ `Homelab_Organized/01_Hardware/Computers/AI-Server/AI-SERVER-SUMMARY.md`:93 — Energy management and scheduling
- ⏳ `Homelab_Organized/01_Hardware/Computers/AI-Server/AI-SERVER-SUMMARY.md`:94 — Performance optimization
- ⏳ `Homelab_Organized/01_Hardware/Computers/AI-Server/AI-SERVER-SUMMARY.md`:107 — ./deploy-ai-server.sh monitor        # Open monitoring dashboard
- ⏳ `Homelab_Organized/01_Hardware/Computers/AI-Server/ChatGPT-AI-Server-Insights.md`:41 — Je vraagt welke IPTV-client het beste werkt op Manjaro. Er zijn meerdere goede opties, afhankelijk van je voorkeur voor eenvoud, open-source software, EPG-ondersteuning, of een mediacenter-ervaring. Hieronder een overzicht met de meest populaire en betrouwbare keuzes:
- ⏳ `Homelab_Organized/01_Hardware/Computers/AI-Server/ChatGPT-AI-Server-Insights.md`:48 — - Een moderne, open-source IPTV-speler met veel functies:
- ⏳ `Homelab_Organized/01_Hardware/Computers/AI-Server/ChatGPT-AI-Server-Insights.md`:135 — Je verwijst naar de recent door OpenAI uitgebrachte open-weight modellen **gpt-oss-20b** (ca. 21  miljard parameters) en **gpt-oss-120b** (ca. 117  miljard) — modellen die ontworpen zijn om lokaal te draaien, mits je systeem voldoende geheugen/VRAM heeft citeturn0news18turn0news23turn0news20turn0search9turn0search16turn0search2.
- ⏳ `Homelab_Organized/01_Hardware/Computers/AI-Server/ChatGPT-AI-Server-Insights.md`:311 — In Warp (warp.dev) staat “MCP” voor **Model Context Protocol**, een open protocol dat jouw AI‑agent (zoals Warp’s agent mode) op een uniforme manier laat communiceren met externe tools, data‑bronnen of services. Zie het als een soort **USB‑C‑poort voor AI‑tools**: je sluit een “MCP‑server” aan om toegang te krijgen tot iets specifieks (bv. een database, bestandssysteem of API) citeturn0search0turn0search14.
- ⏳ `Homelab_Organized/01_Hardware/Computers/AI-Server/ChatGPT-AI-Server-Insights.md`:322 — Kan ik de MCP gebruiken als een bridge tussen een 2 AI's ? voorbeeld we hebben een open WEBUI chat, WARP en een database er tussen in zodat de agent weet wat er besproken is ?
- ⏳ `Homelab_Organized/01_Hardware/Computers/AI-Server/ChatGPT-AI-Server-Insights.md`:333 — | **Open...
- ⏳ `Homelab_Organized/01_Hardware/Computers/AI-Server/ChatGPT-AI-Server-Insights.md`:565 — Open WebUI’s **Knowledge workspace** is part of the **Workspace** area—but it’s only visible if you’ve set up at least one knowledge base. If you don't see it, it likely means you haven’t created any yet. Here's how to find and enable it:
- ⏳ `Homelab_Organized/01_Hardware/Computers/AI-Server/ChatGPT-AI-Server-Insights.md`:601 — In Open WebUI, your **RAG embedding settings** are located under **Admin Panel → Settings → Documents**, **not** under the “RAG” tab. Here's why you’re not seeing them and how to fix it 👇
- ⏳ `Homelab_Organized/01_Hardware/Computers/AI-Server/ChatGPT-AI-Server-Insights.md`:700 — https://github.com/OpenInterpreter/open-interpreter
- ⏳ `Homelab_Organized/01_Hardware/Computers/AI-Server/ChatGPT-AI-Server-Insights.md`:701 — https://github.com/OpenInterpreter/open-interpreter/tree/development