{
  mkNixos,
  inputs,
  ...
}: {
  flake.nixosConfigurations = {
    laptop = mkNixos {
      hostName = "laptop";
      system = "x86_64-linux";
      username = "onat";
      packages = ["bibata-hyprcursor"];
      overlays = [inputs.niri.overlays.niri];

      modules = [
        "nixos"
        "shared"
      ];
    };

    desktop = mkNixos {
      hostName = "desktop";
      system = "x86_64-linux";
      username = "onat";
      packages = ["bibata-hyprcursor"];

      modules = [
        "nixos/core"
        "nixos/gui/shared"
        "nixos/hardware"
        "shared"
      ];
    };

    server = mkNixos {
      hostName = "server";
      system = "x86_64-linux";
      username = "onat";

      modules = [
        "nixos/core"
        "shared/cli"
        "shared/core"
        "shared/dev"
        "shared/shell"
      ];
    };
  };
}
