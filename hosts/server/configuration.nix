{
  lib,
  inputs,
  self,
  keys,
  ...
}: {
  flake.nixosConfigurations.server = lib.nixosSystem {
    specialArgs = {
      inherit inputs self keys;

      hostName = "server";
      username = "onat";
    };

    modules = lib.attrsets.attrValues (lib.attrsets.getAttrs [
        "cli"
        "core"
        "disko"
        "home-manager"
        "kernel"
        "loader"
        "locale"
        "network"
        "nix"
        "scx"
        "security"
        "server-hardware"
        "server-host"
        "shells"
        "tui"
        "ui"
        "users"
      ]
      self.nixosModules);
  };
}
