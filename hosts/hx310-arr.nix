{ ... }:
{
  networking.hostName = "hx310-arr";
  # Example NFS mounts:
  # fileSystems."/srv/downloads" = { device = "nas:/exports/downloads"; fsType = "nfs"; options = [ "noatime" "nfsvers=4.2" ]; };
  # fileSystems."/srv/media"     = { device = "nas:/exports/media";     fsType = "nfs"; options = [ "noatime" "nfsvers=4.2" ]; };
}
