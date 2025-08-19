{
  lib,
  inputs,
  ...
}: let
  inherit (lib) nixosSystem';
in {
  flake.nixosConfigurations = {
    desktop = nixosSystem' {
      hostName = "desktop";
      system = "x86_64-linux";
      username = "onat";
      stateVer = "24.11";
      homeVer = "24.11";
      packages = ["bibata-hyprcursor"];

      inputModules = [
        inputs.determinate.nixosModules.default
        inputs.home-manager.nixosModules.home-manager
        inputs.nix-index-database.nixosModules.nix-index
        inputs.stylix.nixosModules.stylix
      ];

      overlays = [
        inputs.nuenv.overlays.nuenv
        inputs.nur.overlays.default
      ];

      modules = [
        "nixos"
        "common"
      ];

      ignore = [
        "niri.nix"
        "swayidle.nix"
        "xwayland.nix"
      ];
    };

    laptop = nixosSystem' {
      hostName = "laptop";
      system = "x86_64-linux";
      username = "onat";
      stateVer = "24.11";
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
        inputs.nuenv.overlays.nuenv
        inputs.nur.overlays.default
      ];

      modules = [
        "nixos"
        "common"
      ];

      ignore = ["discord.nix"];
    };

    server = nixosSystem' {
      hostName = "server";
      system = "x86_64-linux";
      username = "onat";
      stateVer = "24.11";
      homeVer = "24.11";

      inputModules = [
        inputs.determinate.nixosModules.default
        inputs.home-manager.nixosModules.home-manager
        inputs.nix-index-database.nixosModules.nix-index
        inputs.stylix.nixosModules.stylix
        inputs.disko.nixosModules.disko
      ];

      overlays = [inputs.nuenv.overlays.nuenv];

      modules = [
        "common"
        "nixos/cli/clipboard.nix"
        "nixos/system"
      ];

      ignore = [
        "common/apps"
        "toolchains"
      ];
    };

    wsl = nixosSystem' {
      hostName = "wsl";
      system = "x86_64-linux";
      username = "onat";
      stateVer = "24.11";
      homeVer = "24.11";

      inputModules = [
        inputs.determinate.nixosModules.default
        inputs.home-manager.nixosModules.home-manager
        inputs.nix-index-database.nixosModules.nix-index
        inputs.stylix.nixosModules.stylix
      ];

      overlays = [inputs.nuenv.overlays.nuenv];

      modules = [
        "common"
        "nixos/cli/clipboard.nix"
        "nixos/system"
        "nixos/ui"
      ];

      ignore = [
        "boot.nix"
        "common/apps"
        "xdg.nix"
      ];
    };
  };
}
