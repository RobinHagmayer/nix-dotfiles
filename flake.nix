{
  description = "Robin's NixOS configuration";

  # Match the Nixpkgs revision used by the system before the flake migration.
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/1c89083e451e891152365b799595cf7790a43325";

  outputs = { nixpkgs, ... }: {
    nixosConfigurations.E595 = nixpkgs.lib.nixosSystem {
      modules = [
        ./configuration.nix
      ];
    };
  };
}
