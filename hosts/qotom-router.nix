{ pkgs, ... }:
{
  networking.hostName = "qotom-router";
  virtualisation.libvirtd.enable = true;
  users.users.root.extraGroups = [ "libvirtd" ];
}
