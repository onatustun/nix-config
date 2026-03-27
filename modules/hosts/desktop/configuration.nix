{
  lib,
  inputs,
  keys,
  self,
  ...
}: {
  flake.nixosConfigurations.desktop = lib.nixosSystem {
    specialArgs = {
      inherit inputs keys;
      hostName = "desktop";
      username = "onat";
    };

    modules =
      lib.attrsets.attrValues {
        inherit
          (self.nixosModules)
          "audio"
          "bluetooth"
          "core"
          "desktop-hardware"
          "desktop-host"
          "fonts"
          "gdm"
          "ghostty"
          "graphics"
          "helix"
          "home-manager"
          "keyring"
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
          "ragenix"
          "security-core"
          "ssh"
          "stylix"
          "tailscale"
          "thunar"
          "users"
          "yubikey"
          "zen-browser"
          ;
      }
      ++ lib.lists.singleton ({
        lib,
        inputs,
        ...
      }: {
        home-manager.sharedModules = lib.attrsets.attrValues {
          inherit
            (inputs.self.homeModules)
            "archivers"
            "bash"
            "bat"
            "carapace"
            "cli-nix"
            "cli-utils"
            "cursor"
            "desktop-hm"
            "direnv"
            "eza"
            "fastfetch"
            "fish"
            "gh"
            "git"
            "jujutsu"
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
            "zoxide"
            "zsh"
            ;
        };
      });
  };
}
