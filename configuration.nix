{ inputs, ... }:

{
  imports = [
    (import "${inputs.mobile-nixos}/lib/configuration.nix" {
      device = "pine64-pinephone";
    })
    (import "${inputs.mobile-nixos}/examples/phosh/phosh.nix")
  ];

  networking.hostName = "phone";

  services.xserver.desktopManager.phosh.user = "asdf";

  nixpkgs.hostPlatform = "aarch64-linux";

  system.stateVersion = "25.05";
}
