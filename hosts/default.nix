{
  lib,
  inputs,
}: let
  inherit (lib) mkNixos;
in {
  nixosConfigurations = {
    laptop = mkNixos {
      hostName = "laptop";
      system = "x86_64-linux";
      username = "onat";
      homeVer = "24.11";
      packages = ["bibata-hyprcursor"];

      inputModules = [
        inputs.determinate.nixosModules.default
        inputs.home-manager.nixosModules.home-manager
      ];

      overlays = [
        inputs.niri.overlays.niri
        inputs.nur.overlays.default
      ];

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

      inputModules = [
        inputs.determinate.nixosModules.default
        inputs.home-manager.nixosModules.home-manager
      ];

      overlays = [inputs.nur.overlays.default];

      modules = [
        "nixos"
        "common"
      ];

      ignore = [
        "niri"
        "swayidle"
        "xwayland"
      ];
    };

    wsl = mkNixos {
      hostName = "wsl";
      system = "x86_64-linux";
      username = "onat";
      homeVer = "24.11";

      inputModules = [
        inputs.determinate.nixosModules.default
        inputs.home-manager.nixosModules.home-manager
      ];

      modules = [
        "common"
        "nixos/clipboard"
        "nixos/locale"
        "nixos/networking"
        "nixos/user"
      ];

      ignore = [
        "apps"
        "brave"
        "discord"
        "ghostty"
        "spotify"
        "zen"
      ];
    };
  };
}
