{ config, ... }:
let inv = config.homelab.inventory;
    mk = p: "d ${p.path} ${p.mode} ${p.user} ${p.group} -";
in {
  systemd.tmpfiles.rules = map mk inv.paths;
}
