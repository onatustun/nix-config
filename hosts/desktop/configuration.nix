{
  lib,
  inputs,
  self,
  keys,
  ...
}: {
  flake.nixosConfigurations.desktop = lib.nixosSystem {
    specialArgs = {
      inherit inputs self keys;

      hostName = "desktop";
      username = "onat";
    };

    modules = lib.attrsets.attrValues (lib.attrsets.getAttrs [
        "core"
        "desktop"
        "desktop-hardware"
        "desktop-host"
        "home-manager"
        "niri"
        "system"
        "terminal"
        "ui"
      ]
      self.nixosModules);
  };
}
