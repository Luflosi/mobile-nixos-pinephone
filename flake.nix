{
  description = "Example NixOS configuration for the PinePhone";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    mobile-nixos.url = "github:samueldr-wip/mobile-nixos-wip/fix/drop-composeConfig";
    mobile-nixos.flake = false;
  };

  outputs = inputs@{ self, ... }: {
    nixosConfigurations = let
      specialArgs = {
        inherit inputs;
      };
    in {
      phone = inputs.nixpkgs.lib.nixosSystem {
        #system = "aarch64-linux";
        inherit specialArgs;
        modules = [
          ./configuration.nix
          ({config, ...}: {
            nixpkgs.pkgs = inputs.nixpkgs.legacyPackages.${config.nixpkgs.hostPlatform.system};
          })
        ];
      };
    };
  };
}
