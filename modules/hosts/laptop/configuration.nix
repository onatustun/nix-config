{
  lib,
  inputs,
  keys,
  self,
  ...
}:
let
  inherit (lib) nixosSystem;
  inherit (lib.attrsets) attrValues;
  inherit (lib.lists) singleton;
in
{
  flake.nixosConfigurations.laptop = nixosSystem {
    specialArgs = {
      inherit inputs keys;
      hostName = "laptop";
      username = "onat";
    };

    modules =
      attrValues {
        inherit (self.nixosModules)
          audio
          bluetooth
          core
          fonts
          gdm
          ghostty
          graphics
          helix
          home-manager
          keyring
          laptop-hardware
          laptop-host
          loader
          locale
          networking
          niri
          nix
          nix-index
          noctalia
          nushell
          printing
          ragenix
          ssh
          stylix
          tailscale
          thunar
          users
          yubikey
          ;
      }
      ++ singleton (
        { lib, inputs, ... }:
        let
          inherit (lib.attrsets) attrValues;
        in
        {
          home-manager.sharedModules = attrValues {
            inherit (inputs.self.homeModules)
              bash
              bat
              carapace
              cli
              cursor
              direnv
              eza
              fastfetch
              fish
              gh
              git
              helium
              jujutsu
              laptop-hm
              media
              nh
              nix-tools
              obsidian
              proton
              starship
              swayidle
              tmux
              tui
              wayland
              wayvnc
              wl-clipboard
              xdg
              xwayland
              yazi
              zathura
              zmkbatx
              zoxide
              zsh
              ;
          };
        }
      );
  };
}
