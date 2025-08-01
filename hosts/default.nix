{
  lib,
  inputs,
}: let
  inherit (lib) mkNixos;
in {
  nixosConfigurations = {
    desktop = mkNixos {
      hostName = "desktop";
      system = "x86_64-linux";
      username = "onat";
      homeVer = "24.11";
      packages = ["bibata-hyprcursor"];

      inputModules = [
        inputs.determinate.nixosModules.default
        inputs.home-manager.nixosModules.home-manager
        inputs.nix-index-database.nixosModules.nix-index
        inputs.stylix.nixosModules.stylix
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

    laptop = mkNixos {
      hostName = "laptop";
      system = "x86_64-linux";
      username = "onat";
      homeVer = "24.11";
      packages = ["bibata-hyprcursor"];

      inputModules = [
        inputs.determinate.nixosModules.default
        inputs.home-manager.nixosModules.home-manager
        inputs.nix-index-database.nixosModules.nix-index
        inputs.stylix.nixosModules.stylix
      ];

      overlays = [
        inputs.niri.overlays.niri
        inputs.nur.overlays.default
      ];

      modules = [
        "nixos"
        "common"
      ];

      ignore = ["discord"];
    };

    server = mkNixos {
      hostName = "server";
      system = "x86_64-linux";
      username = "onat";
      homeVer = "24.11";

      inputModules = [
        inputs.determinate.nixosModules.default
        inputs.home-manager.nixosModules.home-manager
        inputs.nix-index-database.nixosModules.nix-index
        inputs.stylix.nixosModules.stylix
        inputs.disko.nixosModules.disko
      ];

      modules = [
        "common"
        "nixos/boot"
        "nixos/clipboard"
        "nixos/locale"
        "nixos/networking"
        "nixos/user"
      ];

      ignore = [
        "apps"
        "discord"
        "ghostty"
        "zen"
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
        inputs.nix-index-database.nixosModules.nix-index
        inputs.stylix.nixosModules.stylix
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
        "discord"
        "ghostty"
        "zen"
      ];
    };
  };

  # nixOnDroidConfigurations.pixel = mkDroid {
  #   hostName = "pixel";
  #   system = "aarch64-linux";
  #   username = "onat";

  #   modules = [
  #     "common/fonts"
  #     "common/nh"
  #     "common/nix"
  #     "nixos/locale"
  #     "nixos/user"
  #   ];
  # };

  deploy.nodes.server = {
    hostname = "23.88.34.248";

    profiles.system = {
      sshUser = "root";
      user = "root";
      magicRollback = false;

      path =
        inputs.deploy-rs.lib.x86_64-linux.activate.nixos
        inputs.self.nixosConfigurations.server;
    };
  };
}
