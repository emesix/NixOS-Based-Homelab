{ pkgs, ... }:
{
  virtualisation.docker.enable = true;

  systemd.services."docker-networks" = {
    after = [ "docker.service" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig.Type = "oneshot";
    script = ''
      set -e
      docker network inspect svc-frontend >/dev/null 2>&1 ||         docker network create -d macvlan -o parent=nic_fe           --subnet 10.42.10.0/24 --gateway 10.42.10.1 svc-frontend
      docker network inspect svc-backend >/dev/null 2>&1 ||         docker network create -d macvlan -o parent=vlan20           --subnet 10.42.20.0/24 --gateway 10.42.20.1 svc-backend
    '';
  };
}
