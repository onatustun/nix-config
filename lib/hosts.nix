{inputs, ...}: let
  mkHost = hostName: system: extraModules: let
    isLaptop = hostName == "laptop";
  in
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = {inherit inputs hostName isLaptop;};

      modules =
        [
          ../hosts/${hostName}

          ../modules/audio.nix
          ../modules/bat.nix
          ../modules/bluetooth.nix
          ../modules/boot.nix
          ../modules/direnv.nix
          ../modules/eza.nix
          ../modules/fastfetch.nix
          ../modules/fish.nix
          ../modules/fonts.nix
          ../modules/git.nix
          ../modules/locale.nix
          ../modules/nix.nix
          ../modules/packages.nix
          ../modules/starship.nix
          ../modules/tmux.nix
          ../modules/user.nix

          inputs.home-manager.nixosModules.home-manager
          inputs.stylix.nixosModules.stylix

          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";
              users.onat = import ../modules/home.nix;
              extraSpecialArgs = {inherit inputs system isLaptop;};
            };
          }
        ]
        ++ extraModules;
    };
in {
  _module.args.mkHost = mkHost;
}
