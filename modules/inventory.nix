{ lib, ... }:
let
  inv = builtins.fromJSON (builtins.readFile /etc/nixos/inventory.json);
  byName = name: lib.findFirst (h: h.name == name) (throw "host not found: ${name}") inv.hosts;
in {
  options.homelab.inventory = lib.mkOption { default = inv; readOnly = true; };
  config.homelab.lookupHost = byName;
}
