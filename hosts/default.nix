{mkNixos, ...}: {
  flake.nixosConfigurations = {
    laptop = mkNixos {
      hostName = "laptop";
      system = "x86_64-linux";
      username = "onat";

      modules = [
        "nixos"
        "shared"
      ];
    };

    desktop = mkNixos {
      hostName = "desktop";
      system = "x86_64-linux";
      username = "onat";

      modules = [
        "nixos/core"
        "nixos/gui/shared"
        "nixos/hardware"
        "shared"
      ];
    };
  };
}
