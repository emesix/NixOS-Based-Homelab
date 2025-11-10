    ---
    service: PostgreSQL
    listen_port_hint: 5432
    depends_on:
      - Backups
  - Monitoring

    ---
    # PostgreSQL

    ## Summary
    What it does and where it runs.

    ## Endpoints (examples)
    - HTTP: `https://postgresql.homelab.local` (if proxied)
    - Direct: `x.x.42.22:5432` (update per host)

    ## Backing Services
    - Backups
- Monitoring


    ## Notes
    - Security, backups, monitoring hooks.
