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
      homeVer = "24.11";
      packages = ["bibata-hyprcursor"];
      overlays = [inputs.niri.overlays.niri];

      modules = [
        "nixos"
        "common"
      ];
    };

    desktop = mkNixos {
      hostName = "desktop";
      system = "x86_64-linux";
      username = "onat";
      homeVer = "24.11";
      packages = ["bibata-hyprcursor"];

      modules = [
        "nixos/core"
        "nixos/gui/shared"
        "nixos/hardware"
        "common"
      ];
    };

    wsl = mkNixos {
      hostName = "wsl";
      system = "x86_64-linux";
      username = "onat";
      homeVer = "24.11";

      modules = [
        "common/core"
        "common/cli"
        "common/gui"
        "common/shell"
      ];

      extraModules = [
        (inputs.self + /modules/nixos/core/networking.nix)
        (inputs.self + /modules/nixos/core/user.nix)
      ];
    };
  };
}
