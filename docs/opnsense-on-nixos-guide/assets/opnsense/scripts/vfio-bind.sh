#!/usr/bin/env bash
set -euo pipefail
ACTION="${1:-}"; shift || true
if [[ -z "${ACTION}" || "$#" -lt 1 ]]; then
  echo "Usage: $0 <bind|unbind> <PCI-ADDR>..."; exit 1
fi
for dev in "$@"; do
  if [[ "${ACTION}" == "bind" ]]; then
    echo "${dev}" | sudo tee /sys/bus/pci/drivers/vfio-pci/bind
  elif [[ "${ACTION}" == "unbind" ]]; then
    echo "${dev}" | sudo tee /sys/bus/pci/drivers/vfio-pci/unbind
  else
    echo "Unknown action: ${ACTION}" >&2; exit 2
  fi
done
echo "Done."
