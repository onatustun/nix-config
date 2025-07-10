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

      modules = [
        "common"
        "nixos/clipboard"
        "nixos/locale"
        "nixos/networking"
        "nixos/user"
      ];

      ignore = [
        "apps"
        "discord"
        "ghostty"
        "rofi"
        "spotify"
        "zen"
      ];
    };
  };
}
