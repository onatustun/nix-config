{inputs, ...}: let
  mkHost = hostName: system: extraModules:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = {
        inherit inputs hostName;
        isLaptop = hostName == "laptop";
      };

      modules =
        [
          ../hosts/${hostName}

          ../modules/audio.nix
          ../modules/bat.nix
          ../modules/bluetooth.nix
          ../modules/boot.nix
          ../modules/brave.nix
          ../modules/direnv.nix
          ../modules/eza.nix
          ../modules/fastfetch.nix
          ../modules/fish.nix
          ../modules/fonts.nix
          ../modules/gdm.nix
          ../modules/ghostty.nix
          ../modules/git.nix
          ../modules/graphics.nix
          ../modules/hyprland.nix
          ../modules/locale.nix
          ../modules/niris.nix
          ../modules/nix.nix
          ../modules/packages.nix
          ../modules/starship.nix
          ../modules/swayidle.nix
          ../modules/swaylock.nix
          ../modules/tmux.nix
          ../modules/user.nix
          ../modules/xwayland.nix

          inputs.home-manager.nixosModules.home-manager
          inputs.stylix.nixosModules.stylix

          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";
              users.onat = import ../modules/home.nix;

              extraSpecialArgs = {
                inherit inputs system;
                isLaptop = hostName == "laptop";
              };
            };
          }
        ]
        ++ extraModules;
    };
in {
  _module.args.mkHost = mkHost;
}
