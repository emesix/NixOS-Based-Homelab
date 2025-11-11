#!/usr/bin/env bash
set -euo pipefail

# Normalize repo tree to wiki-first template for qotom-router.
# Usage:
#   ./fix_tree.sh [--dry-run] [--source /path/to/dir_or_zip] [--commit]

DRY_RUN=0
DO_COMMIT=0
SOURCE_PATH=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run) DRY_RUN=1; shift ;;
    --commit) DO_COMMIT=1; shift ;;
    --source) SOURCE_PATH="${2:-}"; shift 2 ;;
    *) echo "Unknown arg: $1" >&2; exit 2 ;;
  esac
done

say() { printf '==> %s\n' "$*"; }
warn() { printf '!!  %s\n' "$*" >&2; }

# Detect repo root
if git rev-parse --show-toplevel >/dev/null 2>&1; then
  REPO_ROOT="$(git rev-parse --show-toplevel)"
else
  REPO_ROOT="$(pwd)"
fi
cd "$REPO_ROOT"

say "Repo root: $REPO_ROOT"

# Create destination directories
DEST_DIRS=(
  "wiki/infra/hosts/qotom-router"
  "wiki/infra/hosts/qotom-router/runbooks"
  "wiki/infra/hosts/qotom-router/howto"
  "wiki/infra/hosts/qotom-router/ops"
  "assets/opnsense/libvirt"
  "assets/opnsense/scripts"
)
for d in "${DEST_DIRS[@]}"; do
  if [[ $DRY_RUN -eq 1 ]]; then
    say "DRY: mkdir -p $d"
  else
    mkdir -p "$d"
  fi
done

timestamp() { date +%Y%m%d-%H%M%S; }

backup_then_move() {
  local src="$1" dst="$2"
  if [[ ! -e "$src" ]]; then return 0; fi
  local dst_dir; dst_dir="$(dirname "$dst")"
  [[ $DRY_RUN -eq 1 ]] || mkdir -p "$dst_dir"

  if [[ -e "$dst" ]]; then
    local bkp="${dst}.bkp.$(timestamp)"
    say "Destination exists, appending content to: $dst (backup: $bkp)"
    if [[ $DRY_RUN -eq 0 ]]; then
      cp -a "$dst" "$bkp"
      {
        echo -e "\n\n---\n# Imported from: ${src}\n"
        cat "$src"
      } >> "$dst"
      mv "$src" "${src}.migrated.$(timestamp)"
    else
      say "DRY: would append $src to $dst and backup $dst to $bkp"
    fi
  else
    say "Moving $src -> $dst"
    if [[ $DRY_RUN -eq 0 ]]; then
      mkdir -p "$(dirname "$dst")"
      git mv -f "$src" "$dst" 2>/dev/null || mv -f "$src" "$dst"
    else
      say "DRY: git mv -f $src $dst || mv -f $src $dst"
    fi
  fi
}

# 1) Migrate known v1 -> v2 paths
# Mapping format: SRC|DST
read -r -d '' MAPPING <<'EOF'
wiki/infra/hosts/qotom-router/00-overview.md|wiki/infra/hosts/qotom-router/_index.md
wiki/infra/hosts/qotom-router/09-serial-console-host.md|wiki/infra/hosts/qotom-router/runbooks/serial-console-host.md
wiki/infra/hosts/qotom-router/10-host-prepare-nixos.md|wiki/infra/hosts/qotom-router/runbooks/install-opnsense-on-nixos.md
wiki/infra/hosts/qotom-router/20-virtualization-libvirt.md|wiki/infra/hosts/qotom-router/howto/libvirt-and-passthrough.md
wiki/infra/hosts/qotom-router/30-network-passthrough.md|wiki/infra/hosts/qotom-router/howto/libvirt-and-passthrough.md
wiki/infra/hosts/qotom-router/35-staged-nic-migration.md|wiki/infra/hosts/qotom-router/runbooks/staged-nic-migration.md
wiki/infra/hosts/qotom-router/40-opnsense-install-and-setup.md|wiki/infra/hosts/qotom-router/runbooks/install-opnsense-on-nixos.md
wiki/infra/hosts/qotom-router/45-virt-install-examples.md|wiki/infra/hosts/qotom-router/howto/virt-install-examples.md
wiki/infra/hosts/qotom-router/50-postinstall-hardening.md|wiki/infra/hosts/qotom-router/ops/postinstall-hardening.md
wiki/infra/hosts/qotom-router/60-troubleshooting.md|wiki/infra/hosts/qotom-router/troubleshooting.md
wiki/infra/hosts/qotom-router/90-checklist.md|wiki/infra/hosts/qotom-router/ops/checklist.md
libvirt/opnsense-serial-template.xml|assets/opnsense/libvirt/opnsense-serial-template.xml
scripts/vfio-bind.sh|assets/opnsense/scripts/vfio-bind.sh
scripts/virt-define-opnsense.sh|assets/opnsense/scripts/virt-define-opnsense.sh
EOF

# Apply mapping
while IFS='|' read -r SRC DST; do
  [[ -z "$SRC" ]] && continue
  if [[ -e "$SRC" ]]; then
    backup_then_move "$SRC" "$DST"
  fi
done <<< "$MAPPING"

# 2) If a source was provided, sync canonical files into place
if [[ -n "$SOURCE_PATH" ]]; then
  WORK_SRC=""
  if [[ -d "$SOURCE_PATH" ]]; then
    WORK_SRC="$SOURCE_PATH"
  elif [[ -f "$SOURCE_PATH" ]]; then
    TMPDIR="$(mktemp -d)"
    say "Unzipping source into: $TMPDIR"
    if [[ $DRY_RUN -eq 0 ]]; then
      unzip -q "$SOURCE_PATH" -d "$TMPDIR"
    else
      say "DRY: unzip -q $SOURCE_PATH -d $TMPDIR"
    fi
    WORK_SRC="$TMPDIR"
  else
    warn "--source path not found: $SOURCE_PATH"
    WORK_SRC=""
  fi

  if [[ -n "$WORK_SRC" ]]; then
    say "Syncing canonical content from: $WORK_SRC"
    if command -v rsync >/dev/null 2>&1; then
      RSYNC_OPTS="-a --info=name --exclude=.git --exclude=.github"
      if [[ $DRY_RUN -eq 1 ]]; then RSYNC_OPTS="$RSYNC_OPTS --dry-run"; fi
      rsync $RSYNC_OPTS "$WORK_SRC"/ "./"
    else
      warn "rsync not found; falling back to cp -r (may overwrite)."
      if [[ $DRY_RUN -eq 0 ]]; then
        cp -rT "$WORK_SRC" "./"
      else
        say "DRY: cp -rT $WORK_SRC ./"
      fi
    fi
  fi
fi

# 3) Make executable bits for scripts
for f in assets/opnsense/scripts/*.sh; do
  [[ -e "$f" ]] || continue
  if [[ $DRY_RUN -eq 1 ]]; then
    say "DRY: chmod +x $f"
  else
    chmod +x "$f"
  fi
done

# 4) Optionally make a commit
if [[ $DO_COMMIT -eq 1 ]]; then
  say "Adding files to Git and creating a commit..."
  if [[ $DRY_RUN -eq 1 ]]; then
    say "DRY: git add -A"
    say "DRY: git commit -m 'chore(docs): normalize qotom-router docs layout and assets'"
  else
    git add -A
    git commit -m "chore(docs): normalize qotom-router docs layout and assets"
  fi
fi

say "Done. Review with: git status"
