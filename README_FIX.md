# Repo Tree Normalizer (qotom-router)

This script fixes mismatches between the first drop (v1) and the wiki-first template (v2).

It will:
- Move/merge old files to the new locations under `wiki/infra/hosts/qotom-router/`
- Relocate `libvirt/` and `scripts/` into `assets/opnsense/`
- Optionally sync from a canonical **zip or directory** (`--source`), e.g. the v2 bundle you downloaded
- Create backups on conflicts and append content rather than clobber

## Usage

```bash
# Inside your repo (or any subdir of it)
chmod +x fix_tree.sh

# dry-run to see what it would do
./fix_tree.sh --dry-run

# apply the migration
./fix_tree.sh

# or, sync from the v2 zip you downloaded
./fix_tree.sh --source ~/Downloads/opnsense-on-nixos-guide-v2.zip

# optionally make a commit
./fix_tree.sh --commit
```

The script is idempotent and safe to re-run; it creates backups like `*.bkp.YYYYMMDD-HHMMSS` and marks migrated sources as `*.migrated.TIMESTAMP` when it needs to append into an existing destination.
