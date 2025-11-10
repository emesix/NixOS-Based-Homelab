# Deploy Runbook

## Preflight
- Verify secrets available (sops)
- Connectivity to hosts

## Steps
1. Update docs/services/hosts as needed
2. Commit and push
3. (When Nix modules exist) `deploy-rs .#<host>`

## Post
- Smoke tests (HTTP 200, DB connect, etc.)
