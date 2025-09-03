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
        inputs.home-manager.nixosModules.default
        inputs.nix-index-database.nixosModules.nix-index
        inputs.stylix.nixosModules.stylix
      ];

      overlays = [
        inputs.nix-index-database.overlays.nix-index
        inputs.nuenv.overlays.default
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
        inputs.home-manager.nixosModules.default
        inputs.nix-index-database.nixosModules.nix-index
        inputs.stylix.nixosModules.stylix
      ];

      overlays = [
        inputs.niri.overlays.niri
        inputs.nix-index-database.overlays.nix-index
        inputs.nuenv.overlays.default
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
        inputs.disko.nixosModules.default
        inputs.home-manager.nixosModules.default
        inputs.nix-index-database.nixosModules.nix-index
        inputs.stylix.nixosModules.stylix
      ];

      overlays = [
        inputs.nix-index-database.overlays.nix-index
        inputs.nuenv.overlays.default
      ];

      modules = [
        "common"
        "nixos/system"
        "nixos/ui"
      ];

      ignore = [
        "apps"
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
        inputs.home-manager.nixosModules.default
        inputs.nix-index-database.nixosModules.nix-index
        inputs.stylix.nixosModules.stylix
      ];

      overlays = [
        inputs.nix-index-database.overlays.nix-index
        inputs.nuenv.overlays.default
      ];

      modules = [
        "common"
        "nixos/cli/clipboard.nix"
        "nixos/system"
        "nixos/ui"
      ];

      ignore = [
        "apps"
        "boot.nix"
        "kernel.nix"
        "tmp.nix"
      ];
    };
  };
}
