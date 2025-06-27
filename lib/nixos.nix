{inputs, ...}: let
  inherit (inputs) self;
  mkNixos = hostName: system: extraModules: let
    isLaptop = hostName == "laptop";
  in
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {inherit hostName inputs isLaptop;};

      modules =
        [
          (self + /hosts/${hostName})

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

  profiles = {
    core = [
      (self + /modules/nix.nix)
      (self + /modules/user.nix)
    ];

    cli = [
      (self + /modules/bat.nix)
      (self + /modules/direnv.nix)
      (self + /modules/eza.nix)
      (self + /modules/fastfetch.nix)
      (self + /modules/fish.nix)
      (self + /modules/git.nix)
      (self + /modules/starship.nix)
      (self + /modules/tmux.nix)
    ];

    hardware = [
      (self + /modules/audio.nix)
      (self + /modules/bluetooth.nix)
      (self + /modules/boot.nix)
      (self + /modules/graphics.nix)
    ];

    apps = [
      (self + /modules/brave.nix)
      (self + /modules/ghostty.nix)
    ];

    gui = [
      (self + /modules/fonts.nix)
      (self + /modules/gdm.nix)
      (self + /modules/hyprland.nix)
      (self + /modules/swaylock.nix)
      (self + /modules/xwayland.nix)
    ];
  };
in {
  _module.args = {inherit mkNixos profiles;};
}
