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
          "audio"
          "bluetooth"
          "core"
          "fonts"
          "gdm"
          "ghostty"
          "graphics"
          "helix"
          "home-manager"
          "keyring"
          "laptop-hardware"
          "laptop-host"
          "loader"
          "locale"
          "networking"
          "niri"
          "nix-core"
          "nix-index"
          "nixpkgs"
          "noctalia"
          "nur"
          "nushell"
          "printing"
          "ragenix"
          "ssh"
          "stylix"
          "tailscale"
          "thunar"
          "users"
          "yubikey"
          "zen-browser"
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
              "archivers"
              "bash"
              "bat"
              "carapace"
              "cli-nix"
              "cli-utils"
              "cursor"
              "direnv"
              "eza"
              "fastfetch"
              "fish"
              "gh"
              "git"
              "jujutsu"
              "laptop-hm"
              "media"
              "nh"
              "obsidian"
              "proton"
              "soulseek"
              "starship"
              "swayidle"
              "tmux"
              "tui-utils"
              "wayland-utils"
              "wayvnc"
              "wl-clipboard"
              "xdg"
              "xwayland"
              "yazi"
              "zathura"
              "zmkbatx"
              "zoxide"
              "zsh"
              ;
          };
        }
      );
  };
}
