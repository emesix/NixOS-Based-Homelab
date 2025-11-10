{ config, ... }:
let inv = config.homelab.inventory;
in {
  users.groups = {
    "svc-db"    = { gid = inv.gids."svc-db"; };
    "svc-web"   = { gid = inv.gids."svc-web"; };
    "svc-media" = { gid = inv.gids."svc-media"; };
    "postgres"  = { gid = inv.gids."postgres"; };
  };

  users.users = {
    postgres = {
      uid = inv.uids."postgres"; group = "postgres";
      isSystemUser = true; home = "/srv/containers/postgres";
    };
  };
}
