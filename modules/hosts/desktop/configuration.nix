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
  flake.nixosConfigurations.desktop = nixosSystem {
    specialArgs = {
      inherit inputs keys;
      hostName = "desktop";
      username = "onat";
    };

    modules =
      attrValues {
        inherit (self.nixosModules)
          audio
          bluetooth
          core
          desktop-hardware
          desktop-host
          fonts
          gdm
          ghostty
          graphics
          helix
          home-manager
          keyring
          loader
          locale
          networking
          niri
          nix
          nix-index
          nixpkgs
          noctalia
          nur
          nushell
          printing
          ragenix
          ssh
          stylix
          tailscale
          thunar
          users
          yubikey
          zen-browser
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
              desktop-hm
              direnv
              eza
              fastfetch
              fish
              gh
              git
              jujutsu
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
              zoxide
              zsh
              ;
          };
        }
      );
  };
}
