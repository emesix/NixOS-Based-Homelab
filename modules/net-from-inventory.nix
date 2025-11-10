{ config, lib, pkgs, ... }:
let
  inv = config.homelab.inventory;
  host = config.homelab.lookupHost config.networking.hostName;
in {
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  networking.useNetworkd = true;

  systemd.network.links = [
    { matchConfig.MACAddress = host.fe.mac; linkConfig.Name = "nic_fe"; }
    { matchConfig.MACAddress = host.be.mac; linkConfig.Name = "nic_be"; }
  ];

  systemd.network.networks."10-fe" = {
    matchConfig.Name = "nic_fe";
    address = [ host.fe.ip ];
    gateway = inv.subnets.fe.gw;
    dns = [ inv.subnets.fe.gw ];
  };

  systemd.network.vlans."vlan20" = { id = inv.vlans.be; link = "nic_be"; };
  systemd.network.networks."20-be" = {
    matchConfig.Name = "vlan20";
    address = [ host.be.ip ];
    networkConfig.MTUBytes = (host.be.mtu or 1500);
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 10;

  services.openssh = {
    enable = true;
    openFirewall = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      MaxAuthTries = 3;
      LoginGraceTime = "20s";
    };
  };

  networking.firewall.enable = true;
}
