{inputs, ...}: let
  mkNixos = hostName: system: extraModules: let
    isLaptop = hostName == "laptop";
    inherit (inputs) self;
  in
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {inherit hostName inputs isLaptop;};

      modules =
        [
          (self + /hosts/${hostName})
          (self + /modules/audio.nix)
          (self + /modules/bat.nix)
          (self + /modules/bluetooth.nix)
          (self + /modules/boot.nix)
          (self + /modules/direnv.nix)
          (self + /modules/eza.nix)
          (self + /modules/fastfetch.nix)
          (self + /modules/fish.nix)
          (self + /modules/fonts.nix)
          (self + /modules/git.nix)
          (self + /modules/nix.nix)
          (self + /modules/packages.nix)
          (self + /modules/starship.nix)
          (self + /modules/tmux.nix)
          (self + /modules/user.nix)

          inputs.home-manager.nixosModules.home-manager
          inputs.stylix.nixosModules.stylix

          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";
              users.onat = import (self + /modules/home.nix);
              extraSpecialArgs = {inherit inputs isLaptop system;};
            };
          }
        ]
        ++ extraModules;
    };
in {
  _module.args.mkNixos = mkNixos;
}
