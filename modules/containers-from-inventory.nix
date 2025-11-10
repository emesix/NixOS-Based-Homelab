{ config, lib, pkgs, ... }:
let
  inv  = config.homelab.inventory;
  list = inv.containers."${config.networking.hostName}" or [];
  mkEnv = env: lib.concatStringsSep " " (map (k: "--env ${k}=${env.${k}}") (builtins.attrNames env));
  mkVol = vols: lib.concatStringsSep " " (map (v: "--volume ${v}") vols);
  toSvc = c: {
    name = "docker-${c.name}";
    value = {
      after = [ "docker.service" "docker-networks.service" ];
      requires = [ "docker.service" "docker-networks.service" ];
      serviceConfig.Type = "oneshot";
      script = ''
        set -e
        docker rm -f ${c.name} >/dev/null 2>&1 || true
        docker create           ${mkVol (c.vols or [])}           --name ${c.name}           ${if c.net == "fe"   then "--network=svc-frontend --ip ${c.ip}" else ""}           ${if c.net == "be"   then "--network=svc-backend  --ip ${c.ip}" else ""}           ${if c.net == "dual" then "" else ""}           --user ${c.user}           ${mkEnv (c.env or {})}           ${c.image}
        ${if c.net == "dual" then ''
          docker network connect --ip ${c.ip_fe} svc-frontend ${c.name} || true
          docker network connect --ip ${c.ip_be} svc-backend  ${c.name} || true
        '' else ""}
        docker start ${c.name}
      '';
      wantedBy = [ "multi-user.target" ];
    };
  };
in {
  systemd.services = builtins.listToAttrs (map toSvc list);
}
