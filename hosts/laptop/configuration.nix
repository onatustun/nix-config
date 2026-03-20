{
  lib,
  inputs,
  keys,
  self,
  ...
}: {
  flake.nixosConfigurations.laptop = lib.nixosSystem {
    specialArgs = {
      inherit inputs keys;
      hostName = "laptop";
      username = "onat";
    };

    modules = lib.attrsets.attrValues (lib.attrsets.getAttrs [
        "core"
        "desktop"
        "home-manager"
        "laptop-hardware"
        "laptop-host"
        "niri"
        "system"
        "terminal"
        "ui"
      ]
      self.nixosModules);
  };
}
