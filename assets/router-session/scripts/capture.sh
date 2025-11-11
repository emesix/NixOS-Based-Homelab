#!/usr/bin/env bash
set -euo pipefail
CMD="${1:-}"
if [[ -z "$CMD" ]]; then
  echo "Usage: $0 "<command>"" >&2
  exit 1
fi
ts="$(date +%F_%H%M%S)"
mkdir -p /tmp/router-session-logs
echo "==> $CMD"
bash -lc "$CMD" 2>&1 | tee "/tmp/router-session-logs/${ts}.log"
echo "[saved] /tmp/router-session-logs/${ts}.log"
