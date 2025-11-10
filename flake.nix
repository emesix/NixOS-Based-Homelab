{
  description = "NixOS Based Homelab — bootstrap (Qotom + 2x HX310)";
  inputs.nixpkgs.url = "nixpkgs/nixos-24.11";
  outputs = { self, nixpkgs }: let
    lib = nixpkgs.lib;
    mk = host: lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./modules/inventory.nix
        ./modules/net-from-inventory.nix
        ./modules/users-from-inventory.nix
        ./modules/tmpfiles-from-inventory.nix
        ./modules/docker-nets.nix
        ./modules/containers-from-inventory.nix
        ./hosts/${host}.nix
      ];
    };
  in {
    nixosConfigurations = {
      qotom-router = mk "qotom-router";
      hx310-db     = mk "hx310-db";
      hx310-arr    = mk "hx310-arr";
    };
  };
}
