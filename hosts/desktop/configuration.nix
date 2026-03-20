{
  lib,
  inputs,
  keys,
  self,
  ...
}: {
  flake.nixosConfigurations.desktop = lib.nixosSystem {
    specialArgs = {
      inherit inputs keys;
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
