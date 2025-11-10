    ---
    service: Traefik
    listen_port_hint: 443
    depends_on:
      - DNS
  - Certificates

    ---
    # Traefik

    ## Summary
    What it does and where it runs.

    ## Endpoints (examples)
    - HTTP: `https://traefik.homelab.local` (if proxied)
    - Direct: `x.x.42.22:443` (update per host)

    ## Backing Services
    - DNS
- Certificates


    ## Notes
    - Security, backups, monitoring hooks.
